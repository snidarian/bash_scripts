# -------------------------------------------------------------------------------------------------------------------------

# CUSTOM USER ALIAS DEFINITIONS                                                               
                                                                                              
                                                                                              
# Terminal ease-of-use aliases                                                                
alias cls='clear && ls' # Great command. Clears terminal and lists files in current dir       
alias clls='clear && ls -l'                                                                   
alias clas='clear && ls -a'                                                                   
alias cllas='clear && ls -la'                                                                 
alias numberedls='j=0; for i in `ls`; do j=$(expr $j + 1); echo "$j. $i"; done' # numbers ls output. Can be useful. Has bug: doesn't handle whitespaces well but that's more a fault of the bash for loop than anything. I'll figure out how to fix it

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




