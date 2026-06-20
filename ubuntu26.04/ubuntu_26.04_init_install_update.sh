#!/bin/bash
# Program:
#       This program  install tools on ubuntu 26.04
# History:
# 2026/06/20    skylark  change release
# 运行方式: ./ubuntu_26.04_init_install_update.sh <userName> <password>
# <userName> 当前账户 <password> 当前账户对应的密码
# 脚本最下面注释了需要代理和本地存储设备的脚本,如需使用 移除注释

if [[ -z "$1" || -z "$2" ]]; then
        echo "first parameter user name , second parameter user password";
        exit 2;
fi

user=$1
password=$2
echo "get user:$user password:$password"

echo "set $user not need input password"
{ echo "$password"; echo "$user ALL=NOPASSWD: ALL"; } | sudo -k  -S tee --append /etc/sudoers

echo "start change ubuntu source to aliyun repo"
sudo tee /etc/apt/sources.list.d/ubuntu.sources > /dev/null <<'EOF'
Types: deb
URIs: http://mirrors.aliyun.com/ubuntu/
Suites: noble noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

Types: deb
URIs: http://security.ubuntu.com/ubuntu/
Suites: noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF
echo "end change ubuntu source to aliyun repo"

echo "ubuntu 26.04 update start"
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
echo "ubuntu 26.04 update end"

echo "install font"
sudo apt install -y fonts-wqy-microhei
echo "install font"

echo "install git start"
sudo apt install -y git
git config --global user.email "jyfc7879@gmail.com"
git config --global user.name "$user"
echo "install git end"

echo "install curl and wget install"
sudo apt install -y curl
sudo apt install -y wget
echo "install curl and wget end"

echo "install chrome-gnome-shell"
sudo apt install -y chrome-gnome-shell
echo "installed chrome-gnome-shell"


echo "install albert"
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_26.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_26.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install albert
echo "installed albert"


echo "install tools start"
sudo apt install -y tree
sudo apt install -y htop
sudo apt install -y rar
sudo apt install -y ssh
sudo apt install -y sshpass
sudo apt install -y okular
sudo apt install -y wmctrl
sudo apt install -y gnome-tweaks
sudo apt install -y apt-transport-https
sudo apt install -y compizconfig-settings-manager
sudo apt install -y compiz-plugins-extra
sudo apt -y install meld


sudo apt install -y vim || echo "vim install error"
echo "install vim-gtk of share clipboard"
sudo apt install -y vim-gtk3
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

#gnome extensions
echo "install gnome"
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y chrome-gnome-shell 
echo "install gnome"
#gnome extensions
#下载工具
sudo apt install uget -y
sudo apt install aria2 -y

#桌面环境配置
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" # disable Alt+F1
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal  "['<Alt>t']" # change alt+ctrl+t -> alt+t
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]" # disable window  menu
# 关闭窗口动画效果
gsettings set org.gnome.desktop.interface enable-animations false 

# kchmviewer
sudo apt install kchmviewer -y

#install screenshot ->command  'flameshot gui'
sudo apt install flameshot -y

# improve tools start speed
sudo apt install preload -y

# Kdenlive is an acronym for KDE Non-Linear Video Editork 
sudo apt install -y kdenlive

# kazam vedio Record tool 
sudo apt install -y kazam

# echo "install vscode"
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install -y code

#echo "!!!!need mount storage device !!!, mount direcoty: /media/files"

# variable set 
#ubuntu_need_downloads_files_directory=/media/files/linux/ubuntu/26.04
#
#echo "install lens"
#sudo cp $ubuntu_need_downloads_files_directory/tools/lens/Lens-2026.5.250609-latest.x86_64.AppImage /opt
#sudo chmod +x /opt/Lens-2026.5.250609-latest.x86_64.AppImage
#sudo chown $user:$user /opt/Lens-2026.5.250609-latest.x86_64.AppImage
#sudo ln -fs /opt/Lens-2026.5.250609-latest.x86_64.AppImage /opt/Lens.AppImage
#cp $ubuntu_need_downloads_files_directory/tools/lens/lens-desktop.desktop  ~/.local/share/applications/
#
#echo "install clash"
#sudo dpkg -i $ubuntu_need_downloads_files_directory/tools/proxy/Clash.Verge.deb 

# echo "set proxy start"
# export http_proxy='http://0.0.0.0:1080'
# export https_proxy='http://0.0.0.0:1080'
# echo "set proxy end" 

# echo "install oh my zsh start"
# sudo apt-get install -y zsh 
# echo "install oh my zsh"
# yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# echo $password | chsh -s  $(which zsh)
# ubuntu_need_downloads_files_directory=/media/files/linux/ubuntu/22.04
# zsh << EOF
# #oh my zsh copydir 
# sudo apt install -y xclip
# echo "install oh my zsh end"
# echo "set directory: $ubuntu_need_downloads_files_directory"
# #install asdf:The Multiple Runtime Version Manager
# echo "start install asdf"
# cp -r $ubuntu_need_downloads_files_directory/tools/asdf ~/.asdf
# git -C ~/.asdf checkout -f
# sed -i 's/plugins=(.*)/plugins=(git asdf)/g' ~/.zshrc
# source ~/.zshrc
# echo "end install asdf"

# # start need proxy set
# echo "asdf  start install software"
# asdf plugin add nodejs
# asdf install nodejs latest
# asdf global nodejs latest
# asdf plugin add java
# asdf install java adoptopenjdk-8.0.382+5
# asdf install java adoptopenjdk-11.0.19+7
# asdf install java adoptopenjdk-17.0.8+7
# asdf global java adoptopenjdk-17.0.8+7
# echo ". ~/.asdf/plugins/java/set-java-home.zsh">> ~/.zshrc
# asdf plugin add maven
# asdf install maven latest
# asdf global maven latest
# echo "asdf end install software"
# asdf plugin add gradle
# asdf install gradle latest
# asdf global gradle latest
# asdf plugin-add flux2 https://github.com/tablexi/asdf-flux2.git
# asdf install flux2 latest
# asdf global flux2 latest
# echo "command -v flux >/dev/null && . <(flux completion zsh)">> ~/.zshrc
# source  ~/.zshrc
# EOF

# echo "install google chrome start"
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb


# install sougou
#sudo apt-get install fcitx
#sudo apt --fix-broken install
#sudo dpkg -i ~/Downloads/software/sogoupinyin_4.2.1.145_amd64.deb
#sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2
#sudo apt install libgsettings-qt1
#sudo apt install -y -f
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
# end need proxy set 