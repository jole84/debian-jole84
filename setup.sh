#!/bin/bash

# update sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.bak
sudo cp sources.list /etc/apt/sources.list

# update system
sudo apt update
sudo apt dist-upgrade -y

# install packages
sudo apt install \
    android-sdk-platform-tools \
    ark \
    bash-completion \
    bsdmainutils \
    btrfs-progs \
    cryptsetup \
    cups \
    curl \
    default-jre \
    ffmpeg \
    ffmpegthumbs \
    flatpak \
    fwupd \
    gcc \
    gdebi \
    git \
    gnome-keyring \
    gwenview \
    htop \
    intel-media-va-driver \
    kde-plasma-desktop \
    kde-spectacle \
    linux-headers-amd64 \
    make \
    materia-gtk-theme \
    materia-kde \
    micro \
    nala \
    neofetch \
    network-manager \
    openssh-server \
    paper-icon-theme \
    perl \
    plasma-discover-backend-flatpak \
    plasma-nm \
    rsync \
    sddm-theme-debian-breeze \
    software-properties-gtk \
    synaptic \
    system-config-printer \
    tmux \
    unattended-upgrades \
    ufw

# install chrome browser
# curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o $HOME/google-chrome-stable_current_amd64.deb
# sudo dpkg -i $HOME/google-chrome-stable_current_amd64.deb
sudo apt install -f -y
    
# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub -y \
    org.mozilla.firefox \
    org.kde.gwenview \
    org.sqlitebrowser.sqlitebrowser \
    org.inkscape.Inkscape \
    io.mpv.Mpv \
    io.github.shiftey.Desktop \
    org.qgis.qgis

# install rclone
sudo curl https://rclone.org/install.sh | sudo bash
sudo rclone genautocomplete bash

# install yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

# setup firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# customisations
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /$HOME/.bashrc

echo "Install complete!"
