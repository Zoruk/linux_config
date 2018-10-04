#!/bin/bash

#"cgroup_enable=memory swapaccount=1"
source /etc/default/grub
echo "$GRUB_DISTRIBUTOR $GRUB_CMDLINE_LINUX"


if ! [[ $GRUB_CMDLINE_LINUX = *"cgroup_enable=memory swapaccount=1"* ]];
then
	echo "Seting up grub for docker limits"
	sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1 /g' /etc/default/grub
	sudo update-grub
fi

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
if ! grep -q 'download.docker.com' /etc/apt/sources.list; then
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
fi
sudo apt update
sudo apt install docker-ce

