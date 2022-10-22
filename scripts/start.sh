#!/usr/bin/env bash
#xrdb -merge ~/.Xresources
#xrdb -merge ~/.cache/wal/colors.Xresources
#pywalfox update

wait_window() {
    while [ $(i3-msg -t get_tree | grep -c $1) == 0 ]
        do
	    sleep 1
    done
}

if [ -f ~/.config/.Xmodmap ]; then
    xmodmap ~/.config/.Xmodmap
else
    echo "The Xmodmap file doen't existe"
fi

which xcape >> /dev/null
if [ $? == 0 ]; then
    xcape -e "Hyper_L=Escape"
else
    echo "xcape is not installed"
fi

which wal >> /dev/null
if [ $? == 0 ]; then
    wal --theme base16-onedark
else
    echo "Wal is not installed"
fi

which pywalfox >> /dev/null
if [ $? == 0 ]; then
    pywalfox update
else
    echo "Pywalfox is not installed"
fi

which feh >> /dev/null
if [ $? == 0 ]; then
    feh --bg-fill ~/images/wallpaper
else
    echo "Feh is not installed"
fi

isMounted=$(mount | grep /dev/sda1 -c)
if [ "$isMounted" == 0 ]; then
    sudo mount /dev/sda1 ~/Dados
else 
    echo "/dev/sda1 is already mounted"
fi

isSyncRun=$(tmux list-session | grep -c sync)
if [ "$isSyncRun" == 0 ]; then
    which tmux >> /dev/null
    if [ -f ~/scripts/tmux.sh ] && [ $? == 0 ]; then
        bash ~/scripts/tmux.sh
    else
        echo "Either the script is not present or tmux is not installed"
    fi
fi

program=picom
pgrep -n $program >> /dev/null
if [ $? == 1 ]; then
    which $program >> /dev/null
    if [ $? == 0 ]; then
        $program &
    fi
fi

program=unclutter
pgrep -n $program >> /dev/null
if [ $? == 1 ]; then
    which $program >> /dev/null
    if [ $? == 0 ]; then
        $program &
    fi
fi

exit
