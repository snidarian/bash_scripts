#!/usr/bin/bash


# COLORED ANSI ESCAPE SEQUENCES
black="\e[1;30m"        #Black
red="\e[1;31m"          #Red
green="\e[1;32m"        #Green
yellow="\e[1;33m"       #Yellow
blue="\e[1;34m"         #Blue
purple="\e[1;35m"       #Purple
cyan="\e[1;36m"         #Cyan
white="\e[1;37m"        #White
reset="\e[0m"           #Reset

plain_text="$1"
hash_names=("md5" "sha1" "sha256" "sha384" "sha512")
hash_commands=(md5sum sha1sum sha256sum sha384sum sha512sum)
word_size=(32 40 32 64 64)

echo -e "\nHashes for the word: ${yellow}$plain_text${reset}\n"

for number in {0..4};
do
    echo -e "${red}"
    echo "${hash_names[$number]}"
    echo -ne "${reset}"
    echo -ne "${blue}output size: ${red}"
    echo "${word_size[$number]}"
    echo -en "${reset}"
    eval echo -n $plain_text | ${hash_commands[$number]} | head -c ${word_size[$number]}
done

echo -e "\n\n${white}============================================${reset}"

exit 0
