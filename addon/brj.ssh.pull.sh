#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

username=`whoami`

# need run? fix me

exit 0

#sudo apt install openssh-server
#sudo apt install openssh-client

mkdir ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
mkdir ~/.ssh && chmod 700 ~/.ssh

ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)-$(date -I)"

exit 0

sudo apt install keychain

# Use `keychain` for ssh-agent management
if [[ -x /usr/bin/keychain ]]; then
    keychain ~/.ssh/id_ed25519
    . "${HOME}/.keychain/${HOSTNAME}-sh"
fi

exit 0

Host *
        ForwardAgent yes
        ForwardX11 no
        ForwardX11Trusted yes
        Port 22
        Protocol 2
        ServerAliveInterval 60
        ServerAliveCountMax 30
        ControlPath ~/.ssh/controlmasters/%r@%h:%p
        ControlMaster auto
        Compression Yes
        SendEnv LANG LC_*
        HashKnownHosts no
        StrictHostKeyChecking no
        UserKnownHostsFile /dev/null


# tmux

set-option -g update-environment "DISPLAY SSH_ASKPASS SSH_AUTH_SOCK SSH_AGENT_PID SSH_CONNECTION WINDOWID XAUTHORITY"

# 

sudo ufw allow from 203.0.113.0/24 proto tcp to any port 22
