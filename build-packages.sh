#!/bin/sh
# building AUR packages and make sur esaving them into airootfs/root/packages:
echo "%wheel         ALL = (ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo PKGDEST=/usr/share/packages >> /etc/makepkg.conf
mkdir /usr/share/packages
pacman -Syy
pacman -S --noconfirm --needed git yay
useradd -m -G wheel -s /bin/bash build
sudo -u  build yay -S --noconfirm - < /packages-AUR.x86_64
cp /usr/share/packages/* airootfs/root/packages/
