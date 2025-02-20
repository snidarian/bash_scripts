#!/usr/bin/bash



# COLORED ANSI ESCAPE SEQUENCES
black="\e[1;30m" #Black
red="\e[1;31m" #Red
green="\e[1;32m" #Green
yellow="\e[1;33m" #Yellow
blue="\e[1;34m" #Blue
purple="\e[1;35m" #Purple
cyan="\e[1;36m" #Cyan
white="\e[1;37m" #White
reset="\e[0m" #Reset


maindir=$(pwd)

export grand_total_hours=0

export miliseconds=0
export secs=0

export total_sec=0
export total_min=0
export total_hour=0

for directory in *;
do
    total_sec=0
    total_min=0
    total_hour=0
    if [ -d "$directory" ]; then
	cd "$directory"
	echo -e "${green}"
	echo "$directory"
	echo -e "${reset}"
	# for subdirectory in each directory (if there is a subdirectory)
	for subdirectory in *;
	do
	    if [ -d "$subdirectory" ]; then
		cd "$subdirectory"
		echo -e "\n${yellow}"
		echo "$subdirectory"
		echo -ne "${reset}"
		for file in *;
		do
		    miliseconds="$(sed s/.000000// <<< $(mediainfo --Inform="Video;%Duration%" "$file"))"
		    secs="$(expr $miliseconds / 1000)"
		    total_sec="$(expr $secs + $total_sec)"
		    echo -e "${red}"
		    echo -n "$file:"
		    echo -ne "${reset}"
		    echo -n " $total_sec seconds"
		done
		sleep 0.5
		cd ..
	    elif [ -f "$subdirectory" ]; then
		miliseconds="$(sed s/.000000// <<< $(mediainfo --Inform="Video;%Duration%" "$subdirectory"))"
		seconds="$(expr $miliseconds / 1000)"
		total_sec="$(expr $secs + $total_sec)"
		echo -e "${cyan}"
		echo -n "$subdirectory:"
		echo -ne "${reset}"
		echo -n " $total_sec seconds"
	    fi

	done
	# calculate total minutes from each directory
	total_min=$(expr "$total_sec" / 60 )
	# calculate total hours from that figure
	total_hour=$(expr "$total_min" / 60 )
	# add the total hours of all subdirectories/files in directory to grand total
	grand_total_hours=$(expr $total_hour + $grand_total_hours)

	echo -e "\n\n${blue}"
	echo "Total_min = $total_min"
	echo "Total_hours = $total_hour"
	echo "Grand total hours = $grand_total_hours"
	echo -e "${reset}"
	
	cd ..
    # if file inside maindir is not a directory, don't throw error but do reprimand
    elif [ -f "$directory" ]; then
	echo " $directory != a shows directory..."
	echo " All files in main dir should also be dirs"
    fi
    sleep 1
done


# spit out final total when all the figuring is complete
echo -e "${blue}"
echo "Grand total of all directories = $grand_total_hours"
echo -e "${reset}"

