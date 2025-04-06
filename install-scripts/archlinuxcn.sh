#!/bin/bash

# 添加archlinuxcn源到pacman.conf
echo "adding the archlinuxcn repo..."
if ! grep -q "\[archlinuxcn\]" /etc/pacman.conf; then
    sudo bash -c 'echo -e "\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf'
    echo "Done!"
else
    echo "It seems that the archlinuxcn repo is already added to your pacman.conf."
fi



# install archlinuxcn-keyring
echo "installing archlinuxcn-keyring...,it may take a while..."
sudo pacman -Sy --noconfirm archlinuxcn-keyring

# 更新软件包数据库
echo "updating package database..."
sudo pacman -Sy
paru -Sy
yay -Sy

echo "everything is done!"