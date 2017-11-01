!/bin/bash
# ubuntu16.04_desktop lh environment install shell script
#更新系统
echo "更新系统 start"
echo ji | sudo -S apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

echo "install git"
sudo apt-get install -y git || "---------------install git fail "
echo "更新系统 end"


echo "install albert"
sudo add-apt-repository ppa:noobslab/macbuntu -y
sudo apt-get -y update 
sudo apt-get -y install  albert
echo "installed"

echo "install greeen Recorder"
sudo add-apt-repository ppa:fossproject/ppa -y
sudo apt update -y 
sudo apt install green-recorder -y
echo "installed"

echo "安装ssd"
sudo apt-get install -y ssh

echo "安装sshPass"
sudo apt-get install -y sshpass

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

echo "安装 sublime Text3 "
curl -o sublime_text.deb https://download.sublimetext.com/sublime-text_build-3126_amd64.deb && sudo dpkg -i sublime_text.deb

#echo "安装翻墙 shadowsocks-qt5"
#echo ji |sudo -S add-apt-repository ppa:hzwhuang/ss-qt5
#sudo apt-get update
#sudo apt-get install -y shadowsocks-qt5


echo "安装google-chrome"
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install -y google-chrome-stable
echo "安装 图片编辑软件"
sudo apt install gimp -y 

#echo "安装vitualbox" 
#curl -o virtualbox.deb http://download.virtualbox.org/virtualbox/5.1.6/virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb && sudo dpkg -i virtualbox.deb

echo "gpick 取色器安装"
sudo apt-get install gpick

#echo "下载intelliJ Idea 并解压"
#curl --socks5-hostname localhost:1080 -L https://download-cf.jetbrains.com/idea/ideaIU-2016.2.4.tar.gz -o intell.tar.gz && mkdir -p ~/java && tar -zxvf intell.tar.gz -C ~/java
#echo "安装 maven"
#sudo apt-get -y  install --no-install-recommends maven


#echo "下载jdk7 jdk8 并安装"
#curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz -o jdk-8.tar.gz && mkdir -p ~/java/jdk-8u101 ; tar -zxvf jdk-8.tar.gz -C ~/java/jdk-8u101 --strip-components 1
#curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz  -o jdk-7.tar.gz && mkdir ~/java/jdk-7u79 ; tar -zxvf jdk-7.tar.gz -C ~/java/jdk-7u79 --strip-components 1
#echo "配置java 环境变量"
#echo ji | sudo -S update-alternatives --install /usr/bin/java java ~/java/jdk-8u101/bin/java 320
#sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk-8u101/bin/javac 320
#sudo update-alternatives --install /usr/bin/java java ~/java/jdk-7u79/bin/java 310
#sudo update-alternatives --install /usr/bin/javac javac ~/java/jdk-7u79/bin/javac 310
#
#echo "tomcat7 tomcat9 download and decompression"
#curl -o tomcat7.tar.gz http://mirror.its.dal.ca/apache/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz && tar -zxvf tomcat7.tar.gz -C ~/java || "--------解压tomcat7 失败"
#curl -o tomcat9.tar.gz  || http://apachemirror.ovidiudan.com/tomcat/tomcat-9/v9.0.0.M11/bin/apache-tomcat-9.0.0.M11.tar.gz && tar -zxvf tomcat7.tar.gz -C ~/java || "--------解
#压tomcat9 失败"
#echo "fix depends"
#sudo apt-get -f install

echo "关闭影响shutdown service"
echo ji | sudo -S systemctl disable cups-browsed.service
echo ji | sudo -S systemctl stop cups-browsed.service

