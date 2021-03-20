#! /bin/bash

current_year=$(date +%Y)
current_day_in_year=$(date +%j)
days_left_in_year=`expr 365 - $current_day_in_year`
current_month_text=$(date +%B)
current_day_of_month=$(date +%d)
soviet_dissolution=`expr $current_year - 1991`
dashband="-------------------------------------------------"
separator="- - - - - - - - - - - - - - - - - - - - - - - - "


echo "Time analytics based on current machine's onboard clock"
echo "$dashband"

echo "It is currently $(date "+%A, %B %d of the year %Y")"

echo -ne "Day $current_day_in_year/365 "
echo "($days_left_in_year days left in $(date +%Y))"

echo $separator
echo "Historical year markers:"
echo -ne "It has been $soviet_dissolution years since the fall of The Soviet Union\n"




echo $separator
echo "              H  M  S      N  "

while [ 1 ]
do
    echo -ne "Current time: $(date +%H:%M:%S:%N)\r"
    sleep .1
done








