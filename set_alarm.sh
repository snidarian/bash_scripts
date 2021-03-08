#! /usr/bin/bash
# This script sets an alarm in 24-hour time
# path the final media player command to an alarm audio file
# $1 sets alarm hour value, $2 sets alarm minute value (24 hour time keep in mind)

# numberical constants
minutes_in_hour=60
hours_in_day=24


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


echo -ne "#          (10%)\r"
sleep 1




# sleep x number of hours and minutes
sleep $hours_left\h
sleep $minutes_left\m



# alarm absolute filepath
vlc --play-and-exit ~/Music/.user_sounds/fire_alarm.mp3



