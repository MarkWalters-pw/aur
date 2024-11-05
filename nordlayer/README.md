# [Nordlayer](https://nordlayer.com) VPN package for Linux (esp [ArchLinux](https://archlinux.org/))

[![AUR version](https://img.shields.io/aur/version/nordlayer)](https://aur.archlinux.org/packages/nordlayer) [![Nordlayer version](https://img.shields.io/badge/nordlayer-3.2.2-green)](https://nordlayer.com/download/linux/)

### Hotfix (Version 3.2.2) released by Nordlayer

The new version should not break `nordlayer.db`

If you're still facing issues afterwards - repeat 2.6.4 version fix

```sh
rm /var/lib/nordlayer/nordlayer.db
systemctl restart nordlayer
nordlayer login
```

### Important

If you run into any errors feel free to create an [issue](https://github.com/raverecursion/nordlayer-latest/issues/new) or leave a comment [in AUR](https://aur.archlinux.org/packages/nordlayer-bin)

To check latest official [nordlayer](https://nordlayer.com) version:

```sh
curl https://downloads.nordlayer.com/linux/latest/version -w "\n"
```

---

### Installing Nordlayer from AUR:

```sh
yay -S nordlayer-bin
```

### Building the package manually:

```sh
git clone https://github.com/raverecursion/nordlayer-latest.git
cd nordlayer-latest
makepkg -si
# If 'makepkg -si' fails to install automatically:
sudo pacman -U nordlayer-bin-3.2.2-1-x86_64.pkg.tar.zst
```

### Connection Error fix:

```
sudo usermod -a -G nordlayer $(whoami)
sudo setcap 'CAP_NET_ADMIN=+eip' /usr/libexec/nordlayer/nordlayer-charon
sudo setcap 'CAP_NET_ADMIN=+eip' /usr/libexec/nordlayer/nordlayer-ip
sudo setcap 'CAP_NET_ADMIN=+eip' /usr/libexec/nordlayer/nordlayer-openvpn
sudo setcap 'CAP_NET_ADMIN+eip CAP_DAC_OVERRIDE+eip CAP_SETUID+eip' /usr/libexec/nordlayer/nordlayer-resolvconf
sudo setcap 'CAP_NET_ADMIN=+eip' /usr/libexec/nordlayer/nordlayer-setcap
sudo setcap 'CAP_NET_ADMIN=+eip' /usr/bin/nordlayer
```

Remember to reboot after changes.
