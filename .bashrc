# .bashrc
# If not running interactively, don't do anything

case $- in
    *i*) ;;
      *) return;;
esac

set -o vi

git_branch() {
     branch=$(git branch --show 2> /dev/null)
     if [ "$branch" != "" ];
     then
	     echo " $branch "
     fi
}

new_git_branch() {
     branch=$(git branch --show 2> /dev/null)
     if [ "$branch" != "" ];
     then
	     echo -e "\[\e[2;91m\] $branch \[\e[m\]"
     fi

}
compensate=20 # compensates for colors and special prompt commands
user="\e[1;34m\u\e[m\]"
folder="\[\e[1;32m\][\w]\[\e[m\]"
psprompt="\[\e[1;34m\]\[\e[m\]"

prompt() {
	PS1=$(printf "%*s\r%s\n$psprompt " "$(($(tput cols)+${compensate}))" "$(new_git_branch)" "$folder")
}
PROMPT_COMMAND=prompt

PROMPT_DIRTRIM=2 # file depth on ps1

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/scripts/.bashrc.d ]; then
	for rc in ~/scripts/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export HISTFILE=~/.config/bash/history
export HISTSIZE=65536

shopt -s histappend # append to history
shopt -s autocd

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export LC_MESSAGES=en_US
export LESSHISTFILE=~/.config/bash/lesshistory
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-erros"
export TASKRC=~/.config/task/taskrc
export TERMINAL=alacritty
