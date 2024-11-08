# wxc

This is part of an attempt to modernise Haskell's wxWidgets libraries. See [here](https://github.com/wxHaskell/wxHaskell/pull/40) for context.

This packages the Haskell-agnostic `wxc` library for Arch Linux, so that `wxHaskell` can then be installed.

## Developing

Remember we always need to run `makepkg --printsrcinfo > .SRCINFO` upon making any changes to `PKGBUILD`, before committing.

Deploy with `git push aur main:master` (assuming we have once run `git remote add aur ssh://aur@aur.archlinux.org/wxc.git`).
