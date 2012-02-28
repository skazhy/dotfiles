#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[ \W ]\$ '

# Autocompletion
complete -cf man
complete -cf sudo

function naba {
    curl -s radionaba.lv | grep "#EE1" -m4 | tail -1 | awk -F">" '{print $3}'
}
