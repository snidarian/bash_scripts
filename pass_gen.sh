#! /usr/bin/bash


# generates $1 number of $2 length passwords with included numbering
# $3 is the name of the file to be generated but the file name defaults to "pass.txt"
# if no third argument is supplied

# colorized output definitions
redbold="\e[1;31m"
yellow="\e[0;33m"
ybold="\e[1;33m"
reset="\e[0m"
dashband="${ybold}======================================================================${reset}"


passquantity=${1:-10}
passlength=${2:-10}
outputfilename=${3:-"pass.txt"}


# help message output on request
if [ $passquantity == "--help" ]; then
    echo -e "======================================================\n"
    echo -en "${redbold}ARGV1${reset} - Password quantity\n\n${redbold}ARGV2${reset} - Password lengh\n\n${redbold}ARGV3${reset} - Outputfile (${yellow}pass.txt by default${reset})\n\n"
    echo "=====================================================\n"
    exit 0

# else output arg values if supplied and output defaults if not
    
else
    
    if [ $passlength -gt 255 ]; then
	echo -e "${redbold}Error: Max length is 255${reset}"
	exit -1
    fi
    echo -e "${dashband}" >> $outputfilename
    passwordbatchid=$(apg -n 1 -x 5 -m 5)
    echo -ne "Password Batch ID: ${redbold}$passwordbatchid${reset}\n\n" >> $outputfilename
    echo -ne "${ybold}$passquantity${reset} passwords at ${ybold}$passlength${reset} chars-length:\n\n" >> $outputfilename

    num=1

    for x in $(apg -n $passquantity -x $passlength -m $passlength);

    do echo -en "${ybold}$num${reset} - " 

       # below echo statement cannot be -e because some passwords will trigger escape characters
       echo "$x" 

       num=`expr $num + 1`; done >> $outputfilename
    
fi

echo -e "${dashband}" >> $outputfilename

