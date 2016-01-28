#!/bin/bash

# setup environment
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C

# Install deb
apt-get -y install lubuntu-core
#apt-get -y install wbritish wamerican language-selector-gnome
apt-get -y install language-pack-en language-pack-zh-hans
apt-get -y install fonts-arphic-uming fonts-arphic-ukai fonts-droid
apt-get -y install policykit-1 chromium-browser chromium-browser-l10n
apt-get -y install glmark2-es2
apt-get clean

mkdir -p /etc/lightdm/lightdm.conf.d
rm -rf /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "autologin-user=walle" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "user-session=Lubuntu" >> /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
chmod 0644 /etc/lightdm/lightdm.conf.d/20-lubuntu.conf

# use Chinese language by default
echo "LANG=\"zh_CN.UTF-8\"" >> /etc/environment
echo "LANGUAGE=\"zh_CN:zh:en_US:en\"" >> /etc/environment

# use libmali for glmark2 with X11
ln -sf libmali.x11.so /usr/lib/libmali.so
find /usr/lib/arm-linux-gnueabihf/mesa-egl -name "lib*" -type f -exec ln -sf /usr/lib/libmali.so {} \;
