# profile aliases for arumugam
alias -- +='pushd .'
alias -- -='popd'
alias ..='cd ..'
alias o='less'
alias grep='grep --color'
alias c=clear

alias ping="ping -c 4"
alias untar="tar -xvf"
alias untarz="tar -xzvf"
alias tarc='tar -cvf'
alias tarz='tar -czvf'

alias vii='vim -R'

# some more ls aliases
# -G option for ls is for colors in mac but not in linux
if [[ `uname` = Darwin ]]
then
    alias ls="ls -G"
fi

alias l='ls -lh'
alias ll='ls -lF'
alias lt='ls -lFrt'
alias la='ls -al'

if [[ `which exa > /dev/null` ]]
then
	alias ls='exa'
	alias lrt='ls -l --sort new'
fi

alias gca='git commit -a'
#alias git='git --no-pager'
alias gits='git status -bs'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'

alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt upgrade -y && sudo apt autoremove -y'
alias rf="rm -rf"


if [[ `which docker` ]]
then
	alias dkr='docker run -it --rm'
	alias dps='docker ps --all --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
	alias dcps='docker-compose ps'
fi


