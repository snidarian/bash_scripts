#!/usr/bin/bash
# Find all .avi .mp4 and .mkv files in the base folder with CODEC HEVC and delete them



while getopts :b: OPT; do
    case $OPT in
	b|+b)
	    base_dir="$OPTARG"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-b ARG} [--] ARGS..."
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1


# Ansi color escape sequences
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
white="\e[0;97m"
reset="\e[0m"


# Parameters for -b (selected base directory from which to delete files)
echo "Base Directory: $base_dir"


# Find all .avi .mp4 and .mkv files in the base folder and convert them into HEVC .mp4 files in target directory

movies="$(find "$base_dir" *.mp4||*.avi||*.mkv)"


IFS='
'

count=0
for file in $movies; do
    if [ -d $file ]; then
	echo "skip file; File is a directory"
    elif [ -f $file ]; then
	count=$((count+1))
	echo -e "\n${green}$count. ${red}$file${reset}"
	codec="$(mediainfo --Inform="Video;%Format%" $file)"
	echo "$codec"
	if [[ "$codec" == "HEVC" ]]; then
	    echo "FILE IS HEVC"
	    # deleting file in base directory
	    rm "$file"
	    echo -e "${green}DELETING HEVC file:${reset} ${blue}$file${reset}"
	else
	    echo "FILE IS NOT HEVC, FILE IS $codec"
	    # Do nothing because file in not in HEVC codec
	fi
	
    fi
   
done

