#!/bin/bash -e

# Load deployment environment
. /bitnami/.env

# Move to application folder first
cd ${APP_FOLDER}

case "$1" in
  start)
    npm start &
    exit $?
    ;;
  stop)
    npm stop &
    exit $?
    ;;
  restart|force-reload|reload)
    npm restart &
    exit $?
    ;;
  init)
    if [[ ! -f .initialized ]]; then
      echo "==> Aplication not initialized. Initializing now ..."

      # Install node modules
      npm install

      # Move static files to mount point
      mkdir -p ${DATA_FOLDER}
      mv public ${DATA_FOLDER}
      ln -sf ${DATA_FOLDER}/public public

      # Touch semaphore
      touch .initialized
    else
      echo "==> Aplication already initialized. Skipping ..."
    fi
esac
