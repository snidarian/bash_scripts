#!/usr/bin/bash


hourly="$1"


daily="$((hourly * 8))"


salary="$((daily * 260))"


echo "\$$hourly dollars per/hr translates to a \$$salary per year salary"








