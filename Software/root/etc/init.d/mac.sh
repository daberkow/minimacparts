#!/bin/bash
# chkconfig: 2345 20 80
# description: Start mini mac script

start() {
    su pi /home/pi/Mac/start.sh
}

stop() {
    exit
}

case "$1" in
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0