#!/bin/bash

# Base setup
sudo apt-get install build-essential arandr cmake dunst dzen2 exfat-utils \
    git herbstluftwm  meld nmap redshift rxvt-unicode-256color suckless-tools rofi \
    tig tmux xfonts-terminus fonts-powerline profanity pwgen nitrogen \
    python-pygments \
    help2man xclip autorandr sxiv

# Install neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install neovim
pip install neovim

# Install elixir/erlang
pushd /tmp
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb 
sudo apt-get update
sudo apt-get install esl-erlang 
sudo apt-get install elixir
popd

# Install nodejs

pushd /tmp
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs

sudo npm i -g eslint eslint-plugin-vue
popd

# Fetch misc scripts and stuff
mkdir -p ~/src/misc/
pushd ~/src/misc/

git clone git@github.com:bjhaid/elixir_auto_complete.git
git clone git@github.com:magicmonty/bash-git-prompt.git git-prompt
git clone https://github.com/graysky2/pulseaudio-ctl.git
git clone git@github.com:haikarainen/light.git

popd

pushd ~/src/misc/light
make
sudo make install
popd
