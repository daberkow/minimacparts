#!/bin/bash

startBasilisk ()
{
  cp -f /home/pi/Mac/Basilisk/xstartup /home/pi/.vnc/
  tightvncserver -geometry 640x480 -depth 16
  startx /home/pi/Mac/startVNC.sh
  clear
}

startBasilisk_no ()
{
  startx "/home/pi/Mac/Basilisk/BasiliskII" --config /home/pi/Mac/Basilisk/config_small.cfg
  clear
}

startMiniV_scaled ()
{
# This was very odd and the mouse randomly moved, so removed as a option
  cp -f /home/pi/Mac/MinivMac_Scaled/xstartup /home/pi/.vnc/
  tightvncserver -geometry 640x480 -depth 16
  startx /home/pi/Mac/startVNC.sh
  clear
}

startMiniV ()
{
  startx /home/pi/Mac/MinivMac/minivmac -r /home/pi/Mac/Shared/Mac-IIcx.ROM /home/pi/Mac/Shared/mac.hfv
  clear
}

#Start General Task
pkill vnc
echo "Starting default emulator (Basilisk II) press any key to change"
echo "Starting in 1 seconds"
read -n 1 -t 1 option
if [ $? != 0 ]; then
        echo "Starting Default"
	startBasilisk
fi

#clear
while true
do

echo "1. Basilisk II (640x480)"
echo "2. Basilisk II (480x320)"
#echo "3. Mini VMac (640x480)"
echo "3. Mini vMac (480x320)"
echo "9. Exit to terminal"
echo ""

read -p "Select a option:" option
if [ "$option" == "1" ]; then
	startBasilisk
elif [ "$option"  == "2" ]; then
	startBasilisk_no
elif [ "$option"  == "3" ]; then
	startMiniV
elif [ "$option"  == "9" ]; then
	exit
else
	clear
	echo "Invalid Option"
fi

done
