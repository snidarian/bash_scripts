#!/usr/bin/bash



dialog --yesno "Your hostname is: $(hostname). \nWould you like to change it?" 15 60

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








