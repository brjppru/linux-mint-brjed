#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# =========================================================
# beroot
# =========================================================

beroot() {

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

}

# =========================================================
# begin up keys + ppa
# =========================================================

beroot

# =========================================================
# sysup
# =========================================================

sysup() {

    figlet "keysdb"
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `sudo aptitude update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`
    # force update
    figlet "update"
    sudo apt-get -y update
    figlet "dist-up"
    sudo apt-get -y dist-upgrade
    figlet "force deps"
    sudo apt-get -y -f install
    figlet "remove"
    sudo apt-get -y autoremove
    figlet "autoclean"
    sudo apt-get -y autoclean
    sudo apt-get -y clean

    figlet "remove old packages"
    sudo dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt purge -y
    sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v linux-libc-dev | xargs sudo apt purge -y


    figlet "update db"
    sudo updatedb
    sudo rm "/var/crash/*"
    figlet "done"
}

#"

# =========================================================
# begin install's
# =========================================================

sysup

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sysup

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name watchtower containrrr/watchtower --cleanup --label-enable --restart unless-stopped

sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# =========================================================
# nuke archives
# =========================================================

sudo rm -rf /var/cache/apt/archives
sysup

# =========================================================

notify-send -i utilities-terminal brj.done "All tasks ok successfully! ;-)"

# =========================================================

