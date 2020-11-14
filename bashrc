# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm*|*-256color) 
        color_prompt=yes
        COLOR_BLACK='\[\033[0;30m\]'
        COLOR_BLUE='\[\033[0;34m\]'
        COLOR_BROWN='\[\033[0;33m\]'
        COLOR_CYAN='\[\033[0;36m\]'
        COLOR_DARK_GRAY='\[\033[1;30m\]'
        COLOR_GREEN='\[\033[0;32m\]'
        COLOR_LIGHT_BLUE='\[\033[1;34m\]'
        COLOR_LIGHT_CYAN='\[\033[1;36m\]'
        COLOR_LIGHT_GRAY='\[\033[0;37m\]'
        COLOR_LIGHT_GREEN='\[\033[1;32m\]'
        COLOR_LIGHT_PURPLE='\[\033[1;35m\]'
        COLOR_LIGHT_RED='\[\033[1;31m\]'
        COLOR_PURPLE='\[\033[0;35m\]'
        COLOR_RED='\[\033[0;31m\]'
        COLOR_WHITE='\[\033[1;37m\]'
        COLOR_YELLOW='\[\033[1;33m\]'
        COLOR_NONE='\[\033[0m\]'
        ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1="${COLOR_BLUE}[PWD: \w]\n${COLOR_YELLOW}\D{%d/%b %H:%M:%S} ${COLOR_CYAN}\u${COLOR_WHITE}<\h>${COLOR_NONE} "
else
    PS1="[PWD: \w]\n\D{%d/%b %H:%M:%S} \u<\h> "
fi
unset color_prompt 

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Add the ~/bin directory to the PATH 
if [ -d ~/bin ]
then
    PATH=$PATH:~/bin
fi

# make vi as the default editor
export EDITOR=/usr/bin/vi

if [[ -f ~/.own_profile ]]
then
    . ~/.own_profile
fi

# If there is nvis available, use NeoVim instead of vim
which nvim &> /dev/null && export EDITOR=$(which nvim)
export VISUAL="$EDITOR"


which gocomplete > /dev/null && complete -C gocomplete go

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

zsh
