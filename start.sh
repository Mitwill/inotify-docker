#! /usr/bin/env sh
set -e

export DIR_PATH=${DIR_PATH:-"/mnt/watcher"}

echo "Initial sync"
aws s3 sync s3://$BUCKET_NAME $DIR_PATH

# Keep the container alive
echo "Sync complete. Keeping container alive for further use."
tail -f /dev/null

