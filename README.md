# dotfiles
## Details
### General
- [i3-gaps](https://github.com/Airblader/i3) - Extensible tiling window manager for X11.
- [i3blocks](https://github.com/vivien/i3blocks) - A feed generator for text based status bars meant to be displayed by i3. 
- [picom](https://github.com/yshui/picom) - Compositor for X11 forked from Compton.
- [dmenu](https://github.com/operadicmaniac/dmenu) - Launcher and dynamic menu for X11.
### Editors
- [Neovim](https://github.com/neovim/neovim) -  Vim-fork focused on extensibility and usability.
- [Emacs](https://www.gnu.org/software/emacs/) - An extensible, customizable, free/libre text editor — and more.
	- [Doom](https://github.com/doomemacs/doomemacs) - Emacs configuration framework focusing on Vim-like features.
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer.
### Productivity
- [task](https://github.com/GothenburgBitFactory/taskwarrior) - Taskwarrior - Command line Task Management.
- [khal](https://github.com/pimutils/khal) - CLI and terminal calendar with CalDAV support.
- [vdirsyncer](https://github.com/pimutils/vdirsyncer) - Command-line tool for synchronizing calendars and addressbooks.
- [newsboat](https://github.com/newsboat/newsboat) -  An RSS/Atom feed reader for text terminals.
- [syncthing](https://github.com/syncthing/syncthing) - Synchronize files between two ormore computers locally. 
## Packages 
### dnf packages
For fedora:
```sh
sudo dnf install i3-gaps i3blocks git neovim mpv emacs zathura alacritty python3 python3-pip task \
picom newsboat firefox jq dmenu tmux feh syncthing fontawesome-fonts-all ripgrep \
khal fd-find gcc make pkgconfig libX11-devel libXtst-devel libXi-devel xdotool golang \
unclutter-xfixes flameshot jupyterlab -y
thefuck tldr
```

### others
Instal xcape:
```sh
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
```

<!---For ubuntu:
```sh
sudo dnf install i3-gaps i3blocks git neovim mpv emacs zathura alacritty python3 python3-pip task \
picom ewsboat firefox krita jq dmenu tmux feh syncthing fontawesome5-fonts adb scrcpy ripgrep \
khal fd-find -y
```--->
