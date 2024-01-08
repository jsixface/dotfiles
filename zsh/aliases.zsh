## LS aliases
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias lr='ls -lrt'

alias t=tree
alias tl='tree -L 2'
alias tl2='tree -L 3'

alias ping="ping -c 4"
alias untar="tar -xvf"
alias untarz="tar -xzvf"
alias tarc='tar -cvf'
alias tarz='tar -czvf'

nul=/dev/null

alias -g G='| grep -i'
alias vii='vim -R'

# Prefer neovim > vim > vi
if whence nvim &> $nul || whence neovim &> $nul; then
	alias vi=nvim
	alias vim=nvim
elif whence vim &> $nul; then
	alias vi=vim
fi

if [[ `uname` = Darwin ]]; then
	alias ls="ls -G" # -G option for ls is for colors in mac but not in linux
fi

if whence dust &>$nul; then
	alias dush='dust --no-percent-bars --depth 0'
else
	alias dush="du -sh"
fi

if whence batcat &>$nul ; then
	alias bat=batcat
fi
if whence bat &>$nul; then
	lesscmd=$(whence -p less)
	export BAT_STYLE=grid,header,snip
	export BAT_THEME=gruvbox-dark
	export BAT_PAGER="$lesscmd -R"
	alias -g L='| bat'
	alias -g LL='2>&1 | bat'
	alias les=$lesscmd
	alias less='bat --paging=always'
	alias cat='bat --paging=never'
else
	alias -g L="| less -R"
	alias -g LL="2>&1 | less"
fi

if whence fdfind &> $nul; then
	alias fd=fdfind
fi

if whence docker &>$nul; then
	alias dkr='docker run -it --rm'
	alias dkrme='myid="$(id -u):$(id -g)"; docker run --rm -it -v /etc/passwd:/etc/passwd --user $myid'
	alias dps='docker ps --format="table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}"'
	alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}"'
	alias dtail="docker logs --follow --tail 100"
fi

alias gca='git commit -a'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git add .; git commit -am "betterer code"'


update-sw () {
	if [[ `uname` = "Darwin" ]]; then
		brew update && brew upgrade && brew cleanup --prune=all
	elif whence apt &>$nul ; then
		sudo apt update && apt list --upgradable && sudo apt dist-upgrade -y && sudo apt autoremove -y
		if whence snap &>$nul; then
			sudo snap refresh
		fi
	elif whence zypper &>$nul ; then
		sudo zypper dist-upgrade
		for i in $(zypper packages --unneeded | grep '|' | awk -F'|' '{print $3}' | grep -v Name)
		do
			echo sudo zypper remove --clean-deps -y $i
			sudo zypper remove --clean-deps -y $i
		done
	fi
}

alias df="df -h -x tmpfs -T -x squashfs -x devtmpfs -x overlay"

if command -v dust &> $nul; then
	alias dush='dust --no-percent-bars --depth 0'
else
	alias dush="du -sh"
fi

if command -v fnm &> $nul; then
	alias nvm=fnm
fi

alias rf="rm -rf"
alias psef="ps -ef |grep -v grep | grep -i"
alias rtfm=man
alias wtf=dmesg
alias please=sudo
alias shazam="sudo su"

alias dig="dig +nocmd +noall +answer"

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'
alias path='echo $PATH | sed "s/:/\n/g"' # Quick display path


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