# Maintainer: Mario Finelli <mario at finel dot li>

# Reverse engineered from:
# wget 'https://console.automox.com/downloadInstaller?accesskey=MYKEY' \
#   -O automox-installer.sh

pkgname=amagent
pkgver=1.43.142
pkgrel=1
arch=("x86_64")
pkgdesc="Automox agent"
url=https://www.automox.com
license=(custom)
depends=(curl dmidecode lsb-release lshw)
install=amagent.install
source=(file://${pkgname}_${pkgver}_amd64.deb fix-systemd-unit.patch)
sha256sums=('4d602c741eca4e0e41a7e7b203519f427c61349bdb2de55c10c7bff436a6b862'
            'ce29f4b5d2f22ada1f0354ba71a9014248e3837b5abc416146d1afcb07ad2665')

prepare() {
  mkdir "$srcdir/$pkgname"
  bsdtar xf "$srcdir/data.tar.xz" -C "$srcdir/$pkgname"
  patch "$srcdir/$pkgname/lib/systemd/system/amagent.service" \
    "$srcdir/fix-systemd-unit.patch"
}

package() {
  install -Dm0644 "$srcdir/$pkgname/usr/share/doc/amagent/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm0644 "$srcdir/$pkgname/lib/systemd/system/amagent.service" \
    "$pkgdir/usr/lib/systemd/system/amagent.service"

  install -dm0750 "$pkgdir/var/lib/amagent"

  install -Dm0755 "$srcdir/$pkgname/opt/amagent/amagent" \
    "$pkgdir/opt/amagent/amagent"
}

# vim: set ts=2 sw=2 et:
