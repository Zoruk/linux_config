wget -nv https://download.opensuse.org/repositories/isv:ownCloud:desktop/$(lsb_release -si)_$(lsb_release -sr)/Release.key -O Release.key
sudo apt-key add - < Release.key
rm Release.key
sudo apt-get update
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/$(lsb_release -sr)_$(lsb_release -sr)/ /' > /etc/apt/sources.list.d/owncloud-client.list"
sudo apt-get update
sudo apt-get install owncloud-client


