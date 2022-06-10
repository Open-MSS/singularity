#!/bin/bash

set -e


if [ "$1" = 'MSS' ]; then

    echo "initialize demodata and start services"
    echo ""
    mswms_demodata --seed
    export PYTHONPATH=~/mss:$PYTHONPATH
    mswms gallery --create
    mswms --port 8081  &
    sleep 3
    mscolab db --init ;  mscolab start &
    sleep 3
    mscolab start &
    sleep 3
    msui 
fi

if [ "$1" != 'MSS' ]; then
   exec "$@"
fi
