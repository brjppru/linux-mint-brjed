# refuck dns

Disable and stop the systemd-resolved service:

`
sudo systemctl disable systemd-resolved.service
`

`
sudo systemctl stop systemd-resolved
`

Then put the following line in the [main] section of your /etc/NetworkManager/NetworkManager.conf:

`
[main]
+++dns=default
`

Delete the symlink /etc/resolv.conf

`
rm /etc/resolv.conf
`

Restart network-manager

`
sudo service network-manager restart
`
