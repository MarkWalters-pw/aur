# MW AUR

To use this repo you need the latest version of paru-bin and append the following to /etc/paru.conf
```
[mwaur]
URL = https://github.com/MarkWalters-dev/aur.git
```
Then install with: 
`paru -Sy --needed --noconfirm focalboard-server`

or

`paru -Sy --needed --noconfirm mwaur/focalboard-server`


The AUR has rate a daily rate limit of 4000 reqeusts. This repo is also an attempt to avoid rate limits.

