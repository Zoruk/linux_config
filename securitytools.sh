#!/bin/bash

###
### Security stuff
###
sudo mkdir /opt/gdbinit  
sudo chown $(whoami) /opt/gdbinit
git clone git@github.com:gdbinit/Gdbinit.git /opt/gdbinit

## Peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit



