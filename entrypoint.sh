#!/usr/bin/env bash
# shellcheck disable=SC2001,SC2002,SC2034,SC1090,SC2154,SC1117

# Fail fast and fail hard.
set -Eeuo pipefail

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
  rclone -v sync $INPUT_LOCAL woocart:$INPUT_REMOTE 
else 
  if [[ "$(declare -p $INPUT_EXCLUDE)" =~ "declare -a" ]]; then
    rclone -v sync --exclude "'$INPUT_EXCLUDE[*]'" woocart:$INPUT_REMOTE
  else
    rclone -v sync $INPUT_LOCAL woocart:$INPUT_REMOTE --exclude "$INPUT_EXCLUDE"
  fi 
fi
