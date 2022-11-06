#!/bin/bash

# check if run as root
if [[ $(id -u) -ne 0 ]] ; then 
    echo "Please run as root"
    exit 1 
fi

# update sources.list
cp sources.list /etc/apt/sources.list

# update system
apt update
apt dist-upgrade -y

# install backported packages
sudo apt install -y -t bullseye-backports \
    linux-image-amd64 \
    linux-headers-amd64 \
    firmware-linux

# install packages
apt install -y \
    adb \
    aisleriot \
    ark \
    bash-completion \
    bsdmainutils \
    cryptsetup \
    cmus \
    cpu-x \
    cups \
    curl \
    fastboot \
    ffmpeg \
    flatpak \
    gcc \
    gdebi \
    git \
    gnome-cards-data \
    gnome-keyring \
    gwenview \
    htop \
    intel-media-va-driver-non-free \
    kde-plasma-desktop \
    make \
    materia-gtk-theme \
    materia-kde \
    mpv \
    neofetch \
    network-manager \
    openssh-server \
    paper-icon-theme \
    perl \
    plasma-discover-backend-flatpak \
    plasma-nm \
    python3-pip \
    rsync \
    sddm-theme-debian-breeze \
    software-properties-kde \
    synaptic \
    system-config-printer \
    tmux

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt install -f -y

# install gdal stuff
apt install -y \
    gdal-bin \
    libgdal-dev \
    libprotobuf-dev \
    osmium-tool \
    osmosis \
    protobuf-compiler \
    python3-gdal \
    python3-protobuf

# remove old intel driver
apt remove xserver-xorg-video-intel -y

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install rclone
curl https://rclone.org/install.sh | bash
rclone genautocomplete bash

# install yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

echo "Install complete!"
sleep 5
reboot
