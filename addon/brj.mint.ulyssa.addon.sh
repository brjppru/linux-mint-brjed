#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# need run? fix me

# data format for clock
# [%V/%j] %Y-%m-%d  %H:%M

exit 0

# syncthing here

## Add the "stable" channel to your APT sources:
#echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Add the release PGP keys:
#curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Increase preference of Syncthing's packages ("pinning")
#printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing
# syncthing here

mkdir -p /tmp/debs
cd /tmp/debs

wget -nc https://www.rescuetime.com/installers/rescuetime_current_amd64.deb
wget -nc https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/nemo-megasync-xUbuntu_20.04_amd64.deb
wget -nc https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb
wget -nc https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
#wget -nc https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
wget -nc https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
wget -nc https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
wget -nc https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
wget -nc https://github.com/muesli/duf/releases/download/v0.6.0/duf_0.6.0_linux_amd64.deb
wget https://www.xmind.net/zen/download/linux_deb/ -o xmind.deb

echo "copy winetricks to ~/bin"

sudo systemctl enable fstrim.timer

sudo update-alternatives --config editor
sudo update-alternatives --config x-terminal-emulator
gsettings set org.gnome.rhythmbox.plugins.iradio initial-stations-loaded false

mkdir ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

git config --global user.name "Roman Y. Bogdanov"
git config --global user.email sam@brj.pp.ru
git config --global color.ui true
git config --global core.editor mcedit

# fuse for sshfs
sudo groupadd fuse
sudo usermod -aG fuse $USER

# pulseaudiofix
#2todo sed replace
#В " _/etc/pulse/daemon.conf_ " прописать
#
#> default-sample-rate = 48000  
#> avoid-resampling = yes


echo "all done"