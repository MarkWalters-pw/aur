# Deshader AUR package

To create Arch package, run 
```bash
makepkg
```

To install the package, run
```bash
sudo pacman -U deshader*
```

To create __debian__ package under Arch Linux and Docker, run
```bash
bash makedeb_arch.bash
```
It will build the package in a Docker container. To build for multiple Debian and Ubuntu versions ([supported by makedeb](https://docs.makedeb.org/installing/docker/)), use
```bash
releases="debian-bullseye debian-bookworm ubuntu-focal ubuntu-jammy ubuntu-noble ubuntu-oracular" bash makedeb_arch.bash
```

Or if you're on a Debian-based system, run
```bash
bash makedeb.bash
```