#!/bin/bash
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y" 
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - 
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list 
sudo apt-get update 
sudo apt-get install skypeforlinux
