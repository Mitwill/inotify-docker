#! /usr/bin/env sh
set -e

export DIR_PATH=${DIR_PATH:-"/mnt/watcher"}

export INITIAL_SYNC=${INITIAL_SYNC:-false}


if [ $INITIAL_SYNC = "true" ]; then
    echo "Initial sync"
    aws s3 sync s3://$BUCKET_NAME $DIR_PATH --delete
    exit 0
fi

inotifywait -m -e CLOSE_WRITE,DELETE $DIR_PATH | xargs -n1 ./sync.sh


