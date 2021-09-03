# profile aliases for arumugam
alias ..='cd ..'

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias lart='ls -1Fcart'

alias t=tree
alias tl='tree -L 2'
alias tl2='tree -L 3'

alias ping="ping -c 4"
alias untar="tar -xvf"
alias untarz="tar -xzvf"
alias tarc='tar -cvf'
alias tarz='tar -czvf'

alias vii='vim -R'
if [[ `which nvim` ]]
then
	alias vi=nvim
	alias vim=nvim
fi

# some more ls aliases
# -G option for ls is for colors in mac but not in linux
if [[ `uname` = Darwin ]]
then
    alias ls="ls -G"
fi

alias -g G='| grep -i'
alias -g S='| sort'
alias -g U='| uniq'

if ! which batcat > /dev/null 2>&1
then
	alias -g L='| batcat --pager "less -R"'
	alias -g LL="2>&1 | batcat"
else
alias -g L="| less -R"
alias -g LL="2>&1 | less"
fi

alias gca='git commit -a'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git add .; git commit -am "betterer code"'

`which snap > /dev/null 2>&1` && \
	alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo snap refresh' || \
	alias ubuntu-update='sudo apt update && apt list --upgradable && sudo apt dist-upgrade -y && sudo apt autoremove -y' 

alias rf="rm -rf"
alias psef="ps -ef | grep -i"
alias rtfm=man
alias wtf=dmesg
alias please=sudo
alias shazam="sudo su"

alias dig='dig +noall +answer'
alias dig="dig +nocmd +noall +answer"

alias dig="dig +nocmd +noall +answer"

if [[ `which docker` ]]
then
	alias dkr='docker run -it --rm'
	alias dps='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
fi

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'
alias path='echo $PATH | sed "s/:/\n/g" | sort' # Quick display path

function lstar() {
	tar -tf $1 |less
}

function mkcd() {
	mkdir -p $1
	cd $1
}


function cd() {
	case $# in
		0)
			builtin cd
			;;

		1)
			builtin cd $1
			ls
			;;
		*)
			;;
	esac
}



alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'