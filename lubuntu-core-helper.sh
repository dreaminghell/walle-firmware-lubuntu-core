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
apt-get -y install glmark2-es2
apt-get clean

mkdir -p /etc/lightdm/lightdm.conf.d
rm -rf /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "autologin-user=walle" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "user-session=Lubuntu" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
chmod 0644 /etc/lightdm/lightdm.conf.d/20-lubuntu.conf

# use libmali for glmark2 with X11
ln -sf libmali.x11.so /usr/lib/libmali.so
find /usr/lib/arm-linux-gnueabihf/mesa-egl -name "lib*" -type f -exec ln -sf /usr/lib/libmali.so {} \;
