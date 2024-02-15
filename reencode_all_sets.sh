#!/usr/bin/bash

# simple script that reencodeds files within subdirectories in parent directory to HEVC based on min and max quality parameters



# b - base directory
# n - min crf quality for reencoding
# x - max crf quality for reencoding
while getopts :b:n:x: OPT; do
    case $OPT in
	b|+b)
	    # This is for base or parent directory from which to cycle subdirectories and reencode contents
	    base_dir="$OPTARG"
	    ;;
	n|+n)
	    # min quality
	    min="$OPTARG"
	    echo "min = $min"
	    ;;
	x|+x)
	    # max quality
	    max="$OPTARG"
	    echo "max = $max"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-b ARG] [+-n ARG] [+-x ARG} [--] ARGS..."
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1



echo "changing to $base_dir"
cd "$base_dir"


for set in *; do cd "$set"; for quality in {$min..$max}; do for file in *; do ffmpeg -i "$file" -vcodec libx265 -crf "$quality" ~/parent_test/"$file"$quality.mp4; done; done; cd ..; done

