#!/usr/bin/bash

# CRF encode script with subtitles included

# you need the following filepaths setup before running this script

# 1. Directory of movie files to be encoded (.avi||.mp4||.mkv) in the following filepath ~/Videos/unencoded_movies/subtitle_encodes/[CRF-NUMBER-VALUE]/[MOVIE_FOLDER]
#Note that these movie folders and their video files and .srt files may not have 's, []s, or any other various special characters except the period character "."

# 2. Directory for video staging (ie: where the encoded files are sent to. It is to be called ~/Videos/staging/subtitle_staging




for crf_dir in ~/Videos/unencoded_movies/subtitle_encodes/*;
do
    crf="$(basename $crf_dir)"
    echo -e "control rate factor = $crf"
    cd "$crf_dir"
    for directory in *;
    do
	cd "$directory"
	echo -e "\nCurrent dir: $(pwd)"
	#Get video file name
	video="$(find . -name *.mp4||*.avi||*.mkv)"
	#Get .srt file name
	subtitle_file="$(find . -name *.srt)"
	echo "Subtitle: $subtitle_file"
	echo "Video: $video"
	#Encoded at specified CRF
	echo "now attempting to encode $video & $subtitle_file"
	echo "$crf"
	ffmpeg -i "$video" -vcodec libx265 -vf subtitles="$subtitle_file" -crf "$crf" ~/Videos/staging/subtitle_staging/"$video.$crf".mkv
	pwd
	# return to base directory
	cd ..
	pwd
    done
# Change out of current crf directory to allow changing into next crf dir    
cd ..
done














#for dir in *; do cd "$dir"; for quality in {25..25}; do for file in "*.mp4||.mkv"; do ffmpeg -i "$file" -vcodec libx265 -crf $quality -vf subtitles="*.srt" ~/Videos/staging/subtitle_staging/"$file"$quality.mkv; done; done; cd ..; done;
