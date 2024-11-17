# .bashrc
# If not running interactively, don't do anything

case $- in
    *i*) ;;
      *) return;;
esac

if [[ ! -v VIMRUNTIME ]]; then
	set -o vi
fi

# Get promtp configuration
source ~/scripts/.bashrc.d/prompt.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
export GOPATH="$(go env GOPATH)"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH="${PATH}:${GOPATH}/bin"

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
export VDIRSYNCER_CONFIG="$XDG_CONFIG_HOME/vdirsyncer/config"
export EDITOR=nvim
