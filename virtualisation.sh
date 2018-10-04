#!/bin/bash


# Install qemu
sudo apt-get install qemu qemu-kvm

# Virtualbox
sudo apt-get install virtualbox virtualbox-ext-pack
sudo usermod -a -G vboxusers $USER

# Vagrant
sudo apt-get install Vagrant

# Docker
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update

sudo apt-get -y install docker-ce