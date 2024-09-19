#!/bin/bash

LOCKFILE=/tmp/sync.lock

if [ -e $LOCKFILE ]; then
    exit 0
fi

touch $LOCKFILE

echo "Syncing $DIR_PATH to s3://$BUCKET_NAME"
# Perform the sync with deletion on s3 bucket if file is not found on local
aws s3 sync $DIR_PATH s3://$BUCKET_NAME --delete

echo "Syncing complete"

rm -f $LOCKFILE

# Optional: sleep for a short period to prevent rapid triggering
sleep 1
