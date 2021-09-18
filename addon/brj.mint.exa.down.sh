#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# need run? fix me

# https://github.com/ogham/exa
# https://the.exa.website/

exit 0

rm -rf /tmp/exa
mkdir -p /tmp/exa
cd /tmp/exa

wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip

echo "pochti. all done"

unzip -o exa-linux-x86_64-v0.10.1.zip

sudo cp /tmp/exa/bin/exa /usr/local/bin
sudo cp /tmp/exa/completions/exa.bash /etc/bash_completion.d
sudo cp /tmp/exa/man/exa_colors.5 /usr/share/man/man1
sudo cp /tmp/exa/man/exa.1 /usr/share/man/man1

/usr/local/bin/exa --long /usr/local/bin/exa /etc/bash_completion.d/exa.bash /usr/share/man/man1/exa.1

sudo apt -y --fix-broken install

