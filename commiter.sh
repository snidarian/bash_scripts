#!/usr/bin/bash

# color escape sequences
red="\e[1;31m"
green="\e[1;32m"
reset="\e[0m"

# argv1 = number of commits to make

commits_actual=0

while [[ $commits_actual -lt $1 ]]; do
    echo -ne "commit|\n" >> file.txt
    sleep .1
    git add -A
    sleep .1
    git commit -m "Just another commit"
    sleep .1
    git push
    commits_actual=$((commits_actual+1))
    echo -e "${red}Commit-count = $commits_actual${reset}"
done


