# cd-memo
Enhanced cd that memorizes your working directory across sessions

## Functionality
Any newly opened shell instance will be right where you left off \
Additionally you can `cd --` to go to the last cd in all shell sessions

## Install
If you are using Arch Linux, an AUR package is available \
\
If you are using other distro, you can manually download and copy `cd-memo` and `cd-memo-init` to `/usr/bin` \
Alternatively you can run this in your terminal to automatically download & install using wget 
```
sudo wget 'https://raw.githubusercontent.com/BlackFuffey/cd-memo/refs/heads/main/cd-memo' -O '/usr/bin/cd-memo'
sudo wget 'https://raw.githubusercontent.com/BlackFuffey/cd-memo/refs/heads/main/cd-memo-init' -O '/usr/bin/cd-memo-init'
```

## Usage
Add `source /usr/bin/cd-memo-init` to your shell init \
\
For example:
- For bash, this will be `~/.bashrc`
- For zsh, this will be `~/.zshrc`
- For fish, this will be `~/.config/fish/config.fish`

## What shell am I using?
You can check by executing \
`echo $0`
