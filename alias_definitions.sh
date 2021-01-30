# -------------------------------------------------------------------------------------------------------------------------

# CUSTOM USER ALIAS DEFINITIONS                                                               
                                                                                              
                                                                                              
# Terminal ease-of-use aliases                                                                
alias cls='clear && ls' # Great command. Clears terminal and lists files in current dir       
alias clls='clear && ls -l'                                                                   
alias clas='clear && ls -a'                                                                   
alias cllas='clear && ls -la'                                                                 

# history search aliases
alias tailhist='history | tail -n $1'                                                         
alias histgrep='history | grep -i $1'
alias histcount='history | grep -ic $1'

# user permissions aliases
alias authorize='sudo chmod +766'                                                               
alias deauthorize='sudo chmod -777'                                                                                              
                                                                                              
# emacs alias definitions                                                                                                                                           
alias anthomacs='emacs -nw -bg color-20 -fg yellow' 






# -------------------------------------------------------------------------------------------------------------------------




