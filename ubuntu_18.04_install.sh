#!/bin/bash

echo "set lh not need input passwd"
echo 'lh ALL=NOPASSWD: ALL' | sudo  tee --append /etc/sudoers
#更新系统
echo "更新系统 start"
sudo  apt-get -y update
sudo  apt-get -y upgrade
sudo  apt-get -y dist-upgrade
sudo  apt-get -y autoremove 


echo "install 安装文泉驿微黑字体库"
sudo apt install -y ttf-wqy-microhei 
echo "install git"
sudo apt-get install -y git 
echo "更新系统 end"

echo "install curl"
sudo apt-get install -y curl
echo "installed curl"

echo "install chrome-gnome-shell"
sudo apt-get install -y chrome-gnome-shell 
sudo apt install -y gnome-shell-extension-dashtodock

echo "gnome-tweak-tool"
sudo apt install -y gnome-tweak-tool

echo "tree"
sudo apt install -y tree

#echo "shadowsocks"
#sudo apt install -y shadowsocks && sudo cp  /home/lh/tmp/shadowsocks.json  /etc/
#sudo sh -c 'cat > /etc/systemd/system/shadowsocks.service <<EOF
#[Unit]
#Description=Shadowsocks Client Service
#After=network.target
#
#[Service]
#Type=simple
#User=root
#ExecStart=/usr/bin/sslocal -c /etc/shadowsocks.json
#
#[Install]
#WantedBy=multi-user.target
#EOF'
#sudo systemctl enable /etc/systemd/system/shadowsocks.service


echo "install albert"
sudo apt install -y sshpass
sudo apt install -y wget
echo "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.15 (GNU/Linux)

mQENBFnzOIkBCADQwZPcCnJmctHHrL0ploR8uhfaOQDAgBKOYZRJY6DbfexXZIbS
iRb3Ml9Uq0h2GOciZf5emW7H6pYl7ayaoRoiiYyZkGkeFHxgR/aWnZasL21ZOfsX
/MeSvgKwUl5mAaUZIpci5JwuEYVVhKEHHFReo3ZbL6ctU5oqcWwjrK4k2ZlF/FE1
YozzqXm4UCK2Bm3C6PyDvLI92O+CadC0fbsHKCHjAkEMS9FR8BhNuW4D6PLRpmPi
rEi56ydZKsSIoJ87Otecu1x7o80W4Gs5/9FCDYiTbO0UxbhKA7PGUxotHW4zkY+G
rpEaP/afZ0eCJjOJvD82AEpHx9Pi6NAhrpsTABEBAAG0SmhvbWU6bWFudWVsc2No
bmVpZDNyIE9CUyBQcm9qZWN0IDxob21lOm1hbnVlbHNjaG5laWQzckBidWlsZC5v
cGVuc3VzZS5vcmc+iQE+BBMBCAAoBQJZ8ziJAhsDBQkEHrAABgsJCAcDAgYVCAIJ
CgsEFgIDAQIeAQIXgAAKCRAUiOtG4ZKiV6HFB/wPkD0Y8eKj8DNFMFg8wHdsArRq
zr2WCxapWXvFRHHRx5arX0ZiHVs88LOGscVkDLFak39DpPEePEnwmSc9RBBuuNdt
KtWHW4S8KVcS4LYJftTVIuM/gf9G4CTXOc0wE6zEomaZM0MRruwK5w1TDhvyHA06
V4iNgrXzF2tWyuZpoe4I9u0lZRxf2BT4KoxwYZr5E6FjUKU+kIGSKV8a18BXbZ+u
8f/zh7v4QL7l9FueeFMSPAqVtqUo4yxxahas1MRHGJaNwb0mr6bGdMH8bMYRm0P3
dMkxkgsMZHUFsxqUp69pBOCUn62WiuJM04/J7HbAlGRJss/vV3p5Sa5EMyS+iEYE
ExECAAYFAlnzOIkACgkQOzARt2udZSNlwgCbBL8uyCkkYkwcXKLro9W7HjlJt0UA
oIPuD7rh4nc6sxvZBjTsjpBahgee
=TcQh
-----END PGP PUBLIC KEY BLOCK-----" > Release.key
#wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install albert -y
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
echo "input custom alias export"
sudo sh -c "cat >> /home/lh/.zshrc <<EOF
alias datef=\"date '+%Y%m%d'\"
alias gdate=\"print -n `datef` | clipcopy\"
alias gpu=\"grive -p /home/lh/grive/\"
alias pu=\"git add -A && git commit -m  \"..\" && git push\"
alias rb=\"echo ji | sudo sync;sudo sync;sudo sync;sudo -S reboot\"
alias sd=\"gpu && sudo sync&&sudo sync&& sudo sync&&sudo -S shutdown -h 0\"
alias leanjava=\"idea ~/project/learn_java\"
alias killmw=\"killall -9 mysql-workbench-bin\"
alias noproxy=\"unset http_proxy && unset https_proxy\"
alias killwx=\"killall -9 electronic-wechat\"
#export https_proxy='https://0.0.0.0:7118'
export http_proxy='http://0.0.0.0:12333'
#export https_proxy=socks5://127.0.0.1:1080
EOF"

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

#echo "install privoxy"
#sudo apt install -y privoxy
#sudo sh -c "echo 'forward-socks5 / 127.0.0.1:1080 .' >> /etc/privoxy/config"
#sudo systemctl start privoxy.service

echo "gpick 取色器安装"
sudo apt-get install gpick -y 

echo "smplayer是基于mplayer的一个图形化前端 ]加速 [减速"
sudo apt install -y mplayer
sudo apt install -y smplayer

sudo apt install -y mysql-server-5.7 

sudo wget -nv -O Release.key \
>   https://build.opensuse.org/projects/home:manuelschneid3r/public_key

sudo apt-key add - < Release.key

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
cd ~/
echo "success install grive2"

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
line=`sudo cat /etc/xrdp/startwm.sh |wc -l`
linel2=`expr $line - 1`
sudo sed -i "$linel2","$line"s/^/#/ /etc/xrdp/startwm.sh
sudo sh -c  'echo "gnome-session" >> /etc/xrdp/startwm.sh'

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

# install green recorder
sudo add-apt-repository ppa:fossproject/ppa -y
sudo apt update
sudo apt install green-recorder -y

# improve tools start speed
sudo apt-get install preload -y
# markdown editor
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./' -y
sudo apt-get update
sudo apt-get install typora -y

# install docker 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y
sudo apt-get update    

sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
##### install from use device####
cp -rf ~/java/other/gnome_extensions/* ~/.local/share/gnome-shell/extensions/
mkdir -p ~/.local/share/gnome-shell/extensions/
cp -rf /home/lh/tmp/developer_environment/java ~/
tar -zxvf ~/java/jdk/jdk-8u151-linux-x64.tar.gz -C ~/java/jdk/
tar -zxvf ~/java/jdk/jdk-7u80-linux-x64.tar.gz -C ~/java/jdk/
tar -zxvf ~/java/web_server/apache-tomcat-7.0.88.tar.gz -C ~/java/web_server/
tar -zxvf ~/java/web_server/apache-tomcat-8.5.28.tar.gz -C ~/java/web_server/
tar -zxvf ~/java/idea/ideaIU.tar.gz -C ~/java/idea/
tar -zxvf ~/java/git/smartgit-linux-18_2_5.tar.gz -C ~/java/git/
echo "-javaagent:/home/lh/java/idea/jetbrains.jar">> ~/java/idea/idea-IU-183.4284.148/bin/idea64.vmoptions
unzip ~/java/build_tools/gradle-5.1.1-all.zip -d ~/java/build_tools/
unzip ~/java/build_tools/apache-maven-3.6.0-bin.zip -d ~/java/build_tools/
sudo update-alternatives --install /usr/bin/java java ~/java/jdk/jdk1.8.0_151/bin/java 400
sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk/jdk1.8.0_151/bin/javac 400
sudo update-alternatives --install /usr/bin/java java ~/java/jdk/jdk1.7.0_80/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk/jdk1.7.0_80/bin/javac 300
sudo update-alternatives --install /usr/bin/mvn mvn ~/java/build_tools/apache-maven-3.6.0/bin/mvn 300
sudo update-alternatives --install /usr/bin/gradle gradle  ~/java/build_tools/gradle-5.1.1/bin/gradle 300
cp ~/tmp/.netrc ~/
sudo dpkg -i ~/java/other/atom-amd64.deb
sudo dpkg -i ~/java/other/sogoupinyin_2.2.0.0108_amd64.deb
sudo dpkg -i ~/java/other/electron-ssr-0.2.6.deb
sudo apt install -y -f
