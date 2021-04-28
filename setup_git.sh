#!/usr/bin/bash

# sets up git hub environment
# script to augment and change overtime as additional preferences are gained


# configure git credentials as snidarian
git config --global user.name "snidarian"
git config --global user.email "cephalopod31956@gmail.com"

# make git_workfolders directory in home/user/ directory
mkdir ~/git_workfolders
cd ~/git_workfolders # cd directory to ~/git_workfolders before cloning all git repos

# git repository clone list

# dotfiles - important configuration files
git clone git@github.com:snidarian/dotfiles.git
# bash scripts - essential bash scripts for various tasks
git clone git@github.com:snidarian/bash_scripts.git
# sandbox - for experimentation and command practice
git clone git@github.com:snidarian/sandbox.git
# Language_fundamentals - where I keep the syntax files for various langauges
git clone git@github.com:snidarian/Language_Fundamentals.git
# syntax and refreshers for linux networking commands and theory
git clone git@github.com:snidarian/linux_networking.git



