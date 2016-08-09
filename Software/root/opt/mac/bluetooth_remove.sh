#!/bin/bash

sudo bluez-test-device list

echo "Type hardware ID to remove"

read hardware

sudo bluez-test-device remove $hardware
