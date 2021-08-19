#!/bin/bash -x

# outdated

# use Hide Local Folders for TB78++
# Move Mail Shortcuts
# https://github.com/robert7k/moveMailShortcuts

exit 0

# https://launchpad.net/ubuntu/focal/amd64/thunderbird/1:68.10.0+build1-0ubuntu0.20.04.1
# https://launchpad.net/ubuntu/focal/amd64/thunderbird-gnome-support/1:68.10.0+build1-0ubuntu0.20.04.1

export DEBIAN_FRONTEND=noninteractive

exit 0

sudo apt-mark unhold thunderbird thunderbird-gnome-support
sudo apt purge -y thunderbird thunderbird-gnome-support

mkdir -p /tmp/tunder
cd /tmp/tunder

wget -nc http://launchpadlibrarian.net/486748924/thunderbird_68.10.0+build1-0ubuntu0.20.04.1_amd64.deb
wget -nc http://launchpadlibrarian.net/486748832/thunderbird-gnome-support_68.10.0+build1-0ubuntu0.20.04.1_amd64.deb

sudo dpkg -i thunderbird_68.10.0+build1-0ubuntu0.20.04.1_amd64.deb
sudo dpkg -i thunderbird-gnome-support_68.10.0+build1-0ubuntu0.20.04.1_amd64.deb

sudo apt-mark hold thunderbird thunderbird-gnome-support

exit 0

sudo apt-cache policy thunderbird
sudo apt-cache policy thunderbird-gnome-support

exit 0

sudo apt-get install thunderbird=1:68.10.0+build1-0ubuntu0.20.04.1
sudo apt-get install thunderbird-gnome-support=1:68.10.0+build1-0ubuntu0.20.04.1


sudo apt-cache policy thunderbird
sudo apt-cache policy thunderbird-gnome-support
