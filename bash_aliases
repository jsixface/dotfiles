# profile aliases for arumugam
alias -- +='pushd .'
alias -- -='popd'
alias ..='cd ..'
alias o='less'
alias grep='grep --color'
# some more ls aliases

alias ping="ping -c 4"
alias untar="tar -xvf"
alias untarz="tar -xzvf"
alias tarc='tar -cvf'
alias tarz='tar -czvf'

# -G option for ls is for colors in mac but not in linux
if [[ `uname` = Darwin ]]
then
    alias ls="ls -G"
fi
alias l='ls -lh'
alias ll='ls -lF'
alias lart='ls -lrt | tail'
alias lt='ls -lFrt'
alias la='ls -A'

alias gca='git commit -a'

alias ubuntu-update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
