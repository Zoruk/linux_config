#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard-dkms wireguard-tools


sudo cp ${DIR}/*.conf /etc/wireguard/
sudo cp ${DIR}/redirect-trafic.sh /etc/wireguard/
