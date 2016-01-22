#!/bin/bash

# setup environment
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C

# Install deb
apt-get -y install lubuntu-core
apt-get -y install policykit-1 chromium-browser
apt-get clean
