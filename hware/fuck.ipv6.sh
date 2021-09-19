#!/bin/sh

# fuck ipv6

sudo tee <<EOF /etc/sysctl.d/no.ipv6.conf >/dev/null
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF

# fuck gai
#precedence ::ffff:0:0/96  100

sudo sed -i 's/#precedence ::ffff:0:0\/96  100/precedence ::ffff:0:0\/96  100/' /etc/gai.conf
