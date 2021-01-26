#! /bin/bash
# must have macchanger program installed to run this script
# double check the names of your network devices and change them from wlan0, and eth0 as necessary

echo "reconfiguring wifi and ethernet..."

echo "wlan0"
sudo ifconfig wlan0 down && sudo macchanger -r wlan0 && sudo ifconfig wlan0 up
echo "eth0"
sudo ifconfig eth0 down && sudo macchanger -r eth0 && sudo ifconfig eth0 up
echo "------------------------------------------------"
echo "eth0 and wlan0 mac addresses randomly configured"
echo "------------------------------------------------"





