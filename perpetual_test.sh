#!/usr/bin/bash

# script takes a program and perpetually tests it in realtime as it is written.
# essentially in part replicating and extending the some functions of an IDE


# Argv1 is the program to perpetually test


test_program=$1


while [ 1 ]; do
    "./$test_program";
    sleep 2;
    clear;
done
























