# MW AUR

This is where I test out package updates before pushing to the AUR.  Currently I only help maintain apt and triehash. I will also use it to override undermaintained packages and package configurations that I don't agree with.  All packages that end in -bin are hosted on my server which, in theory, should provide faster download speeds than github.

To use this repo append the following to /etc/paru.conf
```
[mwaur]
URL = https://github.com/MarkWalters-pw/aur.git
```

If a package has the same name in the official AUR and mwaur then paru will use the one in mwaur.
