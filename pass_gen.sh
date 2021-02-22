#! /usr/bin/bash


# generates $1 number of $2 length passwords with included numbering
# $3 is the name of the file to be generated but the file name defaults to "pass.txt"
# if no third argument is supplied

if [ $2 -gt 255 ]; then
    echo "Error: Max length is 255"
    exit -1
fi

passquantity=${1:-10}
passlength=${2:-10}
outputfilename=${3:-"pass.txt"}


# help message output on request
if [ $passquantity == "--help" ]; then
    echo "========================================"
    echo -en "ARGV1 - quantity of passwords\nARGV2 - password lengh\nARGV3 - outputfile\n"
    echo "========================================"
    exit 0

# else output arg values if supplied and output defaults if not
    
else
    echo "===========================================================" >> $outputfilename
    passwordbatchid=$(apg -n 1 -x 5 -m 5)
    echo -ne "Password Batch ID: $passwordbatchid\n" >> $outputfilename
    echo -ne "$passquantity passwords at length of $passlength chars\n\n:" >> $outputfilename

    num=1

    for x in $(apg -n $passquantity -x $passlength -m $passlength);

    do echo -en "$num - " 

       # below echo statement cannot be -e because some passwords will trigger escape characters
       echo "$x" 

       num=`expr $num + 1`; done >> $outputfilename
    
fi

echo "===========================================================" >> $outputfilename

