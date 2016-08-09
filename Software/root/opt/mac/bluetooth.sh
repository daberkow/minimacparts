#!/bin/bash

echo "Now we will scan for bluetooth names:"

hcitool scan

echo "Please type in the hardware address of the bluetooth device you want: "
read hardware

clear
echo "The system will now try to connect, if the device is a keyboard, enter '0000' in terminal, then hit that on the keyboard"

sudo bluez-simple-agent hci0 $hardware

clear
sudo bluez-test-device trusted $hardware yes
sudo bluez-test-input connect $hardware yes
