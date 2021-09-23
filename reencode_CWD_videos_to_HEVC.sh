#!/usr/bin/bash

# Make sure to execute this command in a directory that contains h.264 videos that need to be reencoded to h.265 (HEVC)
# Simply executing the command with no arguments is enought to properly use make.
# Make sure there are no other files in the directory other than the [.mkv, .mp4, .avi]s that that you want to convert



GREEN="\e[1;32m"
RED="\e[1;31m"
RESET="\e[0m"


for FILE in "$(ls)";
do
    echo -e "${RED}Converting $FILE to h.265 (HEVC)${RESET}"
    ffmpeg -i "$FILE" -vcodec libx265 -crf 28 "$FILE"__.mp4
    if [ "$?" -eq 0 ]; then
	echo -e "${GREEN}Finished converting $FILE${RESET}"
    else
	echo -e "${RED}There was an error converting $FILE..."
    fi
    
done






























