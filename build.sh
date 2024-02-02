#!/bin/sh
cd "EndeavourOS-Community-hyprland-ISO"
./mkarchiso -v "." 2>&1 | tee "eosiso_$(date -u +'%Y.%m.%d-%H:%M').log"
ls out/ > /tmp/isoname
cd out/
isoname=$(cat /tmp/isoname)
sha512sum $isoname > $isoname.sha512sum
