#!/usr/bin/bash
# Return list of movies from range $1 to range $2


GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
RESET="\e[0m"

echo -e "\n\nOutputing movies from the year ${YELLOW}$1${RESET} to the year ${GREEN}$2${RESET}:\n"

for x in "$(seq $1 1 $2)"
do
    ls | grep --color=auto -i "$x"
done
	 


















