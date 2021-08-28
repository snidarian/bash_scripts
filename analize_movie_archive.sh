#!/usr/bin/bash

# Performs various analysis methods on movies files in CWD


# Ansi color code sequences
red="\e[1;31m"
green="\e[1;32m"
blue="\e[1;34m"
reset="\e[0m"



while getopts :cyfr: OPT; do
    case $OPT in
	c|+c)
	# Count number of files in the archive
	    echo -e "There are ${red}$(ls | grep -ic 'avi\|mp4\|mkv\|wmv\|m4v')${reset} movies in the archive"
	    echo -e "${red}.mp4${reset}: $(ls | grep -ic 'mp4')"
	    echo -e "${red}.avi${reset}: $(ls | grep -ic 'avi')"
	    echo -e "${red}.mkv${reset}: $(ls | grep -ic 'mkv')"
	    echo -e "${red}.m4v${reset}: $(ls | grep -ic 'm4v')"      
	    echo -e "${red}.wmv${reset}: $(ls | grep -ic 'wmv')"
	    ;;
	y|+y)
	    # Analize all files by their year tag and create histogram showing data
	    echo -e "${red}1920s${reset}: $(ls | grep -ic '192.')"
	    echo -e "${red}1930s${reset}: $(ls | grep -ic '193.')"
	    echo -e "${red}1940s${reset}: $(ls | grep -ic '194.')"
	    echo -e "${red}1950s${reset}: $(ls | grep -ic '195.')"
	    echo -e "${red}1960s${reset}: $(ls | grep -ic '196.')"
	    echo -e "${red}1970s${reset}: $(ls | grep -ic '197.')"
	    echo -e "${red}1980s${reset}: $(ls | grep -ic '198.')"
	    echo -e "${red}1990s${reset}: $(ls | grep -ic '199.')"
	    echo -e "${red}2000s${reset}: $(ls | grep -ic '200.')"
	    echo -e "${red}2010s${reset}: $(ls | grep -ic '201.')"
	    echo -e "${red}2020s${reset}: $(ls | grep -ic '202.')"
	    ;;
	f|+f)
	    # analize all files by file extension and create histogram of data
	    echo -e "${red}.mp4${reset}: $(ls | grep -ic 'mp4')"
	    echo -e "${red}.avi${reset}: $(ls | grep -ic 'avi')"
	    echo -e "${red}.mkv${reset}: $(ls | grep -ic 'mkv')"
	    echo -e "${red}.m4v${reset}: $(ls | grep -ic 'm4v')"      
	    echo -e "${red}.wmv${reset}: $(ls | grep -ic 'wmv')"
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



