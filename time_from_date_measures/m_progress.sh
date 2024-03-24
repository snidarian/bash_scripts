#!/usr/bin/bash

#   %s     seconds since 1970-01-01 00:00:00 UTC



# Color escape codes

red="\e[1;31m"
green="\e[1;32m"
reset="\e[0m"



start="$(date +"%s")"

seconds="$((start - 1709547832))"
minutes="$((seconds / 60))"
hours="$((minutes / 60))"
days="$((hours / 24))"
weeks="$((days / 7))"
months="$((days / 30))"
years="$((days / 365))"

echo "M M M M M M M M M M"
echo -e "Stats since Mon 04 Mar 2024 05:23:52 AM EST\n\n" 
echo -e "Seconds: ${red}$seconds${reset}"
echo -e "Minutes: ${red}$minutes${reset}"
echo -e "Hours: ${red}$hours${reset}"
echo -e "Days: ${red}$days${reset}"
echo -e "Weeks: ${red}$weeks${reset}"
echo -e "Months: ${red}$months${reset}"
echo -e "Years: ${red}$years${reset}"
echo -e "\n"



