#!/usr/bin/env bash

set -e

echo "Updating .SRCINFO ..."
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO
