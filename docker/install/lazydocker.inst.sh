#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

exit 0

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
# begin install's
# =========================================================

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# =========================================================

