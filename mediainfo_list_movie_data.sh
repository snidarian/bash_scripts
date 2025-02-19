#!/usr/bin/bash


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


while getopts :t:abcd OPT; do
    case $OPT in
	t|+t)
	    # Target directory (filepath to directory of files to which the command will be directed)
	    target_dir="$OPTARG"
	    ;;
	a|+a)
	    
	    ;;
	b|+b)
	    
	    ;;
	c|+c)
	    
	    ;;
	d|+d)
	    
	    ;;
	*)
	    echo "usage: `basename $0` [+-t ARG] [+-abcd} [--] ARGS..."
	    exit 2
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1



cd "$target_dir"; for file in *; do echo -n "$file"; echo -e "${red} $(mediainfo --Inform="Video;%Format%" "$file") ${green} $(expr "$(mediainfo --Inform="General;%FileSize%" "$file")" / 1000000)MB  ${reset}"; done
