#!/bin/bash

# 添加archlinuxcn源到pacman.conf
echo "adding the archlinuxcn repo..."
if ! grep -q "\[archlinuxcn\]" /etc/pacman.conf; then
    sudo bash -c 'echo -e "\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf'
    echo "Done!"
else
    echo "It seems that the archlinuxcn repo is already added to your pacman.conf."
fi

# 更新软件包数据库
echo "updating package database..."
sudo pacman -Sy
sudo paru -Sy
sudo yay -Sy

# install archlinuxcn-keyring
echo "installing archlinuxcn-keyring...,it may take a while..."
sudo pacman -S --noconfirm archlinuxcn-keyring

echo "everything is done!"