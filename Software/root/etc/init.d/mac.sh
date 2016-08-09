#!/bin/bash
# chkconfig: 2345 20 80
# description: Start mini mac script

start() {
    su pi /opt/mac/start.sh
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
       echo "Usage: $0 {start|stop|restart}"
esac

exit 0
