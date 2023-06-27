#!/usr/bin/bash
# reencodes video files to x265 based on the control rate factor of their numbered parent directory




# The -b single flag argument is the base directory that houses the subdirectories that hold the files to be reencoded.
# Note that these subdirectories must be titled with the CRF that you wish to use; "28" as a subdirectory name for instance will use a CRF of 28. Simple stuff.



while getopts :b:m OPT; do
    case $OPT in
	b|+b)

	    #grandfather directory (base directory)
	    basedir="$OPTARG"
	    format="mp4"
	    ;;
	m|+m)
	    # Change format of output files to MKV
	    format="mkv"
	    ;;
	*)
	    echo "usage: `basename $0` [+-b ARG} [--] ARGS..."
	    exit 2
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1



echo "CHANGING TO DIRECTORY: $basedir"
cd "$basedir"


for dir in *;
do
    cd "$dir";
    crf=$(basename $(pwd));
    quality="$crf";
    echo "Now at level $crf control rate factor";
    for file in *;
    do
	ffmpeg -i "$file" -vcodec libx265 -crf $crf ~/Videos/staging/"$file"-$quality.$format;
    done;
    cd ..;
done
