#!/bin/sh

exit 0

#
# the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#

sudo apt-get -y install git fonts-powerline

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

sudo chsh -s $(which bash) $(whoami)
