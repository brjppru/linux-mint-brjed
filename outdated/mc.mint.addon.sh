#!/bin/sh

# see https://www.tataranovich.com/cms/repository

# need run? fix me

exit 0

sudo apt-get install -y curl gnupg
curl -fsSL http://www.tataranovich.com/debian/gpg | sudo apt-key add -

APT_SOURCE='deb [arch=amd64]  http://www.tataranovich.com/ubuntu focal main'
echo $APT_SOURCE | sudo tee /etc/apt/sources.list.d/tataranovich.list

#


