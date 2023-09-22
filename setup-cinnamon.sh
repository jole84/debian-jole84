#!/bin/bash

# update sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.bak
sudo cp sources.list /etc/apt/sources.list

# update system
sudo apt update
sudo apt dist-upgrade

# install packages
sudo apt install \
    alsa-utils \
    android-sdk-platform-tools \
    bash-completion \
    bsdmainutils \
    btrfs-progs \
    cinnamon \
    cryptsetup \
    cups \
    curl \
    dconf-cli \
    default-jre \
    ffmpeg \
    flatpak \
    fwupd \
    gcc \
    gdebi \
    git \
    gnome-keyring \
    gnome-software \
    gnome-software-plugin-flatpak \
    htop \
    intel-media-va-driver \
    lightdm-gtk-greeter-settings \
    linux-headers-amd64 \
    make \
    materia-gtk-theme \
    mpv \
    neofetch \
    network-manager \
    openssh-server \
    paper-icon-theme \
    perl \
    python3-pip \
    rsync \
    software-properties-gtk \
    synaptic \
    system-config-printer \
    tmux \
    ufw

# install chrome browser
curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o $HOME/google-chrome-stable_current_amd64.deb
sudo dpkg -i $HOME/google-chrome-stable_current_amd64.deb
sudo apt install -f -y

# install gdal stuff
sudo apt install \
    gdal-bin \
    libprotobuf-dev \
    osmium-tool \
    osmosis \
    protobuf-compiler \
    python3-gdal \
    python3-lxml \
    python3-protobuf
    
# remove old intel driver
sudo apt remove xserver-xorg-video-intel

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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
sudo sed -i "s/#greeter-hide-users=false/greeter-hide-users=false/" /etc/lightdm/lightdm.conf
export DISPLAY=:0
dconf write /org/cinnamon/muffin/tile-maximize true
dconf write /org/cinnamon/theme/name "'Materia'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Paper'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Materia'"

dconf write /org/cinnamon/desktop/media-handling/automount false
dconf write /org/cinnamon/muffin/placement-mode "'pointer'"
dconf write /org/cinnamon/desktop/privacy/remember-recent-files false

echo "Install complete!"
