#!/usr/bin/bash
# Return list of movies from range $1 to range $2



for x in "$(seq $1 1 $2)";
do
    ls | grep -i "$x"
done
	 


















