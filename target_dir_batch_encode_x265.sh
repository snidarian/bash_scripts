#!/usr/bin/bash

# This shell script, using ffmpeg, encodes all files in target directory to HEVC in .mkv containers.

# CRF values must always be specified either in -x and -n flags (min and max single-round batch encode) or in -q flag (multi-round batch encode)
# The first arg to this script is the target dir where the target files reside to be reencoded to x265

# by convention all encoded files will be sent to ~/Videos/staging/



# COLORED ANSI ESCAPE SEQUENCES                                                                         
black="\e[1;30m"        #Black
red="\e[1;31m"          #Red
green="\e[1;32m"        #Green
yellow="\e[1;33m"       #Yellow
blue="\e[1;34m"         #Blue
purple="\e[1;35m"       #Purple
cyan="\e[1;36m"         #Cyan
white="\e[1;37m"        #White
reset="\e[0m"           #Reset





while getopts :q:x:n:t:r:h OPT; do
    case $OPT in
	t|t+)
	    target_dir="$OPTARG"
	    echo "Target dir: $target_dir"
	    ;;
	n|+n)
	    min="$OPTARG"
	    echo "min crf value set to: $min"
	    ;;
	x|+x)
	    max="$OPTARG"
	    echo "max crf value set to: $max"
	    ;;
	q|+q)
	    quality="$OPTARG"
	    echo "Quality = $quality"
	    ;;
	r|+r)
	    # round cooldown (to allow coolant to cool betwwen multi-crf-round encodes)
	    round_cooldown="$OPTARG"
	    echo "Round cooldown set for $round_cooldown"
	    ;;
	h|+h)
	    # Help message
	    echo "HELP MESSAGE"
	    echo -e " This shell script, using ffmpeg, encodes target directories to HEVC in .mkv container\nThe -q flag is a necessary parameter and must always be specified\nThe first arg to this script is the target dir to be converted\nby convention all encoded files will be sent to ~/Videos/staging/"
	    ;;
	*)
	    echo "usage: `basename $0` [+-q ARG] [+-n ARG] [+-x ARG] [+-t ARG] [+-r ARG] [+-h} [--] ARGS..."
	    echo -e "-q - crf quality (single-round)\n-n - min\n-x - max\n-t - target directory\n-r - cooldown time (multi-round)"
	    exit 2
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1



#################################################################################
# CHOOSE RUN-MODE (either single round or multiround)
#################################################################################

# Control flow determining which run type was specified, choice is binary
if [[ $min != "" ]] && [[ $max != "" ]]; then
    echo "Min and max specified as $min-$max. CRF stages will occur in following order: $(seq -s ', ' $min 1 $max)"
    multi_round=1
    single_round=0
else
    echo "Single round batch encode selected at CRF value $quality"
    multi_round=0
    single_round=1    
fi


#################################################################################
# EXECUTE ENCODING SEQUENCE
#################################################################################


# Change to target directory
cd "$target_dir"


if [[ $multi_round == 1 ]] && [[ $single_round == 0 ]]; then
    echo "Initiating multi-round batch encode"
    for crf_level in $(seq $min 1 $max); do
	for file in *; do
	    echo -e "${green}###########################################################${reset}"
	    echo -e "Encoding ${red}$file${reset} at CRF $crf_level"
	    echo -e "${green}###########################################################${reset}"
	    ffmpeg -i "$file" -vcodec libx265 -crf "$crf_level" ~/Videos/staging/crf/"$file"$crf_level.mkv;
	done
	# sleep for $round_cooldown duration (if set) allowing coolant liquid to left off heat between rounds
	if [[ $round_cooldown != "" ]]; then
	    echo -e "${red}Sleeping for $round_cooldown${reset}"
	    sleep $round_cooldown;
	else
	    :
	fi
    done
    
elif [[ $multi_round == 0 ]] && [[ $single_round == 1 ]]; then
    echo "Initiating single-round batch encode"
    for file in *; do
	echo -e "${green}###########################################################${reset}"
	echo -e "Now encoding ${red}$file${reset} at CRF $quality"
	echo -e "${green}###########################################################${reset}"
	ffmpeg -i "$file" -vcodec libx265 -crf "$quality" ~/Videos/staging/"$file"$quality.mkv
    done
else    
    echo "You must either specify single or multiround batch encoded with either -q [CRF VALUE] or -x [MAX CRF] -n [MIN CRF]"
fi

