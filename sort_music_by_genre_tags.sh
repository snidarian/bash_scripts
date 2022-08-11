#!/usr/bin/bash
# function of script is to find genres of all mp3s in target directory and reorganize them into genre subfolders
# Script not yet completed


# take first argument as target directory
export target_dir=$1


# Find all mp3 files in the target folder and create list of their absolute filepaths

tracklist="$(find "$target_dir" *.mp3)"


#echo "Target dir is $target_dir"
#echo "Tracklist"
#echo "$tracklist"


IFS='
'

count=0

for file in $tracklist; do
    count=$((count+1))
    echo "$count"
#    echo "Track = $file"
    mediainfo --Inform="General;%Genre%" $file; echo ""
done

