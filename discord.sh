#!/bin/bash

wget -O /tmp/discord.deb https://discordapp.com/api/download/stable?platform=linux
sudo dpkg -i /tmp/discord.deb
rm /tmp/discord.deb
sudo apt-get -f install
