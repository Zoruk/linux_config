#!/bin/bash
sudo apt-get -y install erlang
sudo mkdir /opt/rebar
sudo chown $(whoami):$(whoami) /opt/rebar
git clone git://github.com/rebar/rebar.git /opt/rebar
cd /opt/rebar
./bootstrap
sudo ln -s /opt/rebar/rebar /usr/bin/rebar

