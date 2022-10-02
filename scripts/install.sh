# Script used to configure my systems after initial installations 
# the machines I use at the moment are either fedora or ubuntu

##TODO  Ubuntu install for my other machine
if [ "$(uname -n)" == "fedora" ]
then
	# Remove if installed fedora from KDE flavour
	sudo rm /etc/dnf/protected.d/plasma.desktop
	sudo dnf remove @kde-desktop
	sudo dnf autoremove kamoso kf5-kactivities dragon kasumi elisa-player kolourpaint konversation ark kmines kruler  kpat krdc krfb kmahjongg kcolorchooser kf5-kwallet yelp antiword thai-* nano mariadb gnome-*
	echo "Enable rpmfusion free"
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

	echo "Enable copr zeno/scrcpy"
	sudo dnf copr enable zeno/scrcpy -y
	echo "Enable copr fuhrmann/i3-gaps"
	sudo dnf copr enable fuhrmann/i3-gaps -y

	echo "Install packages"
	sudo dnf install i3-gaps i3blocks git neovim mpv emacs zathura alacritty python3  python3-pip  task picom newsboat firefox krita jq dmenu tmux feh syncthing fontawesome5-fonts adb scrcpy ripgrep khal fd-find nodejs hugo ShellCheck -y
fi

if [ ! -f "$HOME/.emacs.d/bin/doom" ]
then
	git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
	~/.emacs.d/bin/doom install
else
	~/.emacs.d/bin/doom sync
fi

