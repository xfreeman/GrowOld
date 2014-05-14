#!/bin/bash
DATE=$(/bin/date +"%m-%d-%Y")
cd /home/jfreeman/GrowOld/scripts/

# this script should run hourly to see if archive.org finished transcoding the audio files and they are now available

# compare stored date to current date
STOREDDATE=$(cat filenamedate.txt)

# if the date matches stored date, we are done.

if [ "$DATE" == "$STOREDDATE" ];
then
    echo "Already using current date."
    exit
fi

# otherwise, see if all the files exist and if so then update stored date.

url="https://archive.org/download/jason_freeman_grow_old/Saturns_Moons_"
extension=".mp3"
url=$url$DATE$extension
echo $url
response=$(/usr/bin/curl -L -I -k -s $url)
echo "$response"
searchString="404 Not Found"
if [[ "$response" =~ "$searchString" ]];
then
    echo "Transcoding not yet complete on archive.org for Saturns Moons"
    exit
fi

url="https://archive.org/download/jason_freeman_grow_old/Toy_Piano_"
extension=".mp3"
url=$url$DATE$extension
echo $url
response=$(/usr/bin/curl -L -I -k -s $url)
echo "$response"
searchString="404 Not Found"
if [[ "$response" =~ "$searchString" ]];
then
    echo "Transcoding not yet complete on archive.org for Toy Piano"
    exit
fi

url="https://archive.org/download/jason_freeman_grow_old/Infinite_Snowflake_"
extension=".mp3"
url=$url$DATE$extension
echo $url
response=$(/usr/bin/curl -L -I -k -s $url)
echo "$response"
searchString="404 Not Found"
if [[ "$response" =~ "$searchString" ]];
then
    echo "Transcoding not yet complete on archive.org for Infinite Snowflake"
    exit
fi

url="https://archive.org/download/jason_freeman_grow_old/Coda_"
extension=".mp3"
url=$url$DATE$extension
echo $url
response=$(/usr/bin/curl -L -I -k -s $url)
echo "$response"
searchString="404 Not Found"
if [[ "$response" =~ "$searchString" ]];
then
    echo "Transcoding not yet complete on archive.org for Coda"
    exit
fi

echo "All transcoding is done; updating stored date."

# if we made it this far then transcoding is complete and we should update the stored date for index.php and rss.php to use
echo -n $DATE > filenamedate.txt