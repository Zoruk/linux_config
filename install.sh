#!/bin/bash

##############################
### Build libs
##############################
sudo apt-get install build-essential autoconf libtool gcc g++ make cmake git-core wget p7zip-full libncurses5-dev zlib1g-dev libbz2-dev
sudo apt-get install openssl libssl-dev mariadb-client libmysqlclient-dev libmysql++-dev libreadline6-dev
sudo apt-get install libboost-dev libboost-thread-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-iostreams-dev
sudo apt-get install liblua5.1-0-dev

sudo apt-get install qtcreator qtcreator-plugin-ubuntu