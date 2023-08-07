#!/bin/bash
# Program:
#       This program  install tools on ubuntu 22.04
# History:
# 2023/07/29    skylark  change release
# 说明
# 运行方式: ./ubuntu_22.04_init_install_update.sh <userName> <password>
# <userName> 当前账户 <password> 当前账户对应的密码
# 脚本最下面注释了需要代理和本地存储设备的脚本,如需使用 移除注释
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

echo "ubuntu 22.04 update start"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dis-upgrade
sudo apt-get -y autoremove
echo "ubuntu 22.04 update end"

echo "electron-ssr icon show start"
sudo apt-get install libappindicator-dev
echo "electron-ssr icon show end"

echo "temp depend install start"
sudo apt install -y  libcanberra-gtk-module libcanberra-gtk3-module gconf2 gconf-service libappindicator1
sudo apt-get -y install libssl-dev
sudo apt-get  -y install libsodium-dev
echo "temp depend install end"

echo "install LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure"
sudo apt-get install -y lsb-core
echo "installed LSB is keep distribution to keep the organizational structure of the Linux Foundation to standardize the software system structure"

echo "install font"
sudo apt install -y ttf-wqy-microhei
echo "install font"

echo "install git start"
sudo apt-get install -y git
git config --global user.email "jyfc7879@gmail.com"
git config --global user.name "$user"
echo "install git end"

echo "install curl and wget install"
sudo apt install -y curl
sudo apt install -y wget
echo "install curl and wget end"

echo "install chrome-gnome-shell"
sudo apt-get install -y chrome-gnome-shell
echo "installed chrome-gnome-shell"


echo "install albert"
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update -y
sudo apt install albert -y
echo "installed albert"


echo "install tools start"
sudo apt install -y tree
sudo apt install -y htop
sudo apt install -y rar
sudo apt-get install -y ssh
sudo apt install -y sshpass
sudo apt-get install -y okular
sudo apt install -y wmctrl
sudo apt install -y gnome-tweak-tool
sudo apt-get install -y apt-transport-https
sudo apt install -y compizconfig-settings-manager
sudo apt install -y compiz-plugins-extra
echo "install tools end"


echo "install oh my zsh end"

sudo apt-get install -y vim || echo "vim install error"
echo "install vim-gtk of share clipboard"
sudo apt install -y vim-gtk
echo "set clipboard=unnamedplus">~/.vimrc
echo "set clipboard=unnamedplus">~/.ideavimrc

echo "install picture edit gimp start"
sudo apt install gimp -y
echo "install picture edit gimp end"

echo "install work break reminder software start"
sudo apt install -y workrave
echo "install work break reminder software end"


echo "install smplayer start"
sudo apt install -y mplayer 
sudo apt install -y smplayer # ]加速 [减速
echo "install smplayer end"

sudo apt install -y figlet #将字符串在终端生成一个logo的终端工具

#下载工具
sudo apt install uget -y
sudo apt install aria2 -y

#桌面环境配置
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" # disable Alt+F1
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal  "['<Alt>t']" # change alt+ctrl+t -> alt+t
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]" # disable window  menu

#anki install
sudo apt install -y anki

# kchmviewer
sudo apt-get install kchmviewer -y

#install screenshot ->command  'flameshot gui'
sudo apt-get install flameshot -y

# improve tools start speed
sudo apt-get install preload -y

# Kdenlive is an acronym for KDE Non-Linear Video Editork 
sudo apt install -y kdenlive

# kazam vedio Record tool 
sudo apt install -y kazam

# echo "install 便签"
sudo add-apt-repository ppa:umang/indicator-stickynotes -y
sudo apt-get update && sudo apt-get install -y indicator-stickynotes

echo "install sogou start"
curl -sL 'https://keyserver.ubuntu.com/pks/lookup?&op=get&search=0x73BC8FBCF5DE40C6ADFCFFFA9C949F2093F565FF' | sudo apt-key add
sudo apt-add-repository 'deb http://archive.ubuntukylin.com/ukui focal main'
sudo apt upgrade -y
sudo apt install sogouimebs -y
echo "install sogou end"


# start need proxy set

#echo "set proxy start"
#export http_proxy='http://0.0.0.0:12333'
##export https_proxy='socks5://127.0.0.1:1080'
#export https_proxy='http://0.0.0.0:12333'
#echo "set proxy end" 
#
#echo "install oh my zsh start"
#sudo apt-get install -y zsh 
#echo "install oh my zsh"
#echo $password | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#echo "input custom alias export"
#sudo sh -c "cat >> /home/$user/.zshrc <<EOF
#alias datef=\"date '+%Y%m%d'\"
#alias gdate=\"date +'%Y%m%d' | clipcopy\"
#alias gpu=\"grive -p /home/$user/grive/\"
#alias pu=\"git add -A && git commit -m  \"..\" && git push\"
#alias rb=\"echo $password | sudo sync;sudo sync;sudo sync;sudo -S reboot\"
#alias sd=\"gpu && sudo sync&&sudo sync&& sudo sync&&sudo -S shutdown -h 0\"
#alias leanjava=\"idea ~/project/learn_java\"
#alias killmw=\"killall -9 mysql-workbench-bin\"
#alias noproxy=\"unset http_proxy && unset https_proxy\"
#alias killwx=\"killall -9 electronic-wechat\"
#export http_proxy='http://0.0.0.0:12333'
##export https_proxy='socks5://127.0.0.1:1080'
#export https_proxy='http://0.0.0.0:12333'
#EOF"
#oh my zsh copydir 
#sudo apt install -y xclip
#echo "install oh my zsh end"

#echo "install google chrome start"
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#sudo apt-get -y update
#sudo apt-get install -y google-chrome-stable
#echo "install google chrome end"
#
#echo "install grive2"
#sudo apt-get install git cmake build-essential libgcrypt20-dev libyajl-dev \
#    libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev \
#    debhelper zlib1g-dev dpkg-dev pkg-config -y
#git -C ~/ clone https://github.com/vitalif/grive2.git
#cd grive2
#mkdir build
#cd build
#cmake ..
#make -j4
#sudo make install
#rm -rf ~/grive2
#cd ~/
#echo "installed grive2"
#
#sed -i '/export http/d' /home/$user/.bashrc
# end need proxy set 


##### install from use device####
# cp -rf /home/$user/tmp/developer_environment/java ~/
# mkdir -p ~/.local/share/gnome-shell/extensions/
# cp -rf ~/java/other/gnome_extensions/* ~/.local/share/gnome-shell/extensions/
# tar -zxvf ~/java/jdk/jdk-8u151-linux-x64.tar.gz -C ~/java/jdk/
# tar -zxvf ~/java/jdk/jdk-7u80-linux-x64.tar.gz -C ~/java/jdk/
# tar -zxvf ~/java/web_server/apache-tomcat-7.0.88.tar.gz -C ~/java/web_server/
# tar -zxvf ~/java/web_server/apache-tomcat-8.5.28.tar.gz -C ~/java/web_server/
# tar -zxvf ~/java/idea/ideaIU.tar.gz -C ~/java/idea/
# tar -zxvf ~/java/git/smartgit-linux-18_2_5.tar.gz -C ~/java/git/
# unzip ~/java/build_tools/gradle-5.1.1-all.zip -d ~/java/build_tools/
# unzip ~/java/build_tools/apache-maven-3.6.0-bin.zip -d ~/java/build_tools/
# sudo update-alternatives --install /usr/bin/java java ~/java/jdk/jdk1.8.0_151/bin/java 300
# sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk/jdk1.8.0_151/bin/javac 300
# sudo update-alternatives --install /usr/bin/mvn mvn ~/java/build_tools/apache-maven-3.6.0/bin/mvn 300
# sudo update-alternatives --install /usr/bin/gradle gradle  ~/java/build_tools/gradle-5.1.1/bin/gradle 300
# cp ~/tmp/.netrc ~/
# sudo apt install -y -f






