#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# this is the brj linux mint Ulyssa bolgenos script ;-)
# http://brj.pp.ru/
#
# bolgenos for linuxmint-20.1-cinnamon-64bit.iso
#
# do not connect to internet and download updates

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

sudo apt install -y cpu-checker qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager netcat libvirt-daemon-system virt-top libguestfs-tools libosinfo-bin
#sudo apt install -y qemu-system
sudo gpasswd -a $USER libvirt

sudo lsmod | grep -i kvm
sudo egrep -c '(vmx|svm)' /proc/cpuinfo
sudo systemctl status libvirtd
sudo systemctl enable --now libvirtd
sudo kvm-ok

cd /var/lib/libvirt/images/

# https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/index.html

#wget -nc https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
#wget -nc https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win_amd64.vfd

wget -nc https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso
wget -nc https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win_amd64.vfd

# =========================================================
# backup
# =========================================================

# Another placeholder just to jog my memory

# copy the VM’s disks from /var/lib/libvirt/images on src host to the same dir on destination host
# on the source host run virsh dumpxml VMNAME > domxml.xml and copy this xml to the dest. host on the destination host run virsh define domxml.xml

# =========================================================
# qemu-guest-agent
# =========================================================

# sudo apt install -y qemu-guest-agent
# systemctl enable qemu-guest-agent
# systemctl start qemu-guest-agent
# virsh qemu-agent-command <guest-name> '{"execute":"guest-info"}'

# =========================================================
# nuke archives
# =========================================================

sudo rm -rf /var/cache/apt/archives
sysup

# =========================================================

notify-send -i utilities-terminal brj.done "All tasks ok successfully! ;-)"

# =========================================================

