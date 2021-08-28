#!/usr/bin/bash

# Performs various analysis methods on movies files in CWD


while getopts :cyfr: OPT; do
    case $OPT in
	c|+c)
	    # Count number of files in the archive
	    ;;
	y|+y)
	    # Analize all files by their year tag and create histogram showing data
	    ;;
	f|+f)
	    # analize all files by file extension and create histogram of data
	    ;;
	r|+r)
	    # Search all files with regular expression argument
	    "$OPTARG"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-cyfr ARG} [--] ARGS..."
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1



