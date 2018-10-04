#!/bin/bash
scrot /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#convert /tmp/screen.png -scale 50% /tmp/screen.png
#convert /tmp/screen.png -blur 2x8 /tmp/screen.png
#convert /tmp/screen.png -scale 200% /tmp/screen.png
#convert /tmp/screen.png -paint 3 -modulate 80 /tmp/screen.png
#convert /tmp/screen.png -paint 3 /tmp/screen.png
#[[ -f ~/gits/linux_config/i3/lock.png ]] && convert /tmp/screen.png  ~/gits/linux_config/i3/lock.png -gravity center -composite -matte /tmp/screen.png
[[ -f ~/gits/linux_config/i3/lock.png ]] && convert /tmp/screen.png -scale 20% -blur 0x2.5 -scale 500% ~/gits/linux_config/i3/lock.png -gravity center -composite -matte /tmp/screen.png
if [[ $? != 0 ]]; then
	convert /tmp/screen.png -scale 25% -blur 0x2.5 -scale 400% /tmp/screen.png
fi
i3lock -e -i /tmp/screen.png
