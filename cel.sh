#!/bin/sh

if [ "`uname`" = "Darwin" ]; then
  checker="ls -lRT $1"
else
  checker="ls -lR --full-time $1"
fi

command="${@: 2:$#}"
checksum=`eval $checker`
watched_file=$1

# Execute the specified command the first time the script's called
eval $command

while true; do
  if [ "$checksum" != "`eval $checker`" ]; then
    checksum="`eval $checker`"
    eval $command
  fi

  # Wait 100 ms before each loop avoiding waking up your CPU fans
  sleep 0.1;
done
