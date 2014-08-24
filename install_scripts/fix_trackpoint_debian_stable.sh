#!/bin/bash

sudo cat << EOF > /usr/share/X11/xorg.conf.d/11-trackpoint.conf
 Section "InputClass"
   Identifier "Trackpoint Wheel Emulation"
   MatchProduct       "PS/2 Generic Mouse"
   MatchDevicePath    "/dev/input/event*"
   Option             "EmulateWheel"          "true"
   Option             "EmulateWheelButton"    "2"
   Option             "Emulate3Buttons"       "false"
   Option             "XAxisMapping"          "6 7"
   Option             "YAxisMapping"          "4 5"
 EndSection

EOF

sudo echo "options psmouse proto=bare" > /etc/modprobe.d/modprobe.conf

echo "Now reboot"
