# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: matthewbauer <mjbauer95+aur@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

_pkgname=xdg-utils
pkgname=$_pkgname-mimeo
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to use mimeo"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'file' 'xorg-xset' 'xorg-xprop') # xset + xprop needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'mimeo: for mimeo support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://gitlab.freedesktop.org/xdg/xdg-utils.git#tag=v$pkgver"
        mimeo-detection.patch)
sha256sums=('64cd656fcef8ad5391cb5bedb31873212962f932e35eaa6a01195c11529a308c'
            'fedbbee834c3cfe0078b869708310779767e168c8bbc74203dfebdbbf5b97f87')
#validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname #-$pkgver

  patch -p1 -i "${srcdir}"/mimeo-detection.patch
}

build() {
  cd $_pkgname #-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $_pkgname #-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir"/usr/share/desktop-directories
}
