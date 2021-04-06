#! /bin/bash                                                                                  


# Add feature - show current max address for all devices


# macchanger program and ifconfig command are required to use this script.
# Rename $wifidev and $ethdev to your specific hardware device-names

# must have macchanger program installed to run this script                                   
# double check the names of your network devices and change them from wlan0, and eth0 as nece\
ssary                                                                                         

# NOTE                                                                                        
# if your system does not possess the ifconfig command,                                       
# You can download it in the debian package names "net-tools"                                 

# Set these variables equal to your device names                                              
wifidev="wlp8s0"
ethdev="enp4s0"

echo "################MACADDRESSREASSIGN#################"

echo "reconfiguring wifi and ethernet mac addresses..."

echo "$wifidev"
sudo ifconfig $wifidev down && sudo macchanger -r $wifidev && sudo ifconfig $wifidev up
echo "$ethdev"
sudo ifconfig $ethdev down && sudo macchanger -r $ethdev && sudo ifconfig $ethdev up
echo "------------------------------------------------"
echo "eth0 and wlan0 mac addresses randomly configured"
echo "------------------------------------------------"


echo "################MACADDRESSREASSIGN#################"






