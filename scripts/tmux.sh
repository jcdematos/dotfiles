session="sync"
tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'syncthing'
tmux send-keys -t $session:$window 'syncthing' C-m
