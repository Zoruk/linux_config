#!/bin/bash
# Basic tools
sudo apt-get install git meld

#Configure Git
git config --global user.email "loic.haas@haikou.ch"
git config --global user.name  "Loïc Haas"
git config --global diff.tool meld
