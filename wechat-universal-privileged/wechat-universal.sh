#!/bin/bash
env_add() {
  BWRAP_ENV_APPEND+=(--setenv "$1" "$2")
}
BWRAP_ENV_APPEND=()

BWRAP_ARGS=(
  --die-with-parent
  # grant full access
  --dev-bind / /

  # license fixups in various places
  --ro-bind {/usr/share/wechat-universal,}/usr/lib/license
  # --ro-bind {/usr/share/wechat-universal,}/var/
  --ro-bind {/usr/share/wechat-universal,}/etc/lsb-release
)

exec bwrap "${BWRAP_ARGS[@]}" "${BWRAP_ENV_APPEND[@]}" /opt/wechat-universal/wechat "$@"
