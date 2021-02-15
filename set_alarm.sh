#! /usr/bin/bash
# This script sets an alarm in 24-hour time
# path the final media player command to an alarm audio file

# haven't determined if these declare statements are efficient.
# I'm leaving them here until I can revist the subject and determine if they are
#declare -i set_hour
#declare -i set_minute
#declare -i current_hour
#declare -i current minute
#declare -i hrs_left
#declare -i mins_left

echo -e "Set alarm hour value"
read set_hour
echo -e "Set alarm minute value"
read set_minute

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

# display time until alarm
if [ $hours_left -eq 0 ]; then
    echo "Alarm will sound in $minutes_left minutes"
elif [ $minutes_left -eq 0 ]; then
    echo "Alarm will sound in $hours_left hours"
else
    echo "Alarm will go off in $hours_left hours, $minutes_left minutes"
fi


# sleep x number of hours and minutes
sleep $hours_left\h
sleep $minutes_left\m

# alarm absolute filepath
vlc --play-and-exit ~/Music/.user_sounds/fire_alarm.mp3




