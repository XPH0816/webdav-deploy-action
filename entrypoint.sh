#!/usr/bin/env bash
# Where are we going to mount the remote webdav resource in our container.

mkdir -p ~/.config/rclone/
echo "
[woocart]
type = webdav
pass = $(rclone obscure $INPUT_PASSWORD)
url = $INPUT_URL
user = $INPUT_USERNAME
vendor = other
" > ~/.config/rclone/rclone.conf

rclone -v sync $INPUT_LOCAL woocart:$INPUT_REMOTE --filter-from=/rclone-filters.txt
