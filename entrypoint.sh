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

if [ -z ${INPUT_EXCLUDE+x} ]; then 
  rclone sync $INPUT_LOCAL woocart:$INPUT_REMOTE --exclude-from=/rclone-filters.txt
else 
  if [[ "$(declare -p $INPUT_EXCLUDE)" =~ "declare -a" ]]; then
    rclone sync woocart:$INPUT_REMOTE --exclude "'$INPUT_EXCLUDE[*]'"
  else
    rclone sync $INPUT_LOCAL woocart:$INPUT_REMOTE --exclude $INPUT_EXCLUDE
  fi 
fi
