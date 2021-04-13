# -------------------------------------------------------------------------------------------------------------------------

# CUSTOM USER ALIAS DEFINITIONS                                                               

# alarm variable/command (use with eval command)
alarm_10_reps='i=0; while [[ $i -lt 10 ]]; do echo -ne "\a"; sleep .3; echo -ne "\a"; i=$((i+=1)); done'


# Timer Alias -
alias timer15m='sleep 900; eval "$alarm_10_reps"'
alias timer10m='sleep 600; eval "$alarm_10_reps"'
alias timer5m='sleep 300; eval "$alarm_10_reps"'
alias timer2m='sleep 120; eval "$alarm_10_reps"'
alias timer1m='sleep 60; eval "$alarm_10_reps"'
alias timer120='sleep 120; eval "$alarm_10_reps"'
alias timer60='sleep 60; eval "$alarm_10_reps"'
alias timer30='sleep 30; eval "$alarm_10_reps"'
alias timertest='sleep 3; eval "$alarm_10_reps"'

# Dog and Hound
alias dog='cat -n' #provides numbered output for cat command using -n flag
alias hound='grep -ni' # grep with numbered line number output for searching source code for keywords


# Terminal ease-of-use aliases
alias cls='clear && ls' # Great command. Clears terminal and lists files in current dir
alias clls='clear && ls -lG'
alias clas='clear && ls -aG'
alias cllas='clear && ls -laG'


# git definitions
alias all_in='git add -A; git commit; git push'



# Active terminal refresh and list contents in real time "perpertual clear and list"
alias pcls='while [ 1 ]; do cls; sleep 1; done'
alias pclls='while [ 1 ]; do clls; sleep 1; done'
alias pclas='while [ 1 ]; do clas; sleep 1; done'
alias pcllas='while [ 1 ]; do cllas; sleep 1; done'


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





# -------------------------------------------------------------------------------------------------------------------------




