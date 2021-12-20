#!/usr/bin/bash
# Creates lists current streak

# color sequences
red="\e[1;31m"
green="\e[1;32m"
reset="\e[0m"


create_new_streak()
{
    echo -e "New streak started now at: ${green}$(date)${reset}"
    echo "$(date)" > ~/.current_streak
}

list_current_streak()
{
    echo -e "Current streak started at: ${green}$(cat ~/.current_streak)${reset}"
}

list_previous_streak()
{
    echo -e "Previous streak started at ${red}$(cat ~/.current_streak)${reset}"
}

while getopts :sl OPT; do
    case $OPT in
	s|+s)
	    # Start new streak
	    list_previous_streak
	    create_new_streak
	    ;;
	l|+l)
	    # List current streak
	    list_current_streak
	    ;;
	*)
	    echo "usage: streak.sh [sl]"
	    exit 0
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1


