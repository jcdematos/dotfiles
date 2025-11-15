if [ "$(uname -n)" == "fedora" ]
then
	#sudo rm /etc/dnf/protected.d/plasma.desktop
	#sudo dnf remove @kde-desktop
	#sudo dnf autoremove kamoso kf5-kactivities dragon kasumi elisa-player kolourpaint konversation ark kmines kruler  kpat krdc krfb kmahjongg kcolorchooser kf5-kwallet yelp antiword thai-* nano mariadb gnome-*

	echo "Enable rpmfusion free"
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
	echo "Enable rpmfusion nonfree"
	sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

	echo "Install packages"
	sudo dnf install git hyprland hyprutils mako nvim syncthing waybar thunderbird discord -y

	echo "Copying git files"
	rm -rf ~/.git
	cp -r .git ~/.git
	cp -r .gitignore ~

	echo "Copying bash files"
	cp -r .bash* ~
	cp -r scripts ~
	
	echo "LICENSE and README"
	cp LICENSE ~
	cp README.md ~

	echo "Copying config files"
	cp -r .config ~

	echo "Bin files"
	cp -r bin ~/bin
fi


