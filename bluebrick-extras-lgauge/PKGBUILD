# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname=bluebrick-extras-lgauge
pkgver=1.2
pkgrel=1
pkgdesc="BlueBrick Lego Layout Planer - L-Gauge Extra Parts"
arch=('any')
url="https://l-gauge.org/wiki/index.php/CAD_Tools"
license=('unknown')
depends=('bluebrick')
source=("http://l-gauge.org/downloads/SchematicRCv.1.2.zip"
        "http://l-gauge.org/downloads/Schematic9Vv.1.2.zip")
sha256sums=('bfecc1e16cf31a461c04f08b31e89585bc93f63aab2e3a9682c62d72f70a6979'
            '1e8c50cc581de7f30fb32fc0b8f8357eb41a6edcf70d0bff58632c50a8e2f714')

package() {
  local partsdir='/opt/bluebrick/parts/'

  install -Ddm757 "$pkgdir/$partsdir"

  # RC schematics
  install -d "$pkgdir/$partsdir/Schematic RC/"
  find "$srcdir" -maxdepth 1 -type f -name "*RC*" \
    -exec install -m 644 -D {} "$pkgdir/$partsdir/Schematic RC/" \;

  # 9V schematics
  install -d "$pkgdir/$partsdir/Schematic 9V/"
  find "$srcdir" -maxdepth 1 -type f -name "*9V*" \
    -exec install -m 644 -D {} "$pkgdir/$partsdir/Schematic 9V/" \;
}

