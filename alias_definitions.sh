# -------------------------------------------------------------------------------------------------------------------------

# CUSTOM USER ALIAS DEFINITIONS                                                               
                                                                                              
                                                                                              
# Terminal ease-of-use aliases                                                                
alias cls='clear && ls' # Great command. Clears terminal and lists files in current dir       
alias clls='clear && ls -l'  # clears and lists with long list flag specifier                         
alias clas='clear && ls -a'  # clears and list with hidden file flag specifier                                                                 
alias cllas='clear && ls -la' # Same but with long and hidden file flags                
alias numberedls='j=0; for i in `ls`; do j=$(expr $j + 1); echo "$j. $i"; done' # numbers ls output. Can be useful. Has bug: doesn't handle whitespaces well but that's more a fault of the bash for loop than anything. I'll figure out how to fix it


# Active terminal refresh and list contents in real time                                                                                                                                                           
alias tcls='while [ 1 ]; do cls; sleep 1; done'
alias tclls='while [ 1 ]; do clls; sleep 1; done'
alias tclas='while [ 1 ]; do clas; sleep 1; done'
alias tcllas='while [ 1 ]; do cllas; sleep 1; done'

# colorize diff output - requires colordiff program                                                                                                                                                                
alias diff='colordiff'


# history search aliases
alias tailhist='history | tail -n $1'                                                         
alias histgrep='history | grep -i $1'
alias histcount='history | grep -ic $1'

# user permissions aliases
alias authorize='sudo chmod +766'                                                               
alias deauthorize='sudo chmod -677'                                                                                              
                                                                                              
# emacs alias definitions                                                                                                                                           
alias enw='emacs -nw'
alias anthomacs='emacs -nw -bg color-20 -fg yellow' 






# -------------------------------------------------------------------------------------------------------------------------




