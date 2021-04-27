# This script quickly sets up a debian based system for my personal use


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
sudo apt-get install openssh-server
# install macchanger program
sudo apt-get install macchanger
# install tcpdump
sudo apt-get install tcpdump


# more software items to come when I remember the rest

