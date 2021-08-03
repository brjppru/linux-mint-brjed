# up openvpn

put config to /etc and

`
systemctl status openvpn-client@ams
systemctl stop openvpn-client@ams
systemctl start openvpn-client@ams
systemctl status openvpn-client@ams
systemctl enable openvpn-client@ams
`
