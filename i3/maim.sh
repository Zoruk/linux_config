#!/bin/bash

mkdir ~/gits
sudo apt-get install build-essential cmake
sudo apt-get install libimlib2-dev libxrandr-dev libxfixes-dev libicu-dev
sudo apt-get install icu-devtools libxcomposite-dev libegl1-mesa-dev
sudo apt-get install libpng12-dev libglm-dev libjpeg-dev
sudo apt-get install libglew-dev

git clone https://github.com/naelstrof/slop.git ~/gits/slop
cd ~/gits/slop
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="/usr" ../
make && sudo make install

git clone https://github.com/naelstrof/maim.git ~/gits/maim
cd ~/gits/maim
mkdir build
cd build
cmake ../
make && sudo make install
