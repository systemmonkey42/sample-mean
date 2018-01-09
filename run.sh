#!/bin/bash -e

# Load deployment environment
. /bitnami/.env

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
    else
      echo "==> Aplication already initialized. Skipping ..."
    fi
esac
