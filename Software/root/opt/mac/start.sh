#!/bin/bash

startBasilisk ()
{
  cp -f /opt/mac/Basilisk/xstartup /home/pi/.vnc/
  tightvncserver -geometry 640x480 -depth 16
  startx /opt/mac/startVNC.sh
  clear
}

startBasilisk_no ()
{
  startx "/opt/mac/Basilisk/BasiliskII" --config /opt/mac/Basilisk/config_small.cfg
  clear
}

startMiniV_scaled ()
{
# This was very odd and the mouse randomly moved, so removed as a option
  cp -f /opt/mac/MinivMac_Scaled/xstartup /home/pi/.vnc/
  tightvncserver -geometry 640x480 -depth 16
  startx /opt/mac/startVNC.sh
  clear
}

startMiniV ()
{
  startx /opt/mac/MinivMac/minivmac -r /opt/mac/Shared/Mac-IIcx.ROM /opt/mac/Shared/mac.hfv
  clear
}

#Start General Task
pkill vnc
echo "Starting default emulator (Basilisk II) press any key to change"
echo "Starting in 1 seconds"
read -n 1 -t 1 option
if [ $? != 0 ]; then
        echo "Starting Default"
	startBasilisk_no
fi

clear
while true
do

echo "1. Basilisk II (640x480)"
echo "2. Basilisk II (480x320)"
#echo "3. Mini VMac (640x480)"
echo "3. Mini vMac (480x320)"
echo "4. StartX (480x320)"
echo "5. Start SSH Server"
echo "6. Pair Bluetooth"
echo "7. Remove Bluetooth"
echo "8. Shutdown"
echo "9. Exit to terminal"
echo ""

read -p "Select a option:" option
if [ "$option" == "1" ]; then
	startBasilisk
elif [ "$option"  == "2" ]; then
	startBasilisk_no
elif [ "$option"  == "3" ]; then
	startMiniV
elif [ "$option"  == "4" ]; then
	startx
elif [ "$option"  == "5" ]; then
	sudo service ssh start
	ifconfig
	echo "Press any key to continue..."
	read pause
elif [ "$option"  == "6" ]; then
	sudo /opt/mac/bluetooth.sh
elif [ "$option"  == "7" ]; then
	sudo /opt/mac/bluetooth_remove.sh
elif [ "$option"  == "8" ]; then
	sudo halt
elif [ "$option"  == "9" ]; then
	exit
else
	clear
	echo "Invalid Option"
fi

done
