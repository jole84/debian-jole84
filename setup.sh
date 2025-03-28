#!/bin/bash

# update sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.bak
sudo cp sources.list /etc/apt/sources.list

# update system
sudo apt update
sudo apt dist-upgrade -y

# install packages
sudo apt install \
    ark \
    bash-completion \
    bsdmainutils \
    btrfs-progs \
    cryptsetup \
    cups \
    curl \
    default-jre \
    distrobox \
    ffmpeg \
    ffmpegthumbs \
    fish \
    flatpak \
    fprintd \
    fwupd \
    gcc \
    gdebi \
    git \
    gnome-keyring \
    htop \
    kde-config-flatpak \
    kde-plasma-desktop \
    kde-spectacle \
    libpam-fprintd \
    linux-headers-amd64 \
    make \
    micro \
    network-manager \
    openssh-server \
    perl \
    plasma-discover-backend-flatpak \
    plasma-nm \
    podman \
    rsync \
    sddm-theme-debian-breeze \
    software-properties-gtk \
    synaptic \
    system-config-printer \
    tmux \
    qt5-style-kvantum \
    ufw 
    
# install chrome browser
curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o $HOME/google-chrome-stable_current_amd64.deb
sudo dpkg -i $HOME/google-chrome-stable_current_amd64.deb
sudo apt install -f -y

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub --assumeyes --noninteractive \
    io.github.shiftey.Desktop \
    io.mpv.Mpv \
    org.qgis.qgis//stable \
    org.sqlitebrowser.sqlitebrowser

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
chsh -s /usr/bin/fish
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /$HOME/.bashrc
echo "Defaults pwfeedback" | sudo tee /etc/sudoers.d/feedback
# mkdir -p ~/bin
# curl -L https://github.com/topgrade-rs/topgrade/releases/download/v15.0.0/topgrade-v15.0.0-x86_64-unknown-linux-gnu.tar.gz | tar xz -C ~/bin

echo "Install complete!"
