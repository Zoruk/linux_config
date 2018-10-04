#!/bin/bash

# Install and configure zsh
sudo apt-get install -y zsh git

# Todo check if allready installed
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm -f ~/.zshrc
ln -s ~/gits/linux_config/zshrc ~/.zshrc

clone_or_pull () {
	echo "$1  $2"
    if [ ! -d "$2" ]; then
		git clone $1 $2
	else
		pushd $2
		git pull
		popd
	fi
}

clone_or_pull "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

clone_or_pull https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## From here only for local desktop
if [ $SSH_TTY ]; then
	echo "SSH connection script finished"
	exit 0
fi

sudo apt-get -y install fonts-powerline fonts-hack-ttf gconf2

clone_or_pull https://github.com/ryanoasis/nerd-fonts.git ~/gits/nerd-fonts

pushd ~/gits/nerd-fonts
sudo ./install.sh -S Hack
popd

# Set font
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')/ font 'HackNerdFont 10'
# no menubar by default
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

