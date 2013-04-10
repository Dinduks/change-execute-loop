change-execute-loop () {
  if [ "`uname`" = "Darwin" ]; then
    checker="ls -lRT $1"
  else
    checker="ls -lR --full-time $1"
  fi

  if [[ "`echo $SHELL`" =~ "zsh" ]]; then
    command="$@[2,$#]"
  elif [[ "`echo $SHELL`" =~ "bash" ]]; then
    command="${@: 2:$#}"
  else
    echo "Shell not supported. The script may not work correctly."
    command="${@: 2:$#}"
  fi

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
}

cel () { change-execute-loop $@; }
