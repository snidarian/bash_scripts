#!/usr/bin/bash
# Find all .avi .mp4 and .mkv files in the base folder and convert them into HEVC .mp4 files in target directory



while getopts :b:d:c: OPT; do
    case $OPT in
	b|+b)
	    base_dir="$OPTARG"
	    ;;
	d|+d)
	    dump_dir="$OPTARG"
	    ;;
	#control rate factor for video conversion quality
	c|+c)
	    crf="$OPTARG"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-b ARG] [+-d ARG] [+-c ARG} [--] ARGS..."
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


# Parameters for -b -d and -c
echo "Base Directory: $base_dir"
echo "Dump Directory: $dump_dir"
echo "Control rate factor: $crf"

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
	    # copy file to target directory
	    cp "$file" "$dump_dir"
	    echo -e "Copy ${blue}$file${reset} to $dump_dir"
	else
	    echo "FILE IS NOT HEVC, FILE IS $codec"
	    # convert file to HEVC .mp4 file at target directory
	    #use basename command to get unprefixed file
	    basename=$(basename "$file")
	    # rencoded non-HEVC file to HEVC
	    #ffmpeg -i "$file" -vcodec libx265 -crf "$crf" "$dump_dir/$basename#$crf".mp4
	    #sleep 240
	fi
	
    fi
   
done

