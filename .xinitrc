#!/bin/sh

xrdb -merge .Xresources
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:caps,compose:ralt"
#ck-launch-session nm-applet
/usr/bin/xcalib -d :0 ~/color/lenovo_x1.icc
/usr/bin/xbacklight -set 80
/usr/bin/xinput set-prop 12 'Device Enabled' 0

exec i3
