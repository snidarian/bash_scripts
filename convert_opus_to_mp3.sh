#!/usr/bin/bash

# The first argument to the script should be the parent filepath that houses the .opus files you
# want to convert to .mp3. Make sure ffmpeg is installed before running script.


# ansi color escape codes
r="\e[0;31m"
g="\e[0;32m"
rst="\e[0m"


# Set the first argument to the script as the base filepath for operations
BASEFILEPATH="$1"
# Set the internal field separator variable to the newline character
IFS=$'
'

# issue find command and store the file paths of all "offending" files (.opus files)

offenders="$(find $BASEFILEPATH -type f -name "*.opus")"


for file in $offenders;
do
    # Name the file that is currently about to be handled
    echo -e "${r}[${g}CONVERTING${r}]${rst}: $file"
    new_filename=$(sed 's/.opus/.mp3/' <<< $file)
    # Save the previous .flac file to temporary variable so it can be deleted after the conversion
    ffmpeg -i "$file" "$new_filename"
    rm "$file"
done 


# reset the internal field separator after the script is finished running
unset IFS
