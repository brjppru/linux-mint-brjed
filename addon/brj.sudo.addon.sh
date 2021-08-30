#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

User=`whoami`

# need run? fix me

exit 0

sudo apt-get -y install sudo

# Add config file to /etc/sudoers.d/ to allow $User extra privileges. 
file="/etc/sudoers.d/sudoers_${User}"

if [[ -f "$file" ]]; then
    echo ""
    echo "$file already exists. Skipping ..."
else
    echo "$User ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee $file
    sudo usermod -aG sudo $User
fi
