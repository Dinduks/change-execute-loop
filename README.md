# What is it?
*change-execute-loop* is a minimal shell script that runs a specific command (or
several commands) whenever a given file or directory changes.

This program aims to be as simple as possible, and independent from any other software,
may it be an OS or a tool (such as inotify).

# Installation
Simply get the *cel* executable and add it to your path.

For example:

```shell
curl https://raw.githubusercontent.com/Dinduks/change-execute-loop/master/cel > ~/apps/cel
ln -s ~/apps/cel /usr/local/bin
```

# Use
```shell
cel foo.c "gcc foo.c && ./a.out"
cel . cat file.txt
```

Notice using double quotes in the first example; without them, only `gcc foo.c`
will be executed.
