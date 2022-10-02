#!/bin/bash

git_branch() {
     branch=$(git branch --show 2> /dev/null)
     [ "$branch" != "" ] && echo -e "\[\e[2;91m\] $branch \[\e[m\]"
}

ssh_session() {
	[ "$SSH_TTY" != "" ] && echo -e "\[\e[1;34m\u@$(hostname)\e[m\]"
}

python_venv() {
	[ "$VIRTUAL_ENV_PROMPT" != "" ] && echo -e "\[\e[1;34m\]$VIRTUAL_ENV_PROMPT\[\e[m\]"
}

compensate=20 # compensates for colors and special prompt commands
folder="\[\e[1;32m\][\w]\[\e[m\]"
psprompt="\[\e[40;1;34m\] \[\e[m\]"

prompt() {
	PS1=$(printf "%*s\r%s\n$(python_venv)$psprompt " "$(($(tput cols)+${compensate}))" "$(git_branch)" "$folder $(ssh_session)")
}

PROMPT_COMMAND=prompt
PROMPT_DIRTRIM=2 # file depth on ps1
