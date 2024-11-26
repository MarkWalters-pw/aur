# Maintainer: Marco "marcs" Pompili <aur@odd.red>

pkgname=pkcrack
pkgver=1.2.3
pkgrel=1
pkgdesc="An algorithm for breaking the PkZip cipher that was devised by Eli Biham and Paul Kocher."
arch=('i686' 'x86_64')
url="https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html"
license=('custom')
conflicts=('libextractor')
depends=('glibc')
source=("https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack/pkcrack-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('8f49fa387962a37a14c9abd549016721a634251105bf4b837cc72f0bad413d38'
            '12b5054963697d11082597453457ef9bac93435a4cee79ebb09511e1566c5e43')
install=pkcrack.install

build() {
  cd ${pkgname}-${pkgver}/src
  make
}

package() {
  # license
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # bin
  cd ${pkgname}-${pkgver}
  install -Dm755 src/extract ${pkgdir}/usr/bin/extract
  install -Dm755 src/findkey ${pkgdir}/usr/bin/findkey
  install -Dm755 src/makekey ${pkgdir}/usr/bin/makekey
  install -Dm755 src/pkcrack ${pkgdir}/usr/bin/pkcrack
  install -Dm755 src/zipdecrypt ${pkgdir}/usr/bin/zipdecrypt

  # doc
  install -d ${pkgdir}/usr/share/doc
  cp -R doc ${pkgdir}/usr/share/doc/pkcrack
}
