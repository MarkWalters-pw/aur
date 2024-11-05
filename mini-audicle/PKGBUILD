# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mini-audicle
pkgver=1.5.3.0
pkgrel=1
pkgdesc='Integrated Development + Performance Environment for ChucK'
arch=('x86_64')
url="https://github.com/ccrma/miniAudicle"
license=('GPL')
groups=('multimedia' 'pro-audio')
depends=('qt6-base' 'qscintilla-qt6' 'libsndfile'
  # Uncomment one of the following three lines depending on the backend that you
  # want. Also uncomment the corresponding make target in build() below.
  # Default: PulseAudio
  #        'libpulse'
  #        'alsa-lib'
  'jack'
)
makedepends=('git')
optdepends=('chuck: for documentation and command line interface')
source=('git+https://github.com/ccrma/miniAudicle.git#tag=dfcd099abe99a597499d7bd9d42ae4bcdff0862d'
  'miniAudicle.desktop')
b2sums=('SKIP'
  '44219938670cd42953c2e948702adea3a33efd99c858638c0b0f824defede799937cc0c49459c10820b44d9fce56c2a071c893fef4b8b27c7e08b348be5c9d7d')

prepare() {
  cd miniAudicle/src
  git submodule update --init --recursive --depth=1
}

build() {
  cd miniAudicle/src
  export QMAKE=qmake6
  export QT_SELECT=qt6
  make linux-jack
  #		linux-pulse
  #		linux-alsa
}

package() {
  install -Dm644 miniAudicle.desktop "$pkgdir"/usr/share/applications/miniAudicle.desktop

  cd miniAudicle/src
  install -Dm755 miniAudicle "$pkgdir"/usr/bin/miniAudicle
  install -Dm644 qt/icon/miniAudicle.png "$pkgdir"/usr/share/pixmaps/miniAudicle.png
}
