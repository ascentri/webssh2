#!/bin/bash

if [[ $1 ]];then
  action=$1
else
  echo "Usage: $(basename $0) start|stop|restart|status"
  exit 1
fi

case $action in
  start)
    echo "Starting datawarehouse api."
    ;;
  stop)
    echo "Stopping datawarehouse api."
    ;;
  restart)
    echo "Restarting datawarehouse api."
    ;;
  status)
    echo "Checking process status.";
    ;;
  *)
    echo "Invalid action: $action"
    exit 2
    ;;
esac

/superset/webssh2/app/node_modules/pm2/bin/pm2 -l webshell.log $action /superset/webssh2/app/index.js
