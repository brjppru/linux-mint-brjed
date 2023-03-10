#!/bin/sh

# console excel magics

exit 0

#
# the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#

cd /tmp
git clone https://github.com/andmarti1424/sc-im.git
sudo apt install libncurses5-dev
cd /tmp/sc-im/src
make
sudo make install

