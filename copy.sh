#!/usr/bin/env bash

if [ -z ${INPUT_EXCLUDE+x} ]; then 
  rsync -arv --exclude=.git $INPUT_LOCAL/* /mnt/webdrive/ && rsync -rv --exclude=.git $INPUT_LOCAL/.[^.]* /mnt/webdrive/
else 
  if [[ "$(declare -p $INPUT_EXCLUDE)" =~ "declare -a" ]]; then
    rsync -arv --exclude="'$INPUT_EXCLUDE[*]'" $INPUT_LOCAL/* /mnt/webdrive/ && rsync -arv --exclude="'$INPUT_EXCLUDE[*]'" $INPUT_LOCAL/.[^.]* /mnt/webdrive/
  else
    rsync -arv --exclude=$INPUT_EXCLUDE $INPUT_LOCAL/* /mnt/webdrive/ && rsync -arv --exclude=$INPUT_EXCLUDE[*] $INPUT_LOCAL/.[^.]* /mnt/webdrive/
  fi 
fi

