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


passquantity=${1:-64}
passlength=${2:-64}
generationalgorithm=${3:-0}
outputfilename=${4:-"pass.txt"}




# help message output on request
if [ $passquantity == "--help" ]; then
    echo -e "${ybold}======================================================${reset}\n"
    echo -en "${redbold}ARGV1${reset} - ${ybold}Quantity${reset} (default=64)\n\n${redbold}ARGV2${reset} - ${ybold}Password length${reset} (default=64)\n\n${redbold}ARGV3${reset} - ${ybold}Algorithm${reset} (default=0)\n\n${redbold}ARGV4${reset} - ${ybold}Outputfile name${reset} (default=pass.txt)\n\n"
    echo -e "${ybold}=====================================================${reset}\n"
    exit 0

# else output arg values if supplied and output defaults if not
    
else

    if [ $generationalgorithm -gt 1 ]; then
	echo -e "${redbold}Error: Select 0 (default) or 1 as ARGV3${reset}"
	exit -1
    fi
    
    if [ $passlength -gt 255 ]; then
	echo -e "${redbold}Error: Max length is 255${reset}"
	exit -1
    fi
    echo -e "${dashband}" >> $outputfilename
    passwordbatchid=$(apg -n 1 -x 5 -m 5)
    echo -ne "Password Batch ID: ${redbold}$passwordbatchid ${reset}\t${ybold}Generated - $(date +%D) at ($(date +%H:%M))${reset}\n\n" >> $outputfilename
    echo -ne "${ybold}$passquantity${reset} passwords at ${ybold}$passlength${reset} char-length:\n\n" >> $outputfilename

    num=1

    for x in $(apg -n $passquantity -x $passlength -m $passlength -a $generationalgorithm);

    do echo -en "${ybold}$num${reset} - " 

       # below echo statement cannot be -e because some passwords will trigger escape characters
       echo "$x" 

       num=`expr $num + 1`; done >> $outputfilename
    
fi

echo -e "${dashband}" >> $outputfilename




