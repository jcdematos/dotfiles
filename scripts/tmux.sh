session="sync"
tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'syncthing'
tmux send-keys -t $session:$window 'syncthing' C-m

window="pypewiring"
tmux new-window -n $window
tmux rename-window -t $session:$window 'pypewiring'
tmux send-keys -t $session:$window 'cd /home/jmatos/github/pypewiring' C-m
tmux send-keys -t $session:$window 'source venv/bin/activate' C-m
tmux send-keys -t $session:$window 'python3 main.py' C-m

window="lan-mouse"
tmux new-window -n $window
tmux rename-window -t $session:$window 'lan-mouse'
tmux send-keys -t $session:$window 'lan-mouse daemon' C-m
