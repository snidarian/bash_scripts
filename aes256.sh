#!/usr/bin/bash

# bash tool utilizing openssl utility/libraries for custom encryption schemes


# takes two args:
# argv1 = mode (encrypt or decrypt) (-e or -d)
# argv2 = file (or absolute filepath) for processing

#-----------------------------------------------------------------
# Function definitions

help_message()
{
    echo -e "Usage: aes256 [MODE] [FILE]..."
    echo -e "Encrypts/decrypts file and filename in aes256 chain block cipher"
    echo -e "MODES: -e - Encrypt | -d - Decrypt | -c Cat encrypted file"
}


encrypt()
{
    # generate base64 for content
    filename="$1"
    base64=$(openssl enc -base64 -in $filename)
    # get random id to assign as new scrambled name
    file_id=`echo "$filename" | openssl enc -base64`
    # define filename variable that can be accessed when unecrypted and create new file
    openssl enc -aes-256-cbc -in "$filename" -out "$file_id"
    # rm regular and temp file if previous exit code indicates success (0)
    if [[ $? == 0 ]]; then
	rm "$filename"
    else
	echo "Passwords did not match. Try again."
    fi	
}


decrypt()
{
    file=$1
    new_filename=`echo "$file" | openssl enc -base64 -d`
    openssl enc -aes-256-cbc -d -in "$file" -out "$new_filename"
    if [[ $? == 0 ]]; then
	rm "$file"
    else
	echo "UserError: Password incorrect"
	rm "$new_filename"
    fi
}


cat_encrypted()
{
    file_to_cat="$1"
    echo "filetocat = $file_to_cat"
    openssl enc -aes-256-cbc -d -in "$file_to_cat" -out temp_file.txt
    cat temp_file.txt
    sleep 1
    rm temp_file.txt
}


#------------------------------------------------------------------------
# Executions

mode="$1"
file="$2"

encrypt=0
decrypt=0
flash_me=0

if [[ $mode == "-e" ]]; then
    encrypt=1
    decrypt=0
elif [[ $mode == "-d" ]]; then
    decrypt=1
    encrypt=0
elif [[ $mode == "-c" ]]; then
    decrypt=0
    encrypt=0
elif [[ $mode == "--help" ]]; then
    help_message
else
    echo "Error: Invalid first argument"
fi


if [[ $encrypt == 1 ]] && [[ $decrypt == 0 ]]; then
    encrypt "$file"
elif [[ $decrypt == 1 ]] && [[ $encrypt == 0 ]]; then
    decrypt "$file"
elif [[ $decrypt == 0 ]] && [[ $encrypt == 0 ]] && [[ $mode == "-c" ]]; then
    cat_encrypted "$file"
fi

























