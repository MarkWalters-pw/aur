# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
# Based on fix by eplightning: https://github.com/mudkipme/awesome-minisforum-v3/issues/2#issuecomment-2279282784

pkgname=minisforum-v3-accelerometer
pkgver=1.0.0
pkgrel=3
pkgdesc="Set correct mount matrix for accelerometer using udev hwdb entry"
arch=('x86_64')
url='https://github.com/trijpstra-fourlights/minisforum-v3-accelerometer'
license=('MIT')
depends=('iio-sensor-proxy' 'udev')
optdepends=('minisforum-v3-dsdt: Use patched DSDT to support Minisforum V3 accelerometer')

source=('61-sensor-minisforum-v3.hwdb')
sha256sums=('5b8011b3417f552b4d84456368ca76086006347587d9ac8f7a7796ddee646026')

package() {
    install -Dm644 "$srcdir/61-sensor-minisforum-v3.hwdb" "$pkgdir/usr/lib/udev/hwdb.d/61-sensor-minisforum-v3.hwdb"
}
