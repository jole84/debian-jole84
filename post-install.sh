#!/bin/bash

mkdir ~/git
pip install --upgrade --ignore-installed pip setuptools wheel

pip install --upgrade pytz
pip install --upgrade requests
pip install --upgrade python-dateutil
pip install --upgrade ogr2osm
pip install --upgrade osmium
sudo pip install --upgrade ogr2osm

flatpak install flathub io.github.shiftey.Desktop  --assumeyes
flatpak install flathub org.qgis.qgis --assumeyes
flatpak install flathub org.inkscape.Inkscape --assumeyes
flatpak install flathub org.sqlitebrowser.sqlitebrowser --assumeyes
flatpak install flathub org.kde.kdenlive --assumeyes
flatpak install flathub org.onlyoffice.desktopeditors --assumeyes

exit

sudo usermod -a -G vboxusers $USER
ln -s ~/git/private/linux/bin/ ~/bin
ln -s ~/git/private/linux/bash_aliases ~/.bash_aliases