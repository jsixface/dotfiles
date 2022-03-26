[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -d ~/go/bin ]] && export PATH=$PATH:~/go/bin
[[ -d ~/bin ]] && export PATH=$PATH:~/bin


alias ..='cd ..'

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ll='ls -l'      #long list
alias lart='ls -1Fcart'

if [[ `uname` = Darwin ]]; then
	alias ls="ls -G" # -G option for ls is for colors in mac but not in linux
fi

alias df="df -h -x tmpfs -T -x squashfs -x devtmpfs"
alias dig="dig +nocmd +noall +answer"
alias grep='grep --color'
alias path='echo $PATH | sed "s/:/\n/g" | sort' # Quick display path
alias ping="ping -c 4"
alias please=sudo
alias psef="ps -ef | grep -i"
alias rf="rm -rf"
alias rtfm=man
alias shazam="sudo su"
alias tarc='tar -cvf'
alias tarz='tar -czvf'
alias untar="tar -xvf"
alias untarz="tar -xzvf"

# git yeah
alias gca='git commit -a'
alias gst='git status -bs'
alias glo='git log --oneline --decorate -10'
alias yolo='git add .; git commit -am "betterer code"'


alias ubuntu-update="sudo apt update && \
        apt list --upgradable && \
        sudo apt dist-upgrade -y && \
        sudo apt autoremove -y"

if command -v docker &> /dev/null; then
    alias dkr='docker run -it --rm -v $PWD:/mydir'
	alias dkrme='myid="$(id -u):$(id -g)"; docker run --rm -it -v $PWD:/mydir -v /etc/passwd:/etc/passwd -w /mydir --user $myid'
    alias dps='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
	alias dtail="docker logs --follow --tail 100"
fi


########## Functions next ##########

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

########## Further customizations ##########

if command -v java &> /dev/null; then
	export JAVA_HOME=$(java -XshowSettings:properties 2>&1 |grep java.home|awk '{print $3}')
fi

export EDITOR=$(command -vp nvim 2> /dev/null || command -v vi 2> /dev/null) 
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

