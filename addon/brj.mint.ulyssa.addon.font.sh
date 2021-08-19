#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# need run? fix me

exit 0

mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/

wget -nc https://github.com/be5invis/Iosevka/releases/download/v4.5.0/ttf-iosevka-4.5.0.zip
wget -nc https://github.com/be5invis/Iosevka/releases/download/v4.5.0/ttf-iosevka-fixed-4.5.0.zip
wget -nc https://github.com/microsoft/cascadia-code/releases/download/v2106.17/CascadiaCode-2106.17.zip
wget -nc https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip

echo "copy font to ~/.local/share/fonts/"
echo "unpack and run fc-cache -fv"

echo "all done"
