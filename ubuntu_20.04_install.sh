#!/bin/bash
echo "set lh not need input password"
echo 'lh ALL=NOPASSWD: ALL' | sudo tee --append /etc/sudoers

echo "更新系统 start"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dis-upgrade
sudo apt-get -y autoremove
echo "更新系统 end"

echo "install 安装文泉驿微黑字体库"
sudo apt install -y ttf-wqy-microhei 
echo "install git"
sudo apt-get install -y git 
git config --global user.email "jyfc7879@gmail.com"
git config --global user.name "lh"
echo "更新系统 end"

echo "install curl"
sudo apt-get install -y curl
echo "installed curl"

echo "install chrome-gnome-shell"
sudo apt-get install -y chrome-gnome-shell 
sudo apt install -y gnome-shell-extension-dashtodock
echo "installed chrome-gnome-shell"

echo "install tree"
sudo apt install -y tree
echo "installed tree"

echo "install googlepinyin"
sudo apt install fcitx-bin -y
sudo apt install fcitx-googlepinyin -y
echo "installed googlepinyin"

echo "install albert"
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install albert
echo "installed albert"
