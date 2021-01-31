#!/bin/bash
# list directory contents, and if some of those contents are directories; list their contents as well


TARGETDIR=${1?Error: Supply target directory}
OUTPUTFILE=${2:-outputlistfile.txt}

for dirs in ls $TARGETDIR
do
	if [ -d dirs ]; then
	for file in dirs
	do
		echo "$file" >> $OUTPUTFILE
	done
	else
	continue
	fi
done


