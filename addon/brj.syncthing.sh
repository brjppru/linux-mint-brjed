#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

username=`whoami`

# need run? fix me

exit 0

mkdir -p /tmp/sync
cd /tmp/sync

sudo curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Increase preference of Syncthing's packages ("pinning")
printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing

sudo apt purge -y syncthing*
sudo apt-get update
sudo apt-get install syncthing

wget https://raw.githubusercontent.com/syncthing/syncthing/main/etc/linux-systemd/system/syncthing%40.service
sudo chown root: syncthing@.service
sudo mv syncthing@.service /etc/systemd/system
sudo systemctl daemon-reload

sudo systemctl enable --now syncthing@{$username}
systemctl status syncthing@${username}
sudo systemctl start syncthing@${username}

echo "ok, open http://127.0.0.1:8384/"

