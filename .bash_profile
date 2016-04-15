alias inny='ssh eweiser@inny-jump1.sailthru.com'
alias nj1='ssh -A eweiser@nj1-jump1.sailthru.com'
alias vgate='ssh eweiser@vpc-jump1.sailthru.com'
alias nj1graphite='ssh -L 8888:nj1-grf-1.flt:80 eweiser@nj1-jump1.sailthru.com'
alias nj1bridge="ssh -L 5555:localhost:5000 eweiser@vpc-jump1.sailthru.com"
alias nj1nagios="ssh -L 8881:172.18.3.106:80 -N eweiser@nj1-jump1.sailthru.com"
alias dashboard='ssh -L 8889:10.0.3.150:3000 -A -t eweiser@vpc-jump1.sailthru.com ssh -A -t ec2-user@10.0.3.150'

alias create="php ~/dev/devtools/workflow/create.php"                                                                                                                                                                                                                     
alias pullreq="php ~/dev/devtools/workflow/pullreq.php"                                                                                                                                                                                                                   
alias complete="php ~/dev/devtools/workflow/complete.php"                                                                                                                                                                                                                 
alias release="php ~/dev/devtools/workflow/release.php"                                                                                                                                                                                                                   
alias git-branch="php ~/dev/devtools/workflow/git-branch.php"                                                                                                                                                                                                             
alias checkout="php ~/dev/devtools/workflow/git-checkout.php"                                                                                                                                                                                                             
alias commit="php ~/dev/devtools/workflow/git-commit.php $1"

alias activemq="/usr/local/Cellar/activemq/5.11.1/bin/activemq $1"

# git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# coloring the terminal command line
SB_GREEN="\[\033[1;32m\]"
SB_BLUE="\[\033[1;34m\]"
SB_RED="\[\033[1;31m\]"
SB_NOCOLOR="\[\033[0m\]"
export PS1="$SB_BLUE\w$SB_GREEN\$(parse_git_branch)$SB_NOCOLOR$ "
export PATH=/usr/local/bin:$PATH

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# dummy AWS creds needed to start up dropwizard services
export AWS_ACCESS_KEY=foo
export AWS_SECRET_KEY=bar

# needed to run docker
eval "$(docker-machine env default)"
