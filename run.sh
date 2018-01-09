#!/bin/bash -e

# Move to application folder first
cd ${APP_FOLDER}

echo "==> Printing env"
env > a
source a

case "$1" in
  start)
    npm start
    exit $?
    ;;
  stop)
    npm stop
    exit $?
    ;;
  restart|force-reload|reload)
    npm restart
    exit $?
    ;;
  init)
    if [[ ! -f .initialized ]]; then
      echo "==> Aplication not initialized. Initializing now ..."
      npm install
      touch .initialized

      sed -i 's/process\.env\.DATABASE_PORT/${APP_PASSWORD}/g' config/database.js
    else
      echo "==> Aplication already initialized. Skipping ..."
    fi
esac
