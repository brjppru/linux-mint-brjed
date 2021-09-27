#!/bin/bash -x

# exa + dust

export DEBIAN_FRONTEND=noninteractive

exit

# need run? fix me

# https://github.com/ogham/exa
# https://the.exa.website/

rm -rf /tmp/exa
mkdir -p /tmp/exa
cd /tmp/exa

wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
wget https://github.com/bootandy/dust/releases/download/v0.7.5/dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz

echo "pochti. all done"

unzip -o exa-linux-x86_64-v0.10.1.zip
tar -xvf dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz --strip-components 1

sudo cp /tmp/exa/bin/exa /usr/local/bin
sudo cp /tmp/exa/completions/exa.bash /etc/bash_completion.d
sudo cp /tmp/exa/man/exa_colors.5 /usr/share/man/man1
sudo cp /tmp/exa/man/exa.1 /usr/share/man/man1
sudo cp /tmp/exa/dust /usr/local/bin

/usr/local/bin/exa --long /usr/local/bin/exa /etc/bash_completion.d/exa.bash /usr/share/man/man1/exa.1

sudo apt -y --fix-broken install

