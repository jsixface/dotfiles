## LS aliases
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
if (( ${+commands[nvim]} ))
then
	alias vi=nvim
	alias vim=nvim
fi

# some more ls aliases
if (( ${+commands[exa]} )); then
	alias ls=exa
elif [[ `uname` = Darwin ]]; then
	alias ls="ls -G" # -G option for ls is for colors in mac but not in linux
fi

alias -g G='| grep -i'
if (( ${+commands[batcat]} )); then
	if (( ! ${+commands[bat]} )); then
		alias bat=batcat
	fi
fi
if command -v bat &>/dev/null; then
	alias -g L='| bat --pager "less -R"'
	alias -g LL='2>&1 | bat --pager "less -R"'
	alias les=$(command -vp less)
	alias less='bat --pager less'
else
	alias -g L="| less -R"
	alias -g LL="2>&1 | less"
fi

if (( ${+commands[fdfind]} )); then
	if (( ! ${+commands[fd]} )); then
		alias fd=fdfind
	fi
fi

alias gca='git commit -a'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git add .; git commit -am "betterer code"'


if (( ${+commands[snap]} )); then
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

alias df="df -h -x tmpfs -T -x squashfs -x devtmpfs"
alias rf="rm -rf"
alias psef="ps -ef | grep -i"
alias rtfm=man
alias wtf=dmesg
alias please=sudo
alias shazam="sudo su"

alias dig="dig +nocmd +noall +answer"

if (( ${+commands[docker]} ))
then
	alias dkr='docker run -it --rm -v $PWD:/mydir'
	alias dkrme='docker run -it --rm -v $PWD:/mydir --user 1000:1000'
	alias dps='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
	alias dtail="docker logs --follow --tail 100"
fi

if [[ $TERM == "alacritty" ]]
then
	alias ssh="TERM=xterm-256color ssh"
fi

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'
alias path='echo $PATH | sed "s/:/\n/g" | sort' # Quick display path

## Arch linux related alias
if (( ${+commands[pacman]} ))
then
	alias paclist="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
fi


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

function levelup() {
	case $1 in
		[1-9]* )
			local i=$1
			while [[ $i -gt 1 ]]; do
				builtin cd ..
				i=$(( $i - 1 ))
			done
			cd ..
			;;
		*)
			cd ..
			;;
	esac
}
alias ..=levelup