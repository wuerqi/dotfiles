# Use colors in coreutils output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls'

# directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"


#git() {
#    if [ "$1" = log ]; then
#        shift
#        set --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -- "$@"
#    fi
#    command git "$@"
#}
