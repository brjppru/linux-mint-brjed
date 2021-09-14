#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# this is the brj linux mint bolgenos script ;-)
# http://brj.pp.ru/
#
# bolgenos for linuxmint-20.2-cinnamon-64bit.iso
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
# nuked locale
# =========================================================

sudo apt install -y language-pack-en language-pack-gnome-en language-pack-gnome-en-base language-pack-ru language-pack-gnome-ru language-pack-gnome-ru-base

# =========================================================
# begin up keys + ppa
# =========================================================

sudo service apparmor stop
sudo update-rc.d -f apparmor remove
sudo apt purge -y apparmor
sudo apt purge -y transmission-common transmission-gtk
#sudo apt purge -y thunderbird thunderbird-gnome-support

# =========================================================
# preinstall needs
# =========================================================

sudo apt update -y

sudo apt install -y apt-transport-https ca-certificates aptitude dpkg apt-file git git-flow tig figlet

# =========================================================
# add repos
# =========================================================
#

figlet "add repos's"

# =========================================================
# wine + mixxx + anydesk
# =========================================================

# wine
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 

# mixxx
sudo add-apt-repository -y ppa:mixxx/mixxx

# anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

# down. makr down.
# https://github.com/wereturtle/ghostwriter/releases
sudo add-apt-repository -y ppa:wereturtle/ppa

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

# "

sysup

# =========================================================
# wine 
# =========================================================

sudo apt install -y --install-recommends winehq-stable

# =========================================================
# begin install's
# =========================================================
#
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
echo wireshark-common wireshark-common/install-setuid boolean true | debconf-set-selections
echo libbcg729-0	libbcg729-0/patent_compliance	boolean	true | debconf-set-selections
echo libbcg729-0:amd64	libbcg729-0/patent_compliance	boolean	true | debconf-set-selections
#

# =========================================================
# begin install's
# =========================================================

sudo apt install -y ssmtp whois mlocate net-tools pmount rsync tmux vrms bc net-tools
sudo apt install -y apt-file apt-show-versions apt-utils aptitude
sudo apt install -y cowsay cryptsetup curl figlet git gnupg htop keychain lolcat
sudo apt install -y mlocate neofetch neovim net-tools nmap openssh-server
sudo apt install -y rsync shellcheck sl speedtest-cli tmux unzip wget whois
sudo apt install -y pavucontrol rofi memtest86+
sudo apt install -y pmount rsync sl speedtest-cli psmisc httping
sudo apt install -y acpi arandr minicom
sudo apt install -y screenruler numlockx
sudo apt install -y tshark iftop sngrep ngrep sockstat linssid nmap
sudo apt install -y vim-nox fbreader
sudo apt install -y xclip xsel autocutsel
sudo apt install -y guake
sudo apt install -y gparted
sudo apt install -y sublime-text
sudo apt install -y telegram-desktop
sudo apt install -y sqlite3 smbclient
sudo apt install -y linphone
sudo apt install -y putty putty-tools
sudo apt install -y git shellcheck tldr
sudo apt install -y keepass2 keepassxc
sudo apt install -y molly-guard ncdu openssh-server htop powertop uget preload
sudo apt install -y pollinate smartmontools ethtool fdupes keychain ssh-askpass
sudo apt install -y gnome-contacts gnome-maps gnome-system-monitor caffeine qbittorrent
sudo apt install -y netcat sshfs curlftpfs davfs2
sudo apt install -y unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract wget curl
sudo apt install -y zip unzip p7zip p7zip-rar rar unrar
sudo apt install -y mc genisoimage
sudo apt install -y giggle git gitg
sudo apt install -y git zsh
sudo apt install -y cowsay curl dpkg aria2 figlet lnav
sudo apt install -y hardinfo bat dconf-editor edid-decode read-edid hwinfo
sudo apt install -y intel-microcode amd64-microcode
sudo apt install -y remmina remmina-plugin-rdp
sudo apt install -y doublecmd-gtk
sudo apt install -y anydesk vbetool
sudo apt install -y mediainfo command-not-found
sudo apt install -y tilix fping
sudo apt install -y ubuntu-restricted-extras mint-meta-codecs libavcodec-extra58 ffmpeg x264 lame vlc v4l-utils
sudo apt install -y midori chromium-browser elinks links lynx
sudo apt install -y cups cups-pdf
sudo apt install -y gtk-redshift xournal
sudo apt install -y dia graphviz xdot
sudo apt install -y imagemagick
sudo apt install -y android-tools-adb android-tools-fastboot jmtpfs
sudo apt install -y youtube-dl
sudo apt install -y torbrowser-launcher
sudo apt install -y picard
sudo apt install -y mixxx
sudo apt install -y tilix ccze bsd-mailx
sudo apt install -y ghostwriter
sudo apt install -y gtkhash

# =========================================================
# fonts + theme's
# =========================================================

sudo apt install -y xfonts-terminus ttf-dejavu fonts-droid-fallback ttf-dejavu ttf-xfree86-nonfree xfonts-terminus-oblique
sudo apt install -y ttf-mscorefonts-installer fonts-dejavu fonts-liberation2 fonts-ubuntu fonts-powerline
sudo apt install -y comixcursors-righthanded-opaque comixcursors-righthanded

# =========================================================
# games
# =========================================================

#sudo apt install -y aisleriot gnome-cards-data pysolfc gnome-2048 dosbox gnome-mahjongg gnome-mines gnome-sudoku hedgewars
#sudo apt install -y ioquake3

# =========================================================
# the end
# =========================================================

sudo rm -rf /var/cache/apt/archives
sysup

# =========================================================

notify-send -i utilities-terminal brj.done "All tasks ok successfully! ;-)"

# =========================================================

