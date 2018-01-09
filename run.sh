#!/bin/bash -e

echo "==> Printing env"
env

. /bitnami/.env

echo "==> Printing env"
env

# Move to application folder first
cd ${APP_FOLDER}

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

      # Use env vars
      sed -i "s/process\.env\.DATABASE_PASSWORD/\"${APP_PASSWORD}\"/g" config/database.js
    else
      echo "==> Aplication already initialized. Skipping ..."
    fi
esac
