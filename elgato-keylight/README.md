# Elgato Key Light Controller (AUR)

AUR package for [elgato-keylight](https://github.com/monadplus/elgato-keylight)

## Pacman packaging

First, install `devtools`. And, then run `$ pkgctl build` on the root. This will try building your package in a [clean chroot](https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot). Finally, update `.SRCINFO` `$ makepkg --printsrcinfo > .SRCINF`

- You can verify your `PKGBUILD` with:
  - `$ namcap PKGBUILD`
  - `$ shellcheck --shell=bash --exclude=SC2034,SC2154 PKGBUILD`
- You can verify your package with:
  - `$ namcap elgato-keylight-X.X.X-Y-x86_64.pkg.tar.zst`

### Hooks

```bash
cp update_srcinfo.sh .git/hooks/pre-commit
```
