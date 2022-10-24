#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then 
    echo "Please run as root"
    exit 1 
fi

# Debian sources
read -p "Select release: [1:testing, 2:unstable, else:stable]" Release
read -p "Select desktop environment: [plasma, gnome, cinnamon, xfce]" Desktop

cp /etc/apt/sources.list /etc/apt/sources.list.bak
if [ $Release == "1" ]; then
    cp sources-testing.list /etc/apt/sources.list
elif [ $Release == "2" ]; then
    cp sources-unstable.list /etc/apt/sources.list
else
    cp sources.list /etc/apt/sources.list
fi
apt update
apt dist-upgrade -y

# install selected desktop environment
if [ $Desktop == "plasma" ]; then
    apt install -y \
        gwenview \
        kde-plasma-desktop \
        materia-kde \
        plasma-discover-backend-flatpak \
        plasma-nm \
        sddm-theme-debian-breeze \
        software-properties-kde
elif [ $Desktop == "gnome" ]; then
    apt install -y \
        gnome-core \
        gnome-software \
        gnome-software-plugin-flatpak \
        software-properties-gtk
elif [ $Desktop == "cinnamon" ]; then
    apt install -y \
        cinnamon \
        gnome-software \
        gnome-software-plugin-flatpak \
        software-properties-gtk
elif [ $Desktop == "xfce" ]; then
    apt install -y \
        gnome-software \
        gnome-software-plugin-flatpak \
        lightdm-gtk-greeter-settings \
        software-properties-gtk \
        xfce4 \
        xfce4-battery-plugin \
        xfce4-power-manager \
        xfce4-terminal \
        xfce4-whiskermenu-plugin
else
    exit
fi

# install packages
apt install -y \
    adb \
    aisleriot \
    ark \
    bash-completion \
    bsdmainutils \
    cmus \
    cpu-x \
    cups \
    curl \
    fastboot \
    ffmpeg \
    firmware-linux \
    flatpak \
    gcc \
    gdebi \
    git \
    gnome-cards-data \
    intel-media-va-driver-non-free \
    linux-headers-amd64 \
    make \
    materia-gtk-theme \
    neofetch \
    network-manager \
    openssh-server \
    paper-icon-theme \
    perl \
    python3-pip \
    rsync \
    synaptic \
    system-config-printer \
    tmux \
    vlc

# install chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
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

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install rclone
curl https://rclone.org/install.sh | sudo bash
rclone genautocomplete bash

# install yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

echo "Install complete!"
sleep 5
reboot
