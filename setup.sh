#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then 
    echo "Please run as root"
    exit 1 
fi

# Debian sources
echo "Swich to Debian unstable? [yes,NO]"
read input

cp /etc/apt/sources.list /etc/apt/sources.list.bak
if [ $input == "yes" ]; then
    cp sources-unstable.list /etc/apt/sources.list
else
    cp sources.list /etc/apt/sources.list
fi
apt update -y
apt dist-upgrade -y

# install packages
apt install -y \
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
openssh-server \
paper-icon-theme \
perl \
plasma-discover-backend-flatpak \
plasma-nm \
python3-pip \
rsync \
sddm-theme-debian-breeze \
synaptic \
system-config-printer \
vlc

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
apt install -f -y

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install rclone
curl https://rclone.org/install.sh | sudo bash
rclone genautocomplete bash

# install yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

echo "Install complete!"
