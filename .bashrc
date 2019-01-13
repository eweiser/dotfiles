# git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# coloring the terminal command line
SB_GREEN="\[\033[1;32m\]"
SB_BLUE="\[\033[1;34m\]"
SB_RED="\[\033[1;31m\]"
SB_NOCOLOR="\[\033[0m\]"

export PS1="$SB_RED\w$SB_GREEN\$(parse_git_branch)$SB_NOCOLOR$ "

###
# bash aliases
###

alias scg='java -jar ~/workspace/swagger-codegen-cli-2.2.1.jar'
alias tmux='tmux -2'
alias vi='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
