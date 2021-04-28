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

# network tools/commands

# install macchanger program
sudo apt-get install macchanger
# install tcpdump
sudo apt-get install tcpdump
# install nmap
sudo apt-get install nmap
# install arp-scan
sudo apt-get install arp-scan
# install whois command
sudo apt-get install whois

# multimedia and misc
# install vlc multimedia player
sudo apt-get install vlc
# install fbreader
sudo apt-get install fbreader


# more software items to come when I remember the rest

