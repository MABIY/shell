#!/bin/bash

#更新系统
echo "更新系统 start"
echo ji | sudo -S apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

echo "set lh not need input passwd"
echo 'lh ALL=NOPASSWD: ALL' | sudo  tee --append /etc/sudoers

echo "install git"
sudo apt-get install -y git || "---------------install git fail "
echo "更新系统 end"

echo "install curl"
sudo apt-get install -y curl
echo "installed curl"

echo "install chrome-gnome-shell"
sudo apt-get install chrome-gnome-shell

echo "gnome-tweak-tool"
sudo apt install -y gnome-tweak-tool

echo "tree"
sudo apt install -y tree

echo "shadowsocks"
sudo apt install -y shadowsocks

echo "install albert"
sudo apt install -y sshpass
sudo apt install -y wget
#wget -nv -O Release.key https://build.opensuse.org/projects/home:manuelschneid3r/public_key 
#sudo apt-key add - < Release.key
#sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
#sudo apt-get update
#sudo apt-get install albert -y
#
#echo "安装ssd"
#sudo apt-get install -y ssh

# LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure
sudo apt-get install -y lsb-core || echo "--------------lsb-core install error"

# install okular PDF
sudo apt-get install -y okular

# install zsh
echo "安装 zsh start"
sudo apt-get install -y zsh || echo "------------zsh install erro"

echo "install oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo "---------------"
echo "设置默认shell"
echo ji | chsh -s `which zsh`
echo "oh my zsh安装结束"

sudo apt-get install -y vim || echo "vim install error"

echo "compizconfig"
sudo apt install -y compizconfig-settings-manager
sudo apt install -y compiz-plugins-extra

echo "安装google-chrome"
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install -y google-chrome-stable
echo "安装 图片编辑软件"
sudo apt install gimp -y

echo "install htop"
sudo apt install -y htop
echo "install htop finish"

echo "install rar"
sudo apt install -y rar
echo "install rar finish"

echo "install redis tools"
sudo apt-get install redis-tools -y

echo "install privoxy"
sudo apt install -y privoxy

echo "gpick 取色器安装"
sudo apt-get install gpick

echo "smplayer是基于mplayer的一个图形化前端 ]加速 [减速"
sudo apt install -y mplayer
sudo apt install -y smplayer

sudo apt install -y mysql-server-5.7 

sudo apt install -y shadowsocks

sudo wget -nv -O Release.key \
>   https://build.opensuse.org/projects/home:manuelschneid3r/public_key

sudo apt-key add - < Release.key

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install albert -y

sudo apt-get install chrome-gnome-shell -y

echo "install grive2"
sudo apt-get install git cmake build-essential libgcrypt11-dev libyajl-dev \
    libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev \
    debhelper zlib1g-dev dpkg-dev pkg-config
git -C ~/ clone https://github.com/vitalif/grive2.git
cd grive2 
mkdir build
cd build
cmake ..
make -j4
sudo make install
rm -rf ~/grive2
echo "success install grive2"

echo "sublime text3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
#安装终端 terminator
sudo apt-get install terminator -y
#docker pull ilanyu/golang-reverseproxy

sudo apt install -y retext -y

