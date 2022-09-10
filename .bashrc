# .bashrc
git_branch() {
     git branch --show 2> /dev/null
}
user="\e[1;34m\u\e[m"
folder="\[\033[0;32m\][\w]\[\033[m\]"
export PS1="$folder $user \[\e[2;91m\]\$(git_branch)\[\e[00m\] $ "

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

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export LC_MESSAGES=en_US
export HISTFILE=~/.config/bash/history
export HISTSIZE=65536
export LESSHISTFILE=~/.config/bash/lesshistory
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-erros"
export TASKRC=~/.config/task/taskrc
export TERMINAL=alacritty
