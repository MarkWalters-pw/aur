#!/bin/sh
DOTNET_CLI_TELEMETRY_OPTOUT="1" exec dotnet /opt/fluxis/fluXis.dll "$@"
