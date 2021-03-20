#! /bin/bash
# Script for outputing time display loop or list of important historical events.


# Color escape sequence variables

red="\e[1;31m"
yellow="\e[1;33m"
cyan="\e[1;36m"
purple="\e[1;35m"

reset="\e[0m"


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


birth_muhammad=`expr $current_year - 570`
black_plague=`expr $current_year - 1353`
invention_printing_press=`expr $current_year - 1440`
constantinople=`expr $current_year - 1453`
birth_mozart=`expr $current_year - 1756`
declaration_of_independence=`expr $current_year - 1776`
french_revolution=`expr $current_year - 1789`

# 19th century events
louisiana_purchase=`expr $current_year - 1803`
battle_of_new_orleans=`expr $current_year - 1815`
civil_war=`expr $current_year - 1865`
battle_of_little_bighorn=`expr $current_year - 1876`
birth_hp_lovecraft=`expr $current_year - 1890`

# 20th century events
assassination_archduke_ferdinand=`expr $current_year - 1914`
sinking_of_lusitania=`expr $current_year - 1915`
russian_communist_revolution=`expr $current_year - 1917`
stock_market_crash=`expr $current_year - 1929`
end_of_WWII=`expr $current_year - 1945`
hiroshima_nagasaki_bomb=`expr $current_year - 1945`
assassination_martin_luther_king_jr=`expr $current_year - 1968`
soviet_dissolution=`expr $current_year - 1991`
# 21st century events
september_eleventh_attacks=`expr $current_year - 2001`
election_donald_trump=`expr $current_year - 2016`




blank=`expr $current_year - 0000`


# Functions definitions


time_display_loop()
{

    echo $dashband
    echo "               H  M  S     N  "

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
    echo -ne "Years since past historical events:\n" 
    echo -ne "Birth of Muhammad : ${red}$birth_muhammad years${reset}\n"
    echo -ne "Black Plague : ${red}$black_plague years years${reset}\n"
    echo -ne "intention of printing press : ${red}$invention_printing_press years${reset}\n"
    echo -ne "Fall of Constantinople: ${red}$constantinople years${reset}\n"
    echo -ne "Birth of Mozart : ${red}$birth_mozart years${reset}\n"
    echo -ne "Declaration of Independence : ${red}$declaration_of_independence years${reset}\n"
    echo -ne "French Revolution : ${red}$french_revolution years${reset}\n"

    # 19th century
    echo -ne "Louisiana Purchase: ${red}$louisiana_purchase years${reset}\n"
    echo -ne "Battle of New Orleans : ${red}$battle_of_new_orleans years${reset}\n"
    echo -ne "US Civil War : ${red}$civil_war years${reset}\n"
    echo -ne "Battle of Little Bighorn : ${red}$battle_of_little_bighorn years${reset}\n"
    echo -ne "Birth of HP Lovecraft : ${red}$birth_hp_lovecraft years${reset}\n"
    #echo -ne "event : ${red}blank years${reset}\n"

    # 20th century
    echo -ne "Assassination of Archduke Ferdinand : ${red}$assassination_archduke_ferdinand years${reset}\n"
    echo -ne "Sinking of the Lusitania : ${red}$sinking_of_lusitania years${reset}\n"
    echo -ne "Russian Communist Revolution : ${red}$russian_communist_revolution years${reset}\n"
    echo -ne "Stock Market Crash : ${red}$stock_market_crash years${reset}\n"
    echo -ne "End of WWII : ${red}$end_of_WWII years${reset}\n"
    echo -ne "Nuclear destruction of Nagasaki, Hiroshima : ${red}$hiroshima_nagasaki_bomb years${reset}\n"
    echo -ne "Assassination of Martin Luther King Jr. : ${red}$assassination_martin_luther_king_jr years${reset}\n"
    echo -ne "Fall of Soviet Union: ${red}$soviet_dissolution${reset}\n"

    # 21st century
    echo -ne "September 11th Attacks: ${red}$september_eleventh_attacks years${reset}\n"
    echo -ne "Donald Trump becomes 45th President : ${red}$election_donald_trump years${reset}\n"
    #echo -ne "event : ${red}blank years${reset}\n"
    
}


current_year_info()
{
    
    echo "$dashband"
    echo -ne "It is currently $(date "+%A, %B %d of the year %Y")\n\n"
    echo -ne "Day $current_day_in_year/365 "
    echo -ne "($days_left_in_year days left in $(date +%Y))\n\n"

    echo $separator

}



# Executions


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
	;;
    *)
	current_year_info
	time_display_loop
	;;
    
esac






