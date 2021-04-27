# This script quickly sets up a debian based system for my personal use

# MAKE SURE PRIOR TO RUNNING THIS SCRIPT TO DO THE FOLLOWING:
# run ssh-keygen to generate rsa public key
# add said key to list of ssh keys on github.com


# begin executions

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
# openssh server

# network tools/commands
sudo apt-get install openssh-server
# install macchanger program
sudo apt-get install macchanger
# tcpdump
sudo apt-get install tcpdump
# install nmap
sudo apt-get install nmap
# install whois command
sudo apt-get install whois

# multimedia and misc
# vlc multimedia player
sudo apt-get install vlc
# install fbreader
sudo apt-get install fbreader


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


# ----------------------------------------------------------
# Setup home bin folder and add ~/bin to the PATH variable

# make home bin directory
mkdir ~/bin

echo -e "\n\n\n#----------------------------------------------" >> ~/.bashrc
echo -e "# USER ADDED Add home bin directory to PATH" >> ~/.bashrc
echo "PATH=\"$PATH:~/bin\"" >> ~/.bashrc

echo -e "# Add git bash_scripts repository folder to PATH" >> ~/.bashrc
echo "PATH=\"$PATH:~/git_workfolders/bash_scripts\"" >> ~/.bashrc



# add essential aliases
echo -e "\n\n# source aliases from bash_scripts to local .bashrc file" >> ~/.bashrc

echo "source ~/git_workfolders/bash_scripts/alias_definitions.sh" >> ~/.bashrc



