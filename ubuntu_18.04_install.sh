#!/bin/bash

#更新系统
echo "更新系统 start"
echo ji | sudo -S apt-get -y update
echo ji | sudo -S apt-get -y upgrade
echo ji | sudo -S apt-get -y dist-upgrade
echo ji | sudo -S apt-get autoremove -y

echo "set lh not need input passwd"
echo 'lh ALL=NOPASSWD: ALL' | sudo  tee --append /etc/sudoers

echo "install git"
sudo apt-get install -y git || "---------------install git fail "
echo "更新系统 end"

echo "install curl"
sudo apt-get install -y curl
echo "installed curl"

echo "install chrome-gnome-shell"
sudo apt-get install -y chrome-gnome-shell 

echo "gnome-tweak-tool"
sudo apt install -y gnome-tweak-tool

echo "tree"
sudo apt install -y tree

echo "shadowsocks"
sudo apt install -y shadowsocks

echo "install albert"
sudo apt install -y sshpass
sudo apt install -y wget
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.10/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update -y
sudo apt-get install albert
#
#echo "安装ssd"
sudo apt-get install -y ssh

# LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure
sudo apt-get install -y lsb-core || echo "--------------lsb-core install error"

# install okular PDF
sudo apt-get install -y okular

# install zsh
echo "安装 zsh start"
sudo apt-get install -y zsh || echo "------------zsh install erro"

echo "install oh my zsh"
echo ji | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt-get install -y vim || echo "vim install error"
echo "install vim-gtk of share clipboard"
sudo apt install -y vim-gtk 

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
sudo apt-get install gpick -y 

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
    debhelper zlib1g-dev dpkg-dev pkg-config -y
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
sudo apt-get install sublime-text -y
#安装终端 terminator
sudo apt-get install tmux -y
#docker pull ilanyu/golang-reverseproxy

#终端下查询系统配置信息。
sudo apt install neofetch -y

sudo apt install -y retext -y
#将字符串在终端生成一个logo的终端工具
sudo apt install -y figlet

#下载工具
sudo apt install uget -y
sudo apt install aria2 -y

# 比对工具
sudo apt install -y meld

#windows远程链接功能
sudo apt install xrdp -y

#桌面环境配置
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" # disable Alt+F1

# install git tools ctrl+shift+p
sudo add-apt-repository ppa:peek-developers/stable -y
sudo apt install -y peek
# 快速关闭程序工具
sudo apt install -y plank
# kchmviewer
sudo apt-get install kchmviewer -y
#oh my zsh copydir 
sudo apt install -y xclip
#back picture 
sudo apt-get install variety -y
# npm install embed-images -g (https://github.com/freeman-lab/embed-images)
# embed-images example.md > new.md
# improve tools start speed
sudo apt-get install preload -y
# markdown editor
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE -y
sudo add-apt-repository 'deb https://typora.io/linux ./' -y
sudo apt-get install typora -y



