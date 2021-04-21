#!/usr/bin/bash
# For a system with gdm3
# Picks a wallpaper at random from target folder argument and sets it as wallpaper
# set this program to run on the crontab so as to automate frequency of wallpaper changes



# takes one argument - absolute filepath to folder to select random file from
target_filepath="$1"

# change directories to designated filepath
cd "$target_filepath"



# declare associated array variable
declare -A aa
# set i variable to serve as incrementing key for associative array
i=0

for filename in *; do
    if [ -f "$filename" ]; then
	i=$((i+1))
	aa[$i]="$filename"
	
    fi
done



# pseudo-random shuf command selects random file from list
# that command is used
select_index="$(shuf -n 1 -i 1-$i)"
selected_file="${aa[$select_index]}"


# Show all the files in associative array. diagnostic lines
# echo "all the files in aa:"
# for item in "${aa[@]}"; do
#     echo "$item"
# done


# Run gsettings command to set desktop wallpaper to new value
gsettings set org.gnome.desktop.background picture-uri "file://$target_filepath$selected_file"











