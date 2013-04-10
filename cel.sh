change-execute-loop () {
  checker="ls -lRT $1"
  checksum=`eval $checker`
  command="${@: 2:$#}"
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

cel () { change-execute-loop $@ }
