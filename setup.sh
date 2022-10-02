#!/bin/bash

# Debian sources
echo "Swich to Debian unstable? [yes,no]"
read input

cp /etc/apt/sources.list /etc/apt/sources.list.bak
if [ $input == "yes" ]; then
    echo "yes"
    cp sources-unstable.list /etc/apt/sources.list
else
    echo "no"
    cp sources.list /etc/apt/sources.list
fi

# install packages
apt update
apt install gcc make perl linux-headers-amd64 bsdmainutils flatpak git firmware-linux network-manager gdebi synaptic bash-completion kde-plasma-desktop plasma-nm ark python3-pip curl ffmpeg cmus sddm-theme-debian-breeze paper-icon-theme materia-gtk-theme materia-kde

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo