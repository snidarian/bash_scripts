# This script quickly sets up a debian based system for my personal use


echo "Setting up system essentials for $(id -un)@$(hostname)"


# make sure system is up-to-date
sudo apt update && sudo apt upgrade


# ----------------------------------------------------------------
# software list

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


# MULTIMEDIA AND MISC
# vlc multimedia player
sudo apt-get install vlc
# install fbreader
sudo apt-get install fbreader
# dict command for command line english dictionary definitions
sudo apt-get install dict
# install rsync for maintaining data archives efficiently
sudo apt-get install rsync

