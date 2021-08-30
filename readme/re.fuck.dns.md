# refuck dns

Disable and stop the systemd-resolved service:

`
sudo systemctl disable systemd-resolved
`

`
sudo systemctl stop systemd-resolved
`

`
sudo lsof -i :53
`


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

`
sudo vi /etc/systemd/resolved.conf
`

`
[Resolve]
DNS=1.1.1.1
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=no
DNSStubListener=no
#ReadEtcHosts=yes
`
