# --------------------------------------------------------------------------------------------------

# color ansi escape variables

# COLORED ANSI ESCAPE SEQUENCES
black="\e[1;30m"        #Black
red="\e[1;31m"          #Red
green="\e[1;32m"        #Green
yellow="\e[1;33m"       #Yellow
blue="\e[1;34m"         #Blue
purple="\e[1;35m"       #Purple
cyan="\e[1;36m"         #Cyan
white="\e[1;37m"        #White
reset="\e[0m"           #Reset


# ----------------------------------------------------------------------
# CUSTOM USER ALIAS DEFINITIONS                                                               

# Set default editor to emacs -nw (no window (text-based) mode)
export EDITOR='emacs -nw'                                                                                            
# zshrc/bashrc alias command to modify .zshrc/.bashrc file
alias zshrc="$EDITOR $HOME/.zshrc"  
alias bashrc="$EDITOR $HOME/.bashrc"
# modify the inputrc file
alias inputrc="sudo $EDITOR -rv /etc/inputrc"

# access contacts database
alias contacts='manage_contacts.py ~/.contacts.db'

# alarm variable/command (use with eval command)
alarm_10_reps='i=0; while [[ $i -lt 10 ]]; do echo -ne "\a"; sleep .3; echo -ne "\a"; i=$((i+=1)); done'


# Timer Alias -
alias timer='f(){ sleep "$1"m; eval "$alarm_10_reps"; unset -f f; }; f'
alias timer120='sleep 120; eval "$alarm_10_reps"'
alias timer60='sleep 60; eval "$alarm_10_reps"'
alias timer30='sleep 30; eval "$alarm_10_reps"'

# Dog and Hound
alias dog='cat -n' #provides numbered output for cat command using -n flag
alias hound='grep -ni' # grep with numbered line number output for searching source code for keywords


# Terminal ease-of-use aliases
alias cls='clear && ls -F' # Great command. Clears terminal and lists files in current dir
alias clls='clear && ls -lGF'
alias clas='clear && ls -aGF'
alias cllas='clear && ls -laGF'


# Active terminal refresh and list contents in real time "perpertual clear and list"
alias pcls='while [ 1 ]; do cls; sleep 1; done'
alias pclls='while [ 1 ]; do clls; sleep 1; done'
alias pclas='while [ 1 ]; do clas; sleep 1; done'
alias pcllas='while [ 1 ]; do cllas; sleep 1; done'


# colorize diff output - requires colordiff program
alias diff='colordiff'


# Grep should ALWAYS have regex color highlighting
alias grep='grep --color=auto'


# History search aliases
alias tailhist='history | tail -n $1'
alias histgrep='history | grep -i $1'
alias histcount='history | grep -ic $1'

# Modify permissions
alias authorize='sudo chmod +766'
alias deauthorize='sudo chmod -777' # password-locks file

# emacs alias definition
alias enw='emacs -nw'
alias anthomacs='emacs -nw -bg color-20 -fg yellow'


# rm based definitions
alias remove_tests='rm *.test'

# protonvpn definitions
alias iceland='sudo protonvpn c IS#1'



# ssh server commands
# start
alias start_ssh='sudo systemctl start ssh'
# inquire status
alias status_ssh='systemctl status ssh'
# stop
alias stop_ssh='sudo systemctl stop'


# RASPI ALIAS DEFINITIONS

# queries battery life percentage from pisugar-server daemon
alias battery='sudo echo "get battery" | nc -q 0 127.0.0.1 8423'



# ----------------------------------------------------------------------
# CUSTOM USER FUNCTION DEFINITIONS                                                               



# Bettery display function for laptops
# depends on information stored in /sys/class/power_supply/BAT0/


# function that gives battery life in colored output
display_battery_capacity()
{
    battery_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    is_charging="$(cat /sys/class/power_supply/BAT0/status)"
    battery_model="$(cat /sys/class/power_supply/BAT0/model_name)"
    technology="$(cat /sys/class/power_supply/BAT0/technology)"
    charge_cycle="$(cat /sys/class/power_supply/BAT0/cycle_count)"
    # Make recommendation about battery capacity
    if [ $battery_capacity -gt 80 ]; then
        echo "Make sure to discharge to 80% battery before shutting down"
        echo -e "Battery Capacity $yellow= $red$battery_capacity$reset"
    elif [ $battery_capacity -gt 20 ] && [ $battery_capacity -lt 80 ]; then
        echo -e "$blue Battery within optimal working capacity$reset"
        echo -e "Battery Capacity $yellow= $green$battery_capacity$reset"
    elif [ $battery_capacity -lt 20 ]; then
        echo "TURN OFF LAPTOP AND CHARGE BATTERY TO %80"
        echo -e "Battery Capacity $yellow= $red$battery_capacity$reset"
    fi
    # Make recommendation about charging
    if [ $is_charging = "Charging" ]; then
        echo "$yellow ...DO NOT CHARGE WHILE DEVICE IS ON!$reset"
    fi
    echo -e "Charge cycle $yellow= $red$charge_cycle"
#    echo "Status $yellow= $white$is_charching$reset"
#    echo "Model $yellow= $white$battery_model$reset"
#    echo "Tech $yellow= $white$technology$reset"

}

# Alias the above function to a single word 'battery'
alias battery='display_battery_capacity'


############################################################################
# GIT FUNCTION DEFINITIONS
all_in() { git add -A; git commit -m "$1"; git push; }

# pulls all changes from remote repositories and merges them
pull_all() { pwd="$(pwd)";
	     for foldervar in ~/git_workfolders/*;
	     do
		 cd "$foldervar";
		 git pull;
	     done;
	     cd "$pwd";
	   }

# pushes all repository changes (all repos in ~/git_workfolders)
push_all() { comment=$1; pwd="$(pwd)";
	     for foldervar in ~/git_workfolders/*;
	     do
		 cd "$foldervar";
		 git add -A;
		 git commit -m "$comment";
		 git push;
	     done;
	     # change back to original dir
	     cd "$pwd";
	   }

# Reports 'git status' on all repositories in ~/git/workfolders
status_all() { pwd="$(pwd)";
	       for foldervar in ~/git_workfolders/*;
	       do
		   echo -e "${blue}$foldervar${reset}"
		   cd "$foldervar";
		   git status;
	       done;
	       # change back to original directory
	       cd "$pwd";
	     }

# pulls bash_scripts repo and sources aliases and functions in alias_definitions.sh file
# set this function at the end of a .bashrc
pull_and_source()
{
    # pull bash_scripts repo                                                                                                                              
    cd ~/git_workfolders/bash_scripts; git pull; cd;
    # source aliases from bash_scripts to local .bashrc or .zshrc file
    source ~/git_workfolders/bash_scripts/alias_definitions.sh
    # clear
}






# -------------------------------------------------------------------------------------------------------




