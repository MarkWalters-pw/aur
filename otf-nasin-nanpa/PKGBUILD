# Submitter: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Maintainer: aik2 <aik2mlj -AT- gmail -DOT- com>

pkgname=('otf-nasin-nanpa')
pkgver=4.0.1
pkgrel=1
pkgdesc="A font for the sitelen pona writing system with UCSUR and ligature support"
url="https://github.com/ETBCOR/nasin-nanpa"
license=('MIT')
source=("$url/releases/download/n${pkgver}/nasin-nanpa-${pkgver}.otf"
  "$url/releases/download/n${pkgver}/nasin-nanpa-${pkgver}-UCSUR.otf"
  "$url/releases/download/n${pkgver}/nasin-nanpa-${pkgver}-Helvetica.otf"
  "$url/raw/n${pkgver}/LICENSE")
sha256sums=('5216eff1aaa81522b74782303433f709b17df507454304443ba2fca213c937fa'
            '126bd7c4e06174ca389044ba29970eaedad570d0621c35e64aa27b31c37d4f06'
            'b0d53f161732d29b4f537dcddad519189011bd9c85660b8c6b9724dae3dd5774'
            '2bb13a795d1d7f6df0288e228f29e4250e6a0e9b11f90044a737cc024002d6ab')
arch=('any')

package() {
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install font
  install -Dm644 -T nasin-nanpa-${pkgver}.otf "${pkgdir}/usr/share/fonts/OTF/nasin-nanpa.otf"
  install -Dm644 -T nasin-nanpa-${pkgver}-UCSUR.otf "${pkgdir}/usr/share/fonts/OTF/nasin-nanpa-UCSUR.otf"
  install -Dm644 -T nasin-nanpa-${pkgver}-Helvetica.otf "${pkgdir}/usr/share/fonts/OTF/nasin-nanpa-Helvetica.otf"
}
