#!/usr/bin/bash

# This script quickly sets up a debian based system for personal use
# script will prompt user for selection of bash (.bashrc) or zsh (.zshrc)

# MAKE SURE PRIOR TO RUNNING THIS SCRIPT TO DO THE FOLLOWING:
# 1. run ssh-keygen to generate rsa public key
# 2. add said key to list of public ssh keys on github.com



# DEFINITIONS

# Ansi color definitions
red="\e[1;31m"
blue="\e[1;34m"
green="\e[1;32m"
white="\e[1;37m"
reset="\e[0m"

# FUNCTION DEFINITIONS
foo()
{
    echo "pass"
}

# EXECUTIONS
echo "Setting up system essentials for $(id -un)@$(hostname)"

# make sure system is up-to-date
sudo apt update && sudo apt upgrade

# ----------------------------------------------------------------
echo "########################"
echo "Primary software payload"
echo "########################"

# install main preffered software
sudo apt-get install htop neofetch cmatrix git emacs ccrypt tclsh clisp dialog openssh-server tree stress baobab curl net-tools ncat macchanger tcpdump nmap arp-scan whois wireshark netdiscover ipcalc ansiweather 


echo "################################"
echo "Downloading zsh debian ecosystem"
echo "################################"

sudo apt-get install zsh*


echo "######################"
echo "multimedia and misc"
echo "######################"

sudo apt-get install ffmpeg rsync dict fbreader vlc

# ----------------------------------------------------------------
# Setup Python3 & Python3 dependencies

# download pip3
sudo apt-get install pip3
# pipenv package for creating project directories with specific python3 version and dependencies
# Install python modules that I use in various projects
pip3 install sqlite3 fastapi texttable colorama sqlalchemy wikipedia lxml selenium pynput pyautogui pipenv


# ####################################################
# GENERATE KEY AND ADD KEY TO GITHUB

# PROMPT - ASK TO GENERATE RSA SSH public/private key pair
dialog --yesno "Generate SSH public/private key pair?" 15 60

# Exit variable used in control flow
change="$?"
clear

if [[ $change == 0 ]]; then
    # Generate SSH key pair
    ssh-keygen -b 4096 -t rsa
elif [[ $change == 1 ]]; then
    echo "SSH key pair not generated"
fi


echo -e "${red}GO ADD CURRENT PUBLIC KEY TO GITHUB${reset} (if not done already)."
echo "Press Enter to continue"
read placeholder_variable


# -------------------------------------------------------------------------
# GIT SECTION

echo -e "${red}CONFIGURING GIT${reset}"

# configure git credentials as snidarian
git config --global user.name "snidarian"
git config --global user.email "cephalopod31956@gmail.com"


# mkdir Repositories directory
mkdir ~/Repositories
cd ~/Repositories 

# git repository clone list

# dotfiles - important configuration files
git clone git@github.com:snidarian/dotfiles.git
# bin - Folder that houses all the programs I want in my ~/bin folder.
git clone git@github.com:snidarian/bin.git
# bash scripts - essential bash scripts for various tasks
git clone git@github.com:snidarian/bash_scripts.git
# sandbox - for experimentation and command practice
git clone git@github.com:snidarian/sandbox.git
# Language_fundamentals - where I keep the syntax files for various langauges
git clone git@github.com:snidarian/language_fundamentals.git
# syntax and refreshers for linux networking commands and theory
git clone git@github.com:snidarian/linux_networking.git
# add raspi programs repo
git clone git@github.com:snidarian/raspi_programs.git
# vs code workfolder repository
git clone git@github.com:snidarian/vs_code.git
# pywik.py python3 wikipedia cli search tool repository
git clone git@github.com:snidarian/pywik.git
# bash quick reference
git clone git@github.com:snidarian/Bash_quick_reference.git
# book strings repo - storing quotes from books I've read
git clone git@github.com:snidarian/Bash_quick_reference.git
# manage_contacts.py
git clone git@github.com:snidarian/Bash_quick_reference.git


# change back to original home directory directory
cd


rc_file=$(dialog --stdout --menu ".bashrc or .zshrc?" 10 30 2 bash .bashrc zsh .zshrc)


if [[ $rc_file == "bash" ]]; then
    echo "Bash chosen"
    #    ----------------------------------------------------------
    # Setup home bin folder and add ~/bin to the PATH variable
    # make home bin directory
    mkdir ~/bin
    echo ""
    echo ""
    echo "#----------------------------------------------" >> ~/.bashrc
    # add 'source from bash_aliases' to line to shell .rc file
    echo ""
    echo ""
    echo "# source aliases from bash_scripts to local shell .rc file" >> ~/.bashrc
    echo "source ~/Repositories/bash_scripts/alias_definitions.sh" >> ~/.bashrc
    # add $HOME/.local/bin to the path as fourth item
    echo "# add .local/bin to the $PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.bashrc
    # git_workfolders bin as third in path path
    echo "# add ~/Repositories/bin to the $PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/Repositories/bin:$PATH\"" >> ~/.bashrc
    # add git_workfolders/bash_scripts as second folder in path
    echo "# Add git bash_scripts repository folder to PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/Repositories/bash_scripts:$PATH\"" >> ~/.bashrc
    # add home bin directory as first directory in path
    echo "# Add home bin directory as first directory in PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/bin:$PATH\"" >> ~/.bashrc
    # add neofetch line to .bashrc
    echo "neofetch" >> ~/.bashrc
    # add weather forcast line
    echo 'ansiweather -l "$(cat ~/.LOCATION)" -u imperial -a false' >> ~/.bashrc
    
elif [[ $rc_file == "zsh" ]]; then
    echo "Zsh chosen"
    # cat overwrite Kali style zsh setup from ~/Repositories/dotfiles/zshrc
    cat ~/Repositories/dotfiles/zshrc > ~/.zshrc
    # ----------------------------------------------------------
    # Setup home bin folder and add ~/bin to the PATH variable
    # make home bin directory
    mkdir ~/bin
    echo ""
    echo ""
    echo "#----------------------------------------------" >> ~/.zshrc
    # add 'source from bash_aliases' to line to shell .rc file
    echo ""
    echo ""
    echo "# source aliases from bash_scripts to .zshrc file" >> ~/.zshrc
    echo "source ~/Repositories/bash_scripts/alias_definitions.sh" >> ~/.zshrc
    # add source from bash_scripts/zsh_keybindings.sh file
    echo "# source keybindings from bash_scripts to shell .zshrc file" >> ~/.zshrc
    echo "source ~/Repositories/bash_scripts/zsh_keybindings.sh" >> ~/.zshrc
    # add $HOME/.local/bin to the path as fourth item
    echo "# add .local/bin to the $PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.zshrc
    # git_workfolders bin as third in path path
    echo "# add ~/Repositories/bin to the $PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/Repositories/bin:$PATH\"" >> ~/.zshrc
    # add git_workfolders/bash_scripts as second folder in path
    echo "# Add git bash_scripts repository folder to PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/Repositories/bash_scripts:$PATH\"" >> ~/.zshrc
    # add home bin directory as first directory in path
    echo "# Add home bin directory as first directory in PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/bin:$PATH\"" >> ~/.zshrc
    # add neofetch line to .zshrc
    echo "neofetch" >> ~/.zshrc
    # add weather forcast line
    echo 'ansiweather -l "$(cat ~/.LOCATION)" -u imperial -a false' >> ~/.zshrc
    

fi

# ----------------------------------------------------------
# ADD AND DOWNLOAD SELECT PROGRAMS TO HOME BIN DIRECTORY

cd ~/bin

# copy current pywik.py version to ~/bin as 'pywik'
cp ~/Repositories/pywik/pywik.py ./pywik



# back to home directory
cd

# ----------------------------------------------------------
# PROMPT - ASK Y/N TO CHANGE HOSTNAME
dialog --yesno "Your hostname is: $(hostname). \nWould you like to change it?" 15 60

# Exit variable used in control flow
change="$?"

if [[ $change == 0 ]]; then
    clear
    echo -n "Enter new hostname: "
    read new_hostname
    sudo nano /etc/hostname
    echo "Add your hostname manually to /etc/hosts file..."
    sleep 3
    sudo nano /etc/hosts
    echo "The hostname of your public RSA key needs to be changed..."
    sleep 3
    sudo nano ~/.ssh/id_rsa.pub
    echo "Now changing hostname in hostnamectl daemon"
    sudo hostnamectl set-hostname "$new_hostname"
elif [[ $change == 1 ]]; then
    echo "Hostname remains unchanged"
fi


# List all Firefox browser plugins to install from the command line
# Associative array for listing all browser add-ons/plugins:
declare -A aa
aa[0]="Ublock Origin"
aa[1]="Night mode pro"
aa[2]="Privacy Possum"
aa[3]="Privacy Badger"
aa[4]="Ghostery"
aa[5]="Midnight Lizard"
aa[6]="Vimium C"
aa[7]="xpath finder"



echo "Reminder list of Firefox Add-ons to install"

for item in "${aa[@]}"; do
    echo -ne "${gree}$item${reset}, "
done

echo ""



############################################
#########SETUP USER LOCATION################
############################################


## used for purposes of displaying local weather on terminal startup

touch ~/.LOCATION

dialog --inputbox "Input your location [city],[state],[country]\nFor example: Canton,PA,US or Montgomery,AL,US\nThis info is used for displaying openweather data on terminal startup" 10 75 2> ~/.LOCATION





##########################################################
#display reminder to download personal VPN and initialize#
##########################################################

dialog --infobox "Remember to set up personal VPN" 9 50
