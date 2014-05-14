/* do the settings for RTcmix */

set_option("clobber=1")
set_option("play=0")
set_option("audio=0")
rtsetparams(44100, 2)
rtoutput("coda.aif")

load("JCHOR")
load("BUTTER")
load("STEREO")
load("FREEVERB")

bus_config("JCHOR", "in 0-1", "aux 0-1 out")
bus_config("STEREO", "in 0-1", "aux 0-1 out")
bus_config("BUTTER", "aux 0-1 in", "aux 2-3 out")
bus_config("FREEVERB", "aux 2-3 in", "out 0-1")

/* grab the current unix timestamp from the command line argument */

curDate = f_arg(0)
printf(" %f is curDate\n", curDate)
startDate = 1399256115 /* May 2014 */
endDate = 2346027273 /* the year 2044 */
percent = (curDate - startDate) / (endDate - startDate)

/* the musical blocks */

lh1 = {"coda-sounds/Piano.ff.C3.aif", "coda-sounds/Piano.ff.E3.aif"}
lh2 = {"coda-sounds/Piano.ff.Bb2.aif", "coda-sounds/Piano.ff.F3.aif"}
lh3 = {"coda-sounds/Piano.ff.A2.aif", "coda-sounds/Piano.ff.F3.aif"}
lhb1 = { "coda-sounds/Piano.ff.C1.aif"}
lhb2 = { "coda-sounds/Piano.ff.Bb0.aif"}
lhb3 = { "coda-sounds/Piano.ff.A1.aif"}
rh1 = "coda-sounds/Piano.ff.G3.aif"
rh2 = "coda-sounds/Piano.ff.C4.aif"
rh3 = "coda-sounds/Piano.ff.D4.aif"
lh = {lh1, lh2, lh3}
lhb = {lhb1, lhb2, lhb3}
rh = {rh1, rh2, rh3}

/* constants */

enDur = 0.32608696 /* dur of eighth note */
mDur = 2.60869564 /* dur of full measure */
dur = 180 /* dur of whole piece */
grainenv = maketable("window", 1000, "hanning")

/* make the music, left hand */

st = 0  /* start time for loop */
lastIndex = -1
while (st < dur) {
        /* calculate a position metric based on current st time and our time up to 2044 */
        percentThroughSong = st / dur * (1.0-percent) + percent
        /* pick random dur btwn 1 and 6 eighth notes long */
        thisDur = enDur * trand(8, 48)
        /* random decision on whether this is sound or silence */
        if (random() > pow(percentThroughSong, 2.5)) {
                index = lastIndex
                /* pick a chord different from the last one */
                while (index == lastIndex) {
                        index = trand(0, len(lh))
                }
                chord = lh[index]
                /* iterate through each note in the chord */
                for (noteIndex = 0; noteIndex < len(chord); noteIndex = noteIndex + 1) {
                        note = chord[noteIndex]
                        rtinput(note) /* load the corresponding sound file */
                        ampenv = maketable("line", 1000, 0,0, 1,1, thisDur-1,1, thisDur,0)
                        /* play it with a granular-style technique, chorale-like */
                        JCHOR(st, 0, thisDur, 5, 1, 0, 5, 0.5, 2, 0.01, 0.5, 0, 0, 2 * ampenv, grainenv)
                        /* second JCHOR with shorter time values, more static-y results
                         * as we move through song (and time), use fewer grains and a smaller
                         * segment of the original sound file as material */
                        numgrains =  45 * pow((1-percentThroughSong),2) + 1
                        infileDur = 0.07 * pow((1-percentThroughSong),2) + 0.04
                        /* play it with a granular-style technique */
                        JCHOR(st, 0, thisDur, infileDur, 1, 0, numgrains, 0.5, 2, 0.01, 0.5, 0, 0, 0.2 * ampenv, grainenv)
                }
                /* randomly (and more as we move through the song) play an octave below too */
                if (random() < (percentThroughSong * 0.33)) {
                        chord = lhb[index]
                        note = chord[0]
                        pan = 0.5
                        rtinput(note)
                        /* play the original piano sound, no granular processing */
                        STEREO(st, 0, DUR(), 0.5, 0, 1)
                }
                lastIndex = index
        }
        st = st + thisDur
}

/* make the music, right hand */

st = 0 /* start time for loop */
lastIndex = -1
while (st < dur) {
        /* calculate a position metric based on current st time and our time up to 2044 */
        percentThroughSong = st / dur * (1.0-percent) + percent
        /* random decision on whether this is sound or silence */
        if (random() > pow(percentThroughSong, 3.5)) {
                index = lastIndex
                /* pick a note different from the last one */
                while (index == lastIndex) {
                        index = trand(0, len(rh))
                }
                note = rh[index]
                /* pick random dur btwn 1 and 16 measures long */
                thisDur = mDur * trand(1,16)
                rtinput(note) /* load the corresponding sound file */
                ampenv = maketable("line", 1000, 0,0, 1,1, thisDur-1,1, thisDur,0)
                /* as we move through song (and time), use fewer grains and a smaller
                 * segment of the original sound file as material */
                numgrains =  35 * pow((1-percentThroughSong),2) + 1
                infileDur = 0.06 * pow((1-percentThroughSong),2) + 0.02
                /* play it with a granular-style technique */
                JCHOR(st, 0, thisDur, infileDur, 1, 0, numgrains, 0.5, 2, 0.01, 0.5, 0, 0, 0.2 * ampenv, grainenv)
        }
        st = st + thisDur
}

/* add a lowpass filter that cuts out higher frequencies as we move through the song (and time) */
cutoff = maketable("curve", "nonorm", 1024, 0, (1.0-percent) * 9960 + 40, -2.5, dur + 20, 40)
BUTTER(0, 0, dur + 20, 1, "lowpass", 1, 1, 0, 0.5, 0, cutoff)

/* add in more reverb as we move through the song (and time) */
dry = maketable("line", "nonorm", 100, 0,45*(1.0-percent)+40, dur,40)
wet = maketable("line", "nonorm", 100, 0,55.0*percent+15, dur,60)
FREEVERB(0, 0, dur + 5, 2.5, 0.9, 0.001, 4.0, 71, dry, wet, 25)