/* do the settings for RTcmix */

set_option("clobber=1")
set_option("play=0")
set_option("audio=0")
rtsetparams(44100, 2)
rtoutput("alec.aif")

load("STRUM")
load("FREEVERB")
load("WAVETABLE")
bus_config("START", "aux 0-1 out")
bus_config("FREEVERB", "aux 0-1 in", "out 0-1")

/* grab the current unix timestamp from the command line argument */

curTime = f_arg(0)
printf(" %f is curTime\n", curTime)

/* basic data */

// higher pitches in cluster == smaller radius for moon
melody = { 10.09, 10.08, 10.05, 10.03, 10.02, 10, 9.10 }
// moon names are just for reference
moons = {"Mimas", "Enceladus", "Tethys", "Dione", "Rhea", "Titan", "Iapetus"}
// diameter of each moon
diameter = {0.12, 0.14, 0.3, 0.32, 0.44, 1.48, 0.42}
// size rankings of moon diameters
diameterRank = {6, 5, 4, 3, 1, 0, 2 }
// orbital period in days of each moon
periodInDays = {0.9, 1.4, 1.9, 2.7, 4.5, 16, 79}
// radius of each moon's orbit
radius = {0.5, 0.6, 0.8, 1, 1.4, 3.2, 9.3}
// mass of each moon
mass = {0.0005, 0.002, 0.008, 0.015, 0.03, 1.8, 0.025}
// mass rankings of moons
massRank = {6, 5, 4, 3, 1, 0, 2 }

// init these to dummy values, set for real later
// these are arbitrary just for spacing for initial values so everything doesn't start off at zero phase
newMoonTime = {0, 86400000/7, 86400000*2/7, 86400000*3/7, 86400000*4/7, 86400000*5/7, 86400000*6/7}
// will be set later, starting phase for each moon for this execution
startMoonPhase = {0, 0, 0, 0, 0, 0, 0}
// will be set later, amount of orbits for each moon for this execution (which represents 1 day of real time)
numPhaseCycles = {1, 1, 1, 1, 1, 1, 1}

msInADay = 86400000.0
totalDur = 240 // duration of piece in seconds
maxNoteVal = 2.5 // max duration of an individual note in seconds
minNoteVal = 0.1 // min duration of an individual note in seconds
minDb = 40 // max dB of an individual note
maxDb = 90 // min dB of an individual note
durSineWaveIntro = 8

/* compute starting and ending phases for each moon; 0 or 1 is new and 0.5 is full */

for (i=0; i < len(moons); i=i+1) {
        startMoonPhase[i] = (curTime - newMoonTime[i]) / (periodInDays[i] * msInADay)
        startMoonPhase[i] = startMoonPhase[i] - trunc(startMoonPhase[i])
        numPhaseCycles[i] = 1.0 / periodInDays[i]
        printf("moon %f start %f cycles %f\n\n", i, startMoonPhase[i], numPhaseCycles[i])
}

/* now make some sound */

for (i=0; i < len(moons); i=i+1) {
        // we generate phase envelopes from a sound file of an abs value of a 1 Hz
        // sine wave, setting duration and inskip to match the moon
        sfInskip = startMoonPhase[i] * 44100.0 / 2 * -1.0
        sfDur = numPhaseCycles[i] * 44100.0 / 2 * -1.0
        phaseenv = maketable("soundfile", 1000, "1Hzsine.aif", sfDur, sfInskip, 1)
        
        // note duration goes with the phase envelope
        // (but we must do manually because STRUM does not support maketable)
        noteDur = minNoteVal + (maxNoteVal - minNoteVal) * samptable(phaseenv, "interp", 0)
        for (st=0;st < totalDur; st = st + noteDur) {
                // amp goes with the phase envelope too, also manually
                amp = ampdb(minDb + (maxDb - minDb) * samptable(phaseenv, "interp", (st / totalDur) * tablelen(phaseenv)))
                // tiny random variation in start time
                actualSt = st + rand() * 0.005
                // tiny random variation in duration
                actualNoteDur = noteDur + rand() * 0.01 * noteDur
                // nyquist decay goes with mass ranking
                decay = actualNoteDur * 0.5 + actualNoteDur * 0.5 * (massRank[i] + 1) / len(moons)
                // map larger diameter moons to harder plectrums
                squish = diameterRank[i] / 2 + 2
                // pan goes with phase envelope, but at half speed so center pan = full moon
                pan = samptable(phaseenv, "interp", (st * 0.5 / totalDur) * tablelen(phaseenv))
                if (actualSt >= 0) {
                        // play the note
                        START(actualSt + durSineWaveIntro / 2, actualNoteDur, melody[i], actualNoteDur, decay, amp, squish, pan)
                }
                // update noteDur for next time
                noteDur = maxNoteVal - (maxNoteVal - minNoteVal) * samptable(phaseenv, "interp", (st / totalDur) * tablelen(phaseenv))
        }
}

// add some spacey reverb
FREEVERB(0, 0, totalDur + durSineWaveIntro, 1.25, 0.9, 0.001, 4.0, 71, 40, 60, 25)

/* now use the rotation period of Saturn to control a siney drone's changing amplitude */
periodInDays = 0.44375
newMoonTime = 0
startMoonPhase = (curTime - newMoonTime) / (periodInDays * msInADay)
startMoonPhase = startMoonPhase - trunc(startMoonPhase)
numPhaseCycles = 1.0 / periodInDays
printf("saturn rotation start %f cycles %f\n\n", startMoonPhase, numPhaseCycles)
sfInskip = startMoonPhase * 44100.0 / 2 * -1.0
sfDur = numPhaseCycles * 44100.0 / 2 * -1.0
ampenv = maketable("soundfile", 1000, "1Hzsine.aif", sfDur, sfInskip, 1)
fadeinout = maketable("line", 1000, 0,0, 1,1, 190,1, 200,0)
wave = maketable("wave", 1000, 1, 0.25, 0.01, 0.01)
ampenv = mul(ampenv, fadeinout)
WAVETABLE(0, totalDur + durSineWaveIntro, 17000 * ampenv, 5.01, 0.5, wave)