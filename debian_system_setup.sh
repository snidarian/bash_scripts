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

# git
sudo apt-get install git
# emacs
sudo apt-get install emacs
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

# NETWORK TOOLS/COMMANDS
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
# bash scripts - essential bash scripts for various tasks
git clone git@github.com:snidarian/bash_scripts.git
# sandbox - for experimentation and command practice
git clone git@github.com:snidarian/sandbox.git
# Language_fundamentals - where I keep the syntax files for various langauges
git clone git@github.com:snidarian/Language_Fundamentals.git
# syntax and refreshers for linux networking commands and theory
git clone git@github.com:snidarian/linux_networking.git
# add raspi programs repo
git clone git@github.com:snidarian/raspi_programs.git



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
    echo "# USER ADDED Add home bin directory to PATH" >> ~/.bashrc
    echo "PATH=\"$PATH:~/bin\"" >> ~/.bashrc

    echo "# Add git bash_scripts repository folder to PATH" >> ~/.bashrc
    echo "PATH=\"$PATH:$HOME/git_workfolders/bash_scripts\"" >> ~/.bashrc
    # add essential aliases
    echo ""
    echo ""
    echo "# source aliases from bash_scripts to local .bashrc file" >> ~/.bashrc
    echo "source ~/git_workfolders/bash_scripts/alias_definitions.sh" >> ~/.bashrc
    
elif [[ $rc_file == "zsh" ]]; then
    echo "Zsh chosen"
    # ----------------------------------------------------------
    # Setup home bin folder and add ~/bin to the PATH variable
    # make home bin directory
    mkdir ~/bin
    echo ""
    echo ""
    echo "#----------------------------------------------" >> ~/.zshrc
    echo "# USER ADDED Add home bin directory to PATH" >> ~/.zshrc
    echo "PATH=\"$PATH:~/bin\"" >> ~/.zshrc
    echo "# Add git bash_scripts repository folder to PATH" >> ~/.zshrc
    echo "PATH=\"$PATH:$HOME/git_workfolders/bash_scripts\"" >> ~/.zshrc
    echo ""
    echo ""
    # add essential aliases
    echo "# source aliases from bash_scripts to local .bashrc file" >> ~/.zshrc
    echo "source ~/git_workfolders/bash_scripts/alias_definitions.sh" >> ~/.zshrc
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
aa[7]="React dev tools"


echo "List of Firefox Add-ons to install"

for item in "${aa[@]}"; do
    echo -ne "${gree}$item${reset}, "
done

echo ""




