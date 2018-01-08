#!/bin/bash -e

echo "==> Printing env"
env

if [[ ! -f /.initialized ]]; then
    echo "==> Aplication not initialized. Initializing now ..."
    cd /app
    npm install
    touch /.initialized
else
    echo "==> Aplication already initialized. Skipping ..."
fi

npm start
