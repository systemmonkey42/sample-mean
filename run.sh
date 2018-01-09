#!/bin/bash -e

# Load deployment environment
. /bitnami/.env

# Move to application folder first
cd ${APP_FOLDER}

start () {
  npm start &
  ps x -o  "%p %r" | grep $! | awk '{print $2}' > ${APP_FOLDER}/app.pid
}

stop () {
  pid=$(cat ${APP_FOLDER}/app.pid)
  if [ -n "${pid}" ];
    kill -SIGTERM -- -${pid}
    rm ${APP_FOLDER}/app.pid
  fi
}

case "$1" in
  start)
    start
    exit $?
    ;;
  stop)
    stop
    exit $?
    ;;
  restart|force-reload|reload)
    stop
    start
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
