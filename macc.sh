#! /bin/bash

echo "wlan0"
sudo ifconfig wlan0 down && sudo macchanger -r wlan0 && sudo ifconfig wlan0 up
echo "eth0"
sudo ifconfig eth0 down && sudo macchanger -r eth0 && sudo ifconfig eth0 up

echo "eth0 and wlan0 mac addresses randomly configured"






