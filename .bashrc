# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='╭─ \u (\e[1;34m\W\e[0m)\n╰─ '
