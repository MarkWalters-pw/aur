#!/bin/bash
set -o pipefail
_RUNNAME=/usr/bin/@runname@
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec "${_RUNNAME}" "$@" || exit $?