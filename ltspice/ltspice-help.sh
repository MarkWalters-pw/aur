#!/bin/sh
export WINEPREFIX=$HOME/.ltspice/env WINEARCH=win64
wine hh /usr/share/doc/ltspice/ltspice.chm "$@"
