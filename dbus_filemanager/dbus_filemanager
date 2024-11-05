#!/usr/bin/env python

import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib
from xdg.BaseDirectory import load_first_config
from systemd import journal

import os
from subprocess import Popen


class FmObject(dbus.service.Object):
    def __init__(self, command_args, *args, **kwargs):
        self.command_args = command_args
        super().__init__(*args, **kwargs)

    def open_file_manager(self, uris):
        args = self.command_args.copy()

        for uri in uris:
            path = str(uri)
            if path.startswith('file://'):
                args.append(path[7:])

        Popen(args)

    @dbus.service.method("org.freedesktop.FileManager1",
                         in_signature='ass', out_signature='')
    def ShowFolders(self, uris, startupId):
        self.open_file_manager(uris)

    @dbus.service.method("org.freedesktop.FileManager1",
                         in_signature='ass', out_signature='')
    def ShowItems(self, uris, startupId):
        self.open_file_manager(uris)

    @dbus.service.method("org.freedesktop.FileManager1",
                         in_signature='', out_signature='')
    def Exit(self):
        mainloop.quit()


if __name__ == '__main__':
    # Prep dbus stuff
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    session_bus = dbus.SessionBus()
    name = dbus.service.BusName("org.freedesktop.FileManager1", session_bus)

    # Figure out config
    config_dir = load_first_config('dbus_filemanager')
    command_args = []
    if config_dir is None:
        journal.send('Could not find command config file for dbus_filemanager')
    try:
        config = open(os.path.join(config_dir, 'command'))
        for line in config.readlines():
            command_args.append(line.strip())
    except FileNotFoundError:
        journal.send('Could not find command config file for dbus_filemanager')

    # Run
    fm_object = FmObject(command_args, session_bus,
                         '/org/freedesktop/FileManager1')
    mainloop = GLib.MainLoop()
    mainloop.run()
