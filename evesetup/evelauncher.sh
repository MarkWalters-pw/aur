#!/bin/sh

set -e

ELVER=""
EVEDIR="$HOME/.local/lib/EVE"
SETUPDIR=""
LAUNCHER="$EVEDIR/Launcher"
WINEPATH="/usr/bin"

. ./evesetup.shlib

check_env
check_elv
check_wine
check_steam

export DXVK_LOG_LEVEL=${DXVK_LOG_LEVEL:-error}

cd $EVEDIR
exec $LAUNCHER/evelauncher.sh
