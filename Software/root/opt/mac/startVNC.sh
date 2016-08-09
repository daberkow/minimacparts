#!/bin/bash
ssvncviewer -rawlocal -encodings raw -quality 9 -depth 16 -compresslevel 0 -x11cursor -fullscreen -scale 480x320 -passwd /home/pi/.vnc/passwd localhost:1
