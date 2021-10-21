#!/usr/bin/bash

# This script quickly sets up a debian based system for my personal use
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
# software list

# install htop
sudo apt-get install htop
# git
sudo apt-get install git
# emacs
sudo apt-get install emacs
# vim
sudo apt-get install vim
# ccrypt
sudo apt-get install ccrypt
# tclsh
sudo apt-get install tclsh
# Common LISP
sudo apt-get install clisp
# JDK
sudo apt-get install default-jdk
# install dialog command for Bash GUIs
sudo apt-get install dialog
# install npm (node package manager)
sudo apt-get install npm
# install openssh-server
sudo apt-get install openssh-server
# install tree (terminal system directory hierarchy viewer)
sudo apt-get install tree
# install ffmpeg
sudo apt-get install ffmpeg

# NETWORK TOOLS/COMMANDS
# curl
sudo apt-get install curl
# net-tools (for ifconfig)
sudo apt-get install net-tools
# install reimplementation of traditional netcat (contains -e and -c flags)
sudo apt-get install ncat
# install net-tools (for ifconfig)
sudo apt-get install net-tools
# Install openssh-server
sudo apt-get install openssh-server
# install macchanger program
sudo apt-get install macchanger
# tcpdump
sudo apt-get install tcpdump
# install nmap
sudo apt-get install nmap
# install arp-scan
sudo apt-get install arp-scan
# install whois command
sudo apt-get install whois
# install wireshark
sudo apt-get install wireshark
# install netdiscover (active/passive) network scanning
sudo apt-get install netdiscover
# install ipcalc
sudo apt-get install ipcalc


# multimedia and misc
# vlc multimedia player
sudo apt-get install vlc
# install fbreader
sudo apt-get install fbreader
# dict command for command line english dictionary definitions
sudo apt-get install dict
# install rsync for maintaining data archives efficiently
sudo apt-get install rsync

# ---------------------------------------------------------------
# SETUP PROTONVPN
# install software dependencies for protonvpn community linux app

echo -e "${red}INSTALLING PROTONVPN DEPENDENCIES${reset}"
sudo apt install -y openvpn dialog python3-pip python3-setuptools

sudo pip3 install protonvpn-cli

echo "Beginning protonvpn init process"
echo "log into protonvpn.com and access account credentials to continue"
sudo protonvpn init


# ----------------------------------------------------------------
# Setup Python3 & Python3 dependencies

# download pip3
sudo apt-get install pip3
# pipenv package for creating project directories with specific python3 version and dependencies
pip3 install pipenv
# Install python modules that I use in various projects
pip3 install sqlite3 fastapi texttable colorama sqlalchemy wikipedia lxml selenium pynput pyautogui


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


# make git_workfolders directory in home/user/ directory
mkdir ~/git_workfolders
cd ~/git_workfolders # cd directory to ~/git_workfolders before cloning all git repos

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
    echo "source ~/git_workfolders/bash_scripts/alias_definitions.sh" >> ~/.bashrc
    # add $HOME/.local/bin to the path as fourth item
    echo "# add .local/bin to the $PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.bashrc
    # git_workfolders bin as third in path path
    echo "# add ~/git_workfolders/bin to the $PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/git_workfolders/bin:$PATH\"" >> ~/.bashrc
    # add git_workfolders/bash_scripts as second folder in path
    echo "# Add git bash_scripts repository folder to PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/git_workfolders/bash_scripts:$PATH\"" >> ~/.bashrc
    # add home bin directory as first directory in path
    echo "# Add home bin directory as first directory in PATH" >> ~/.bashrc
    echo "PATH=\"$HOME/bin:$PATH\"" >> ~/.bashrc
    
elif [[ $rc_file == "zsh" ]]; then
    echo "Zsh chosen"
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
    echo "source ~/git_workfolders/bash_scripts/alias_definitions.sh" >> ~/.zshrc
    # add source from bash_scripts/zsh_keybindings.sh file
    echo "# source keybindings from bash_scripts to shell .zshrc file" >> ~/.zshrc
    echo "source ~/git_workfolders/bash_scripts/zsh_keybindings.sh" >> ~/.zshrc
    # add $HOME/.local/bin to the path as fourth item
    echo "# add .local/bin to the $PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.zshrc
    # git_workfolders bin as third in path path
    echo "# add ~/git_workfolders/bin to the $PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/git_workfolders/bin:$PATH\"" >> ~/.zshrc
    # add git_workfolders/bash_scripts as second folder in path
    echo "# Add git bash_scripts repository folder to PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/git_workfolders/bash_scripts:$PATH\"" >> ~/.zshrc
    # add home bin directory as first directory in path
    echo "# Add home bin directory as first directory in PATH" >> ~/.zshrc
    echo "PATH=\"$HOME/bin:$PATH\"" >> ~/.zshrc
    

fi

# ----------------------------------------------------------
# ADD AND DOWNLOAD SELECT PROGRAMS TO HOME BIN DIRECTORY

cd ~/bin

# Download runescape Runelite client and authorize it
wget https://github.com/runelite/launcher/releases/download/2.1.5/RuneLite.AppImage
sudo chmod +x Runelite.AppImage

# copy current pywik.py version to ~/bin as 'pywik'
cp ~/git_workfolders/pywik/pywik.py ./pywik



# Add other item to download or place in the home bin directory

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
aa[8]="React dev tools"


echo "Reminder list of Firefox Add-ons to install"

for item in "${aa[@]}"; do
    echo -ne "${gree}$item${reset}, "
done

echo ""




