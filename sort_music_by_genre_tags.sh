#!/usr/bin/bash
# function of script is to find genres of all mp3s in target directory and reorganize them into genre subfolders

# Takes all .mp3 files in base directory and moves them to new directories in the base directory that are named based in their genre tag.



# Ansi color escape sequences
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
white="\e[0;97m"
reset="\e[0m"



# take first argument as target directory
export base_dir=$1


# Find all mp3 files in the target folder and create list of their absolute filepaths

tracklist="$(find "$base_dir" *.mp3)"


echo "Base directory is $base_dir"
#echo "Tracklist"
#echo "$tracklist"


IFS='
'

count=0

for file in $tracklist; do
    if [ -d $file ]; then
	echo "skip file; File is a directory"
    elif [ -f $file ]; then
	count=$((count+1))
	echo -e "${green}$count. ${red}$file${reset}"
	genre="$(mediainfo --Inform="General;%Genre%" $file)"
	# make sure all '/' are exchanged with '_' in genre tag
	adjusted_genre="$(sed 's/\//_/g' <<< $genre)"
	final_genre="$(sed 's/\x27//g' <<< $adjusted_genre)"
	echo "final genre= $final_genre"
	if [ -e "$base_dir$final_genre" ]; then
	    echo -e "${white}file exists${reset}"	    
	    echo "mv $file to $base_dir$adjusted_genre"
	    mv "$file" $base_dir$final_genre
	elif [ ! -e "$base_dir$final_genre" ]; then
	    echo -e "${blue}file doesnt exist${reset}"	    	    
	    echo -e "${green}$count${reset}"
	    mkdir "$base_dir$final_genre"
	    echo "mv $file $base_dir$final_genre"
	    mv "$file" $base_dir$final_genre
	fi
    fi
   
done

