# -------------------------------------------------------------------------------------------------------------------------

# CUSTOM USER ALIAS DEFINITIONS                                                               


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
alias cls='clear && ls' # Great command. Clears terminal and lists files in current dir
alias clls='clear && ls -lG'
alias clas='clear && ls -aG'
alias cllas='clear && ls -laG'


# Active terminal refresh and list contents in real time "perpertual clear and list"
alias pcls='while [ 1 ]; do cls; sleep 1; done'
alias pclls='while [ 1 ]; do clls; sleep 1; done'
alias pclas='while [ 1 ]; do clas; sleep 1; done'
alias pcllas='while [ 1 ]; do cllas; sleep 1; done'


# git function definitions
all_in() { git add -A; git commit -m "$1"; git push; }

# pulls all changes from remote repositories and merges them
pull_all() { pwd="$(pwd)"; for foldervar in ~/git_workfolders/*; do cd "$foldervar"; git pull; done; cd "$pwd"; }

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



# colorize diff output - requires colordiff program
alias diff='colordiff'


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


# ssh server commands
# start
alias start_ssh='sudo systemctl start ssh'
# inquire status
alias status_ssh='sudo systemctl status ssh'
# stop
alias stop_ssh='sudo systemctl stop'



# -------------------------------------------------------------------------------------------------------------------------




