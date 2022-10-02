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
apt update -y
apt dist-upgrade -y

# install packages
apt install \
aisleriot \
ark \
bash-completion \
bsdmainutils \
cmus \
cups \
curl \
ffmpeg \
firmware-linux \
flatpak \
gcc \
gdebi \
git \
gnome-cards-data \
gwenview \
kde-plasma-desktop \
linux-headers-amd64 \
make \
materia-gtk-theme \
materia-kde \
network-manager \
paper-icon-theme \
perl \
plasma-discover-backend-flatpak \
plasma-nm \
python3-pip \
rsync \
sddm-theme-debian-breeze \
synaptic \
system-config-printer

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
apt install -f -y

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install rclone
curl https://rclone.org/install.sh | sudo bash
rclone genautocomplete bash
