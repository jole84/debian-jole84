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
gcc \
make \
perl \
linux-headers-amd64 \
bsdmainutils \
flatpak \
git \
firmware-linux \
network-manager \
gdebi \
synaptic \
bash-completion \
kde-plasma-desktop \
plasma-nm \
ark \
python3-pip \
curl \
ffmpeg \
cmus \
sddm-theme-debian-breeze \
paper-icon-theme \
materia-gtk-theme \
materia-kde \
system-config-printer \
cups \
rsync \
gwenview \
plasma-discover-backend-flatpak

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
apt install -f -y

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
