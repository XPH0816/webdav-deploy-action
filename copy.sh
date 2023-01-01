#!/usr/bin/env bash

if [ -z ${INPUT_EXCLUDE+x} ]; then 
  rsync -arv --exclude=.git $INPUT_LOCAL/* ~/mnt/webdrive/$INPUT_REMOTE && rsync -rv --exclude=.git $INPUT_LOCAL/.[^.]* ~/mnt/webdrive/$INPUT_REMOTE
else 
  if [[ "$(declare -p $INPUT_EXCLUDE)" =~ "declare -a" ]]; then
    rsync -arv --exclude="'$INPUT_EXCLUDE[*]'" $INPUT_LOCAL/* ~/mnt/webdrive/$INPUT_REMOTE && rsync -arv --exclude="'$INPUT_EXCLUDE[*]'" $INPUT_LOCAL/.[^.]* ~/mnt/webdrive/$INPUT_REMOTE
  else
    rsync -arv --exclude=$INPUT_EXCLUDE $INPUT_LOCAL/* ~/mnt/webdrive/$INPUT_REMOTE && rsync -arv --exclude=$INPUT_EXCLUDE $INPUT_LOCAL/.[^.]* ~/mnt/webdrive/$INPUT_REMOTE
  fi 
fi

