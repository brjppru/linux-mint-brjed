#!/bin/sh

sudo tee <<EOF /etc/sysctl.d/no.ipv6.conf >/dev/null
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF

