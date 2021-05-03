#!/usr/bin/bash

# This script quickly sets up a debian based system for my personal use
# script will prompt user for selection of bash (.bashrc) or zsh (.zshrc)

# MAKE SURE PRIOR TO RUNNING THIS SCRIPT TO DO THE FOLLOWING:
# 1. run ssh-keygen to generate rsa public key
# 2. add said key to list of public ssh keys on github.com

# DEFINITIONS

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

# emacs
sudo apt-get install emacs
# ccrypt
sudo apt-get install ccrypt
# net-tools (for ifconfig)
sudo apt-get install net-tools
# tclsh
sudo apt-get install tclsh
# Common LISP
sudo apt-get install clisp
# JDK
sudo apt-get install default-jdk
# install dialog command for Bash GUIs
sudo apt-get install dialog

# NETWORK TOOLS/COMMANDS
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


# multimedia and misc
# vlc multimedia player
sudo apt-get install vlc
# install fbreader
sudo apt-get install fbreader
# dict command for command line english dictionary definitions
sudo apt-get install dict


# -------------------------------------------------------------------------
# GIT SECTION

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









