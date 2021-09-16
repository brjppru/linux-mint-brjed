#!/bin/sh

#0 0 * * * journalctl --vacuum-time=2d
# sudo echo "0,15,30,45 * * * * ntpdate -u time.nist.gov" >> /etc/cron.d/vmclocksync

echo "0,15,30,45 * * * * journalctl --vacuum-time=2d" | sudo tee /etc/cron.d/brj.vacuum
