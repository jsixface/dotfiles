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
if [[ `which nvim 2>/dev/null` ]]
then
	alias vi=nvim
	alias vim=nvim
fi

# some more ls aliases
if [[ `which exa 2>/dev/null` ]]; then
	alias ls=exa
elif [[ `uname` = Darwin ]]; then
	alias ls="ls -G" # -G option for ls is for colors in mac but not in linux
fi

alias -g G='| grep -i'
if [[ `which batcat 2>/dev/null` || `which bat 2>/dev/null` ]]; then
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


if [[ `which snap 2>/dev/null` ]]; then
	alias ubuntu-update="sudo apt update && \
			apt list --upgradable && \
			sudo apt dist-upgrade -y && \
			sudo apt autoremove -y && \
			sudo snap refresh"
else
	alias ubuntu-update="sudo apt update && \
			apt list --upgradable && \
			sudo apt dist-upgrade -y && \
			sudo apt autoremove -y"
fi


alias rf="rm -rf"
alias psef="ps -ef | grep -i"
alias rtfm=man
alias wtf=dmesg
alias please=sudo
alias shazam="sudo su"

alias dig="dig +nocmd +noall +answer"

if [[ `which docker 2>/dev/null` ]]
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

