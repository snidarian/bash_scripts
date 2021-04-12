#!/usr/bin/bash

# sophisticated bash tool utilizing openssl utility/libraries for custom encryption schemes


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
    temp_file="temp_file.txt"
    # define filename variable that can be accessed when unecrypted and create new file
    openssl enc -aes-256-cbc -in "$filename" -out "$file_id"
    # rm regular and temp file if previous exit code indicates success (0)
    # important otherwise the file gets deleted if you fail setting the password
    if [[ $? == 0 ]]; then
	rm "$filename"
    else
	echo "Passwords did not match. Try again."
    fi	
}


decrypt()
{
    filename="$1"
    encrypted_name=$filename
    unencrypted_name=`echo "$encrypted_name" | openssl enc -base64 -d`
    file_to_delete_afterwards="$filename"
    openssl enc -aes-256-cbc -d -in "$file" -out "temp_file.txt"
    source "temp_file.txt"
    # convert base64 content from temp_file
    unencrypted_message=`echo "$content" | openssl enc -base64 -d`
    echo "$unencrypted_message" > "$unencrypted_name"
    rm "temp_file.txt"
    rm "$file_to_delete_afterwards"
}


cat_encrypted()
{
    filename="$1"
    openssl enc -aes-256-cbc -d -in "$filename" -out "temp_file.txt"
    # convert base64 content from temp_file
    unencrypted_message=`openssl enc -base64 -d -in "$filename"`
    echo "mark123"
    echo "$unencrypted_message"
    rm "temp_file.txt"
    
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

























