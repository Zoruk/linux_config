#!/bin/bash
rm ~/.config/i3status/config ~/.config/i3/config
mkdir -p ~/.config/i3status ~/.config/i3
ln -s ~/gits/linux_config/i3status/config ~/.config/i3status/config
ln -s ~/gits/linux_config/i3/config ~/.config/i3/config

git clone https://github.com/haikarainen/light.git ~/gits/light

cd ~/gits/light

sudo apt-get install help2man make autoconf fonts-font-awesome xss-lock
./autogen.sh
make
sudo make install

sudo -H python3 -m pip install --upgrade pip
sudo apt install gobject-introspection
git clone git@github.com:acrisci/playerctl.git ~/gits/playerctl
cd ~/gits/playerctl
./autogen.sh
make
sudo make install
sudo ldconfig
