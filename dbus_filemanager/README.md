This is a simple daemon implementing the FileManager1 dbus interface that can
be easily customize to use any filemanager terminal or gui. It is based on the
snippet found here https://github.com/Senderman/ranger-dbus.

Setting up the file manager command (choosing which filemanager to use)
-----------------------------------------------------------------------
For this utility to work you will need to create a config directory named `dbus_filemanager` under `$XDG_CONFIG_HOME` and add a file named `command` in it.
This should be a text file which specifies which filemanager to use, for example this could be `thunar` or `dolphin` in the simplest cases.
What the script does is it will simply call this command and supply any files requested to be opened as arguments to it.
If the command that you want to run as a filemanager is more complex (as for example if you want to run a terminal file manager which requires a terminal to be opened first) you need to separate the parts/arguments of this command by newlines.
So for example if you want to run `ranger` in `konsole` as your filemanager the `command` file should look like
```
konsole
-e
ranger
```

Making sure dbus uses this script
---------------------------------
Finally, dbus may still use another service provided by some of your other packages.
These should be in `/usr/share/dbus-1/services/` and there may be many of them.
If you want to make sure this one is used copy the file `org.dbus_filemanager.FileManager1.service` to `~/.local/share/dbus-1/services` and make sure there are no other services implementing the `FileManager1.service` interface there.
Finally you also need to kill any processes/services that provide this interface that are already running, either manually or just by restarting.
