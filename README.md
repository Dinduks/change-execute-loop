# What is it?
*change-execute-loop* is a minimal shell script that runs a specific command (or
several commands) whenever a given file or directory changes.

# Installation
Get *cel* and add it to your path.  
For example:

```shell
ln -s /path/to/cel /usr/local/bin
```

# Use
```shell
cel foo.c "gcc foo.c && ./a.out"
cel . cat file.txt
```

Notice using double quotes in the first example; without them, only `gcc foo.c`
will be executed.
