#!/bin/bash


sudo apt-get install vim vim-gnome vim-scripts
sudo apt-get install build-essential libclang-3.9-dev libncurses-dev libz-dev cmake xz-utils libpthread-workqueue-dev
sudo apt-get install liblua5.2-dev lua5.2
########################################
### Vim Plugins
########################################
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -fs $PWD/vimrc ~/.vimrc

# Some plugin need python (YCM need to be compiled)
sudo apt-get install python-dev python3-dev

mkdir -p ~/.vim
ln -fs $PWD/colors ~/.vim/colors
ln -fs $PWD/UltiSnips ~/.vim/UltiSnips

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

pushd ~/.vim/bundle/color_coded
rm -f CMakeCache.txt
mkdir -p build && cd build
cmake ..
make && make install # Compiling with GCC is preferred, ironically
# Clang works on OS X, but has mixed success on Linux and the BSDs

# Cleanup afterward; frees several hundred megabytes
make clean && make clean_clang
popd

