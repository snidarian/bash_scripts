#!/usr/bin/bash

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
    echo "Commit-count = $commits_actual"
done




































