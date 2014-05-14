#!/bin/bash
DATE=$(/bin/date +%s)
cd /home/jfreeman/GrowOld/scripts/

#run the scripts
/usr/local/src/RTcmix/bin/CMIX $DATE < alec5.sco
/usr/local/src/RTcmix/bin/CMIX $DATE < jonathan3.sco
/usr/local/src/RTcmix/bin/CMIX $DATE < leah3.sco
/usr/local/src/RTcmix/bin/CMIX $DATE < coda3.sco

#upload the new files to archive.org
FILENAMEDATE=$(/bin/date +"%m-%d-%Y")
/usr/bin/curl --location \
    --header "authorization: LOW AUTHORIZATION_KEY_GOES_HERE" \
    --upload-file alec.aif http://s3.us.archive.org/jason_freeman_grow_old/Saturns_Moons_$FILENAMEDATE.aif
/usr/bin/curl --location \
    --header "authorization: LOW AUTHORIZATION_KEY_GOES_HERE" \
    --upload-file jonathan.aif http://s3.us.archive.org/jason_freeman_grow_old/Toy_Piano_$FILENAMEDATE.aif
/usr/bin/curl --location \
    --header "authorization: LOW AUTHORIZATION_KEY_GOES_HERE" \
    --upload-file leah.aif http://s3.us.archive.org/jason_freeman_grow_old/Infinite_Snowflake_$FILENAMEDATE.aif
/usr/bin/curl --location \
    --header "authorization: LOW AUTHORIZATION_KEY_GOES_HERE" \
    --upload-file coda.aif http://s3.us.archive.org/jason_freeman_grow_old/Coda_$FILENAMEDATE.aif