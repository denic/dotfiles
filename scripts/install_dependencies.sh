#!/bin/bash

sudo add-apt-repository ppa:mmstick76/alacritty

# Base setup
sudo apt-get install build-essential arandr cmake dzen2 \
    git meld nmap redshift suckless-tools \
    tig tmux xfonts-terminus fonts-powerline pwgen nitrogen \
    help2man xclip autorandr sxiv \
    flameshot imagemagick \
    i3 i3blocks kitty scrot compton dunst rofi

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
