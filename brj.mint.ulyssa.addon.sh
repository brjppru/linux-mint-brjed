#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

mkdir -p /tmp/debs
cd /tmp/debs

wget -nc https://www.rescuetime.com/installers/rescuetime_current_amd64.deb
wget -nc https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/nemo-megasync-xUbuntu_20.04_amd64.deb
wget -nc https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb

mkdir -p ~/.local/share/fonts/

wget -nc https://github.com/be5invis/Iosevka/releases/download/v4.5.0/ttf-iosevka-4.5.0.zip
wget -nc https://github.com/be5invis/Iosevka/releases/download/v4.5.0/ttf-iosevka-fixed-4.5.0.zip

echo "copy font to ~/.local/share/fonts/ and run fc-cache -fv"

sudo systemctl enable fstrim.timer

sudo update-alternatives --config editor
sudo update-alternatives --config x-terminal-emulator

mkdir ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

git config --global user.name "Roman Y. Bogdanov"
git config --global user.email sam@brj.pp.ru
git config --global color.ui true
git config --global core.editor mcedit
