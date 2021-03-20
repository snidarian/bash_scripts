#! /bin/bash







# Grahpical variables

dashband="-------------------------------------------------"
separator="- - - - - - - - - - - - - - - - - - - - - - - - "


# Time simplification variables
current_year=$(date +%Y)
current_day_in_year=$(date +%j)
days_left_in_year=`expr 365 - $current_day_in_year`
current_month_text=$(date +%B)
current_month_number=$(date +%m)
current_day_of_month=$(date +%d)


# Historical events variables

soviet_dissolution=`expr $current_year - 1991`
constantinople=`expr $current_year - 1453`
civil_war=`expr $current_year - 1865`
declaration_of_independence_signing=`expr $current_year - 1776`
invention_of_printing_press=`expr $current_year - 1440`
end_of_WWII=`expr $current_year - 1945`
russian_communist_revolution=`expr $current_year - 1917`
assassination_archduke_ferdinand=`expr $current_year - 1914`
french_revolution=`expr $current_year - 1789`
black_plague=`expr $current_year - 1353`
birth_muhammad=`expr $current_year - 570`
louisiana_purchase=`expr $current_year - 1803`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`
blank=`expr $current_year - 0000`

# Functions definitions


time_display_loop()
{

    echo $dashband
    echo "              H  M  S      N  "

    while [ 1 ]
    do
	echo -ne " Current time: $(date +%H:%M:%S:%N)\r"
	sleep .1
    done

}


# Data about specific year (if no year supplied then use current year)
year_data()
{
    year=$1
    cal -y $year
    
}


historical_markers()
{

    echo "$dashband"
    echo -ne "It has been:\n" 
    echo -ne "$soviet_dissolution years since the fall of The Soviet Union\n"
    echo -ne "$constantinople years since the fall of Constantinople to the Ottomans\n"
    echo -ne "blank years since blank"
    
}




# Executions

echo "$dashband"
echo -ne "It is currently $(date "+%A, %B %d of the year %Y")\n\n"
echo -ne "Day $current_day_in_year/365 "
echo -ne "($days_left_in_year days left in $(date +%Y))\n\n"

echo $separator


case $1 in
    "--help")
	echo "Usage: time_spit [OPTION]..."
	echo -ne "-h, --help\t\t\tdisplay help message\n"
	echo -ne "-t, --time-display-loop\t\t output time-display loop to terminal\n"
	echo -ne "-h, --history\t\t\tdisplay historical events and year analysis\n"
	;;
    "-t"|"--time-display-loop")
	echo "time diplay loop:"
	time_display_loop
	;;
    "-h"|"--history")
	echo "Historical event-markers:"
	historical_markers
	;;
    "-y"|"--year-data")
	year=${2:$current_year}
	echo "arg two = $2"
	year_data $2
esac









