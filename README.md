# MW AUR

This is where I test out package updates before pushing to the AUR.  Currently I only help maintain apt and triehash. 

To use this repo append the following to /etc/paru.conf
```
[mwaur]
URL = https://github.com/MarkWalters-pw/aur.git
```
Then install with: 
`paru -Sy --needed --noconfirm focalboard-server`

or

`paru -Sy --needed --noconfirm mwaur/focalboard-server`
