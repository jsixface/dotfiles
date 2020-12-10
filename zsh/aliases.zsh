# profile aliases for arumugam
alias -- +='pushd .'
alias -- -='popd'
alias ..='cd ..'
alias o='less'
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


alias gca='git commit -a'
#alias git='git --no-pager'
alias gits='git status -bs'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git commit -am "betterer code"'

alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt upgrade -y && sudo apt autoremove -y'
alias rf="rm -rf"
alias rtfm=man
alias wtf=dmesg

if [[ `which docker` ]]
then
	alias dkr='docker run -it --rm'
	alias dps='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
fi

function lstar() {
	tar -tf $1 |less
}

function mkcd() {
	mkdir -p $1
	cd $1
}
