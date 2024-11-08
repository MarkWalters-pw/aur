# Maintainer: Bytesynapse <bytesynapse@proton.me>
pkgname='b15f-git'
pkgver='1.1'
pkgrel=1
pkgdesc="The library and software for interacting with the B15F board."
arch=('x86_64')
url="https://github.com/devfix/b15f"
license=('MIT')
depends=('avr-libc' 'avrdude' 'ncurses' 'gcc' 'astyle')
makedepends=('git' 'make')
install='b15f.install'
source=('b15f-git::git+https://github.com/devfix/b15f.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  
  echo "Configuring udev rules..."
  printf 'SUBSYSTEM!="usb_device", ACTION!="add", GOTO="avrisp_end"\n\nSUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666", OWNER="%s"\n\n# LABEL="avrisp_end"\n' "$USER" | sudo tee /etc/udev/rules.d/50-b15f.rules
  sudo udevadm control --reload-rules
  sudo udevadm trigger

  echo "Loading project data..."

  if [ ! -f "/etc/b15f.mcu" ]; then
    echo "atmega1284p" | sudo tee /etc/b15f.mcu
  fi

  mcu=$(cat /etc/b15f.mcu)
  
  # read -p "MCU (default: $mcu): " input_mcu
  # mcu=${input_mcu:-$mcu}
  # echo "$mcu" | tee /etc/b15f.mcu

  if ! [[ " atmega1284 atmega1284p " =~ " $mcu " ]]; then
    echo "Error: Invalid MCU specified. Please update /etc/b15f.mcu manually and re-run the installation."
    exit 1
  fi

  sed -i "s@\\s*MCU\\s*=\\s*atmega1284.*@MCU        = ${mcu} # set by /etc/b15f.mcu@g" "firmware/"?akefile

  echo 'Linking avr library to "correct" location...'
  sudo ln -sf "/usr/avr/" "/usr/lib/"

  # echo "Compiling firmware..."
  # cd "$srcdir/$pkgname/firmware"
  # sudo make clean
  # sudo make

  # echo "Uploading firmware to microcontroller..."
  # make upload || {
  #   echo "Error: Upload failed. Is B15 powered on?"
  #   exit 1
  # }

  echo "Compiling control software..."
  cd "$srcdir/$pkgname/control/src"
  make clean
  make CXXFLAGS="-I/usr/avr/include"
  sudo make

  echo "Installing control software..."
  sudo make install
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname"
  # if [ ! -d "/usr/share/$pkgname" ]; then
  #   sudo mkdir "/usr/share/$pkgname"
  # fi
  # sudo cp -r * "/usr/share/$pkgname"
}
