#!/bin/bash
# Program:
#       This program  install tools on ubuntu 20.04
# History:
# 2020/04/27	skylark	First release
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH

if [[ -z "$1" || -z "$2" ]]; then
        echo "first parameter user name , second parameter user password";
        exit 2;
fi

user=$1
password=$2
echo "get user:$user password:$password"

echo "set $user not need input password"
{ echo "$password"; echo "$user ALL=NOPASSWD: ALL"; } | sudo -k  -S tee --append /etc/sudoers

echo "更新系统 start"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dis-upgrade
sudo apt-get -y autoremove
echo "更新系统 end"

echo "install LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure"
sudo apt-get install -y lsb-core || echo "--------------lsb-core install error"
echo "installed LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure"


echo "install 安装文泉驿微黑字体库"
sudo apt install -y ttf-wqy-microhei 
echo "install git"
sudo apt-get install -y git 
git config --global user.email "jyfc7879@gmail.com"
git config --global user.name "$user"
echo "更新系统 end"

echo "install curl"
sudo apt-get install -y curl
sudo apt install -y wget
echo "installed curl"

echo "install chrome-gnome-shell"
sudo apt-get install -y chrome-gnome-shell 
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
sudo apt-get install albert -y
echo "installed albert"

echo "install tools"
sudo apt install -y htop
sudo apt install -y rar
sudo apt-get install -y ssh
sudo apt install -y sshpass
sudo apt-get install -y okular

sudo apt-get install -y zsh || echo "------------zsh install erro"
echo "install oh my zsh"
echo $password | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "input custom alias export"
sudo sh -c "cat >> /home/$user/.zshrc <<EOF
alias datef=\"date '+%Y%m%d'\"
alias gdate=\"date +'%Y%m%d' | clipcopy\"
alias gpu=\"grive -p /home/$user/grive/\"
alias pu=\"git add -A && git commit -m  \"..\" && git push\"
alias rb=\"echo $password | sudo sync;sudo sync;sudo sync;sudo -S reboot\"
alias sd=\"gpu && sudo sync&&sudo sync&& sudo sync&&sudo -S shutdown -h 0\"
alias leanjava=\"idea ~/project/learn_java\"
alias killmw=\"killall -9 mysql-workbench-bin\"
alias noproxy=\"unset http_proxy && unset https_proxy\"
alias killwx=\"killall -9 electronic-wechat\"
#export https_proxy='https://0.0.0.0:7118'
export http_proxy='http://0.0.0.0:12333'
export https_proxy=socks5://127.0.0.1:1080
EOF"

sudo apt-get install -y vim || echo "vim install error"
echo "install vim-gtk of share clipboard"
sudo apt install -y vim-gtk 
echo "set clipboard=unnamedplus">~/.vimrc
echo "set clipboard=unnamedplus">~/.ideavimrc

sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get -y update
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install -y google-chrome-stable

echo "安装 图片编辑软件"
sudo apt install gimp -y

sudo apt-get install redis-tools -y

echo "work break reminder software"
sudo apt install -y workrave

echo "gpick 取色器安装"
sudo apt-get install gpick -y 

echo "smplayer是基于mplayer的一个图形化前端 ]加速 [减速"
sudo apt install -y mplayer
sudo apt install -y smplayer

sudo apt install -y mysql-server

echo "install grive2"
sudo apt-get install git cmake build-essential libgcrypt20-dev libyajl-dev \
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
cd ~/
echo "installed grive2"

#安装终端 terminator
sudo apt-get install tmux -y

#将字符串在终端生成一个logo的终端工具
sudo apt install -y figlet

#下载工具
sudo apt install uget -y
sudo apt install aria2 -y

# 比对工具
sudo apt install -y meld

#windows远程链接功能
sudo apt install xrdp -y
line=`sudo cat /etc/xrdp/startwm.sh |wc -l`
linel2=`expr $line - 1`
sudo sed -i "$linel2","$line"s/^/#/ /etc/xrdp/startwm.sh
sudo sh -c  'echo "gnome-session" >> /etc/xrdp/startwm.sh'

#桌面环境配置
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" # disable Alt+F1


# install git tools ctrl+shift+p
# sudo add-apt-repository ppa:peek-developers/stable -y
# sudo apt install -y peek

# 快速关闭程序工具
sudo apt install -y plank

# kchmviewer
sudo apt-get install kchmviewer -y

#oh my zsh copydir 
sudo apt install -y xclip

# install screenshot ->command  'flameshot gui'
sudo apt-get install flameshot -y

# (https://github.com/freeman-lab/embed-images)
# npm install embed-images -g 
# embed-images example.md > new.md

# improve tools start speed
sudo apt-get install preload -y

# Kdenlive is an acronym for KDE Non-Linear Video Editork 
sudo apt install -y kdenlive

# kazam vedio Record tool 
sudo apt install -y kazam

echo "ssr dependence install"
sudo apt install -y  libcanberra-gtk-module libcanberra-gtk3-module gconf2 gconf-service libappindicator1 
#可选依赖：
sudo apt-get -y install libssl-dev
#如果软件报错，请安装可选依赖
sudo apt-get  -y install libsodium-dev 
echo "ssr dependence installed"

echo "installed tools"


##### install from use device####
# cp -rf /home/$user/tmp/developer_environment/java ~/
# cp -rf ~/java/other/gnome_extensions/* ~/.local/share/gnome-shell/extensions/
# mkdir -p ~/.local/share/gnome-shell/extensions/
# tar -zxvf ~/java/jdk/jdk-8u151-linux-x64.tar.gz -C ~/java/jdk/
# tar -zxvf ~/java/jdk/jdk-7u80-linux-x64.tar.gz -C ~/java/jdk/
# tar -zxvf ~/java/web_server/apache-tomcat-7.0.88.tar.gz -C ~/java/web_server/
# tar -zxvf ~/java/web_server/apache-tomcat-8.5.28.tar.gz -C ~/java/web_server/
# tar -zxvf ~/java/idea/ideaIU.tar.gz -C ~/java/idea/
# tar -zxvf ~/java/git/smartgit-linux-18_2_5.tar.gz -C ~/java/git/
# echo "-javaagent:/home/$user/java/idea/jetbrains.jar">> ~/java/idea/idea-IU-183.5912.21/bin/idea64.vmoptions
# unzip ~/java/build_tools/gradle-5.1.1-all.zip -d ~/java/build_tools/
# unzip ~/java/build_tools/apache-maven-3.6.0-bin.zip -d ~/java/build_tools/
# sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk/jdk1.7.0_80/bin/javac 300
# sudo update-alternatives --install /usr/bin/mvn mvn ~/java/build_tools/apache-maven-3.6.0/bin/mvn 300
# sudo update-alternatives --install /usr/bin/gradle gradle  ~/java/build_tools/gradle-5.1.1/bin/gradle 300
# cp ~/tmp/.netrc ~/
# sudo dpkg -i ~/java/other/atom-amd64.deb
# sudo dpkg -i ~/java/other/sogoupinyin_2.2.0.0108_amd64.deb
# sudo dpkg -i ~/java/other/electron-ssr-0.2.6.deb
# sudo apt install -y -f



# sudo apt install -y compizconfig-settings-manager
# sudo apt install -y compiz-plugins-extra

# echo "install 便签"
# sudo add-apt-repository ppa:umang/indicator-stickynotes -y
# sudo apt-get update && sudo apt-get install -y indicator-stickynotes

