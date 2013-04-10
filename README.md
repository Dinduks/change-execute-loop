# What is it?
*change-execute-loop* is a minimal shell script that runs a specific command (or
several commands) whenever a given file or directory changes.

# Installation
```shell
source /path/to/cel/cel.sh
```

Add this line to your *.bashrc* or *.zshrc* for more inconvenience.

# Use
```shell
cel foo.c "gcc foo.c && ./a.out"
cel . cat file.txt
```

Notice using double quotes in the first example; without them, only `gcc foo.c`
will be executed.  
