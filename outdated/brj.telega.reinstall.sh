#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

exit 0

# need run? fix me

user=`whoami`

echo $user:$user

killall -9 telegram-desktop

sudo apt-mark unhold telegram-desktop
sudo apt purge -y telegram-desktop
sudo apt -y install telegram-desktop
sudo apt-mark hold telegram-desktop

killall -9 telegram-desktop

rm -rf /tmp/telega
mkdir -p /tmp/telega

cd /tmp/telega

aria2c \
    --dir=/tmp/telega -j 5 --connect-timeout=60 \
    --human-readable=true --download-result=full --file-allocation=none \
    --summary-interval=15 \
    https://telegram.org/dl/desktop/linux

tar -xvf tsetup.*

mv /tmp/telega/Telegram/Telegram /tmp/telega/telegram-desktop
mv /tmp/telega/Telegram/Updater /tmp/telega/telegram-updater

sudo chown -R $user:$user /tmp/telega
sudo chmod 777 $user:$user /tmp/telega

sudo cp -v /tmp/telega/telegram-desktop /usr/bin
sudo cp -v /tmp/telega/telegram-updater /usr/bin

/usr/bin/telegram-desktop &

echo "ok, i start it!"
