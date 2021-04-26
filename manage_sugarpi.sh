#!/usr/bin/bash

# script that creates a readout of all battery information (runs in an infinite loop)

# commands for interacting with the pisugar server

# # reload daemon
# sudo systemctl daemon-reload

# # check status
# sudo systemctl status pisugar-server

# # start service
# sudo systemctl start pisugar-server

# # stop service
# sudo systemctl stop pisugar-server

# # disable service
# sudo systemctl disable pisugar-server

# # enable service
# sudo systemctl enable pisugar-server



while [ 1 ]; do
    echo "get battery" | nc -q 0 127.0.0.1 8423
    echo "get battery_charging" | nc -q 0 127.0.0.1 8423
    echo "get model" | nc -q 0 127.0.0.1 8423
    echo "get rtc_time" | nc -q 0 127.0.0.1 8423
    #echo "get battery_i" | nc -q 0 127.0.0.1 8423 # battery amperage
    #echo "get battery_v" | nc -q 0 127.0.0.1 8423 # battery voltage
    sleep 2
    clear
done








