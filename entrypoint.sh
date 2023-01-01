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
  rclone -v sync $INPUT_LOCAL woocart:$INPUT_REMOTE --exclude-from=/rclone-filters.txt

else 
  if [[ "$(declare -p $INPUT_EXCLUDE)" =~ "declare -a" ]]; then
    rclone -v sync --exclude "'$INPUT_EXCLUDE[*]'" woocart:$INPUT_REMOTE
  else
    rclone -v sync --exclude $INPUT_EXCLUDE $INPUT_LOCAL woocart:$INPUT_REMOTE
  fi 
fi
