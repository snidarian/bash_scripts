
#! /usr/bin/bash
# This script sets an alarm in 24-hour time
# path the final media player command to an alarm audio file
# $1 sets alarm hour value, $2 sets alarm minute value (24 hour time keep in mind)


# Ansi color escape sequences

red_bold="\e[1;31m"
gold_bold="\e[1;33m"
cyan_bold="\e[1;36m"
reset="\e[0m"



# numerical constants
seconds_in_minute=60
minutes_in_hour=60
hours_in_day=24

# Argv1 and argv2
set_hour=$1
set_minute=$2

echo "Alarm set for $set_hour:$set_minute"

current_hour=`date "+%H"`
current_minute=`date "+%M"`


echo "Current time: $current_hour:$current_minute"


#LT
if [ $current_hour -lt $set_hour ]; then
    hours_left=`expr $set_hour - $current_hour`
fi

if [ $current_minute -lt $set_minute ]; then
    minutes_left=`expr $set_minute - $current_minute`
fi

#EQ

if [ $current_hour -eq $set_hour ]; then
    hours_left=0
fi

if [ $current_minute -eq $set_minute ]; then
    minutes_left=0
fi

#GT
if [ $current_hour -gt $set_hour ]; then
    hours_left=`expr 24 - $(expr $current_hour - $set_hour)`
fi

if [ $current_minute -gt $set_minute ]; then
    minutes_left=`expr 60 - $(expr $current_minute - $set_minute)`
fi

# Special catch case if set minute less than current minute subtract 1 from hours_left

if [ $set_minute -lt $current_minute ]; then
    hours_left=$(expr $hours_left - 1)
fi

# display time until alarm
if [ $hours_left -eq 0 ]; then
    echo "Alarm will sound in $minutes_left minutes"
elif [ $minutes_left -eq 0 ]; then
    echo "Alarm will sound in $hours_left hours"
else
    echo "Alarm will go off in $hours_left hours, $minutes_left minutes"
fi



# convert all hour_left to minutes and then add to total of minutes_left
converted_hours_left=$(expr $hours_left \* 60)

minutes_left=$(expr $minutes_left + $converted_hours_left)

seconds_left=$(expr $minutes_left \* $seconds_in_minute)


# progress bar incrementation factor - how we know how much to equally sleep in each loop
progress_incr=$(expr $seconds_left \/ 100)


echo "--------------------------------------------------------------"


# Code that governs progress bar and for loop that meters alarm time
for ((i=0; i<=100; i++)); do
    # new variable for display number of mins left in progress var
    secs_left=$(expr $(expr 100 - $i) \* $progress_incr)
    mins_left=$(expr $secs_left \/ $seconds_in_minute)
    
    if [ $i -gt 0 ]; then
	for ((j=0; j<i; j++)); do
	    echo -ne "${gold_bold}=${reset}"
    
	done
    fi

    echo -ne ">"
    echo -ne " ${red_bold}($i%)${reset}"

    if [ $mins_left -eq 0 ]; then
	echo -ne "${cyan_bold}($secs_left secs)${reset}\r"
    else
	echo -ne "${cyan_bold}($mins_left mins)${reset}\r"
    fi
    sleep $progress_incr
done

echo -ne "\n"


# Alarm sequence - simplest plug and play way is to use echo terminal alarm escape character in a timed sequence

for ((i=0;i<=100;i++)); do

    sleep 1
    echo -ne "\a"
    sleep .5
    echo -ne "\a"
    sleep .2
    echo -ne "\a"
    sleep 1
    
done

