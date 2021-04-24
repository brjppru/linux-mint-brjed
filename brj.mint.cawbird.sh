#!/bin/sh

exit 0

echo 'deb http://download.opensuse.org/repositories/home:/IBBoard:/cawbird/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:IBBoard:cawbird.list
curl -fsSL https://download.opensuse.org/repositories/home:IBBoard:cawbird/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_IBBoard_cawbird.gpg > /dev/null
sudo apt update
sudo apt install cawbird

# via https://ibboard.co.uk/cawbird/
