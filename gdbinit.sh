#!/bin/bash

sudo mkdir /opt/gdbinit  
sudo chown $(whoami) /opt/gdbinit
git clone git@github.com:gdbinit/Gdbinit.git /opt/gdbinit
