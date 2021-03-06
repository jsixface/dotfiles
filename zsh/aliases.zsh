# profile aliases for arumugam
alias -- +='pushd .'
alias -- -='popd'
alias ..='cd ..'
alias c=clear

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias t=tree
alias tl='tree -L 1'
alias tl2='tree -L 2'

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

alias -g G='| grep -i'
alias -g S='| sort'
alias -g U='| uniq'
alias -g L="| less -R"
alias -g LL="2>&1 | less"

alias gca='git commit -a'
#alias git='git --no-pager'
alias gits='git status -bs'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git add .; git commit -am "betterer code"'

`which snap > /dev/null` && \
	alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo snap refresh' || \
	alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt dist-upgrade -y && sudo apt autoremove -y' 

alias rf="rm -rf"
alias rtfm=man
alias wtf=dmesg
alias please=sudo

alias dig="dig +nocmd +noall +answer"

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

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'