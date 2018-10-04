#!/bin/bash

# Update
sudo apt-get update
sudo apt-get dist-upgrade

# Basic Stuff
sudo apt-get install vim git htop curl
sudo apt-get install owncloud-client
sudo apt-get install chromium-browser pepperflashplugin-nonfree
sudo apt-get install unity-tweak-tool
sudo apt-get install network-manager-openvpn network-manager-openvpn-gnome

# disable dns caching (dirty fix for vpn dns)
#sudo sed -i 's/dns=dnsmasq/dns=/g' /etc/NetworkManager/NetworkManager.conf

#################
### Dev Stuff ###
#################
# Install JDK
sudo apt-get install openjdk-8-jre

# Install some build tools
sudo apt-get install elfutils ccache libcunit1-ncurses-dev libghc-ncurses-dev gawk gdb gcc cmake

###
### MEDIA
###
sudo apt-get install vlc

