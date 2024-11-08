# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
# Based on fix by eplightning: https://github.com/mudkipme/awesome-minisforum-v3/issues/2#issuecomment-2279282784

pkgname=minisforum-v3-dsdt
pkgver=1.0.0
pkgrel=2
pkgdesc="Patch ACPI DSDT to support Minisforum v3 accelerometer"
arch=('any')
url='https://github.com/trijpstra-fourlights/minisforum-v3-dsdt'
license=('MIT')
makedepends=('iasl')
depends=('mkinitcpio')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: As root, dump the current DSDT: \n sudo cat /sys/firmware/acpi/tables/DSDT | tee dsdt.dat')
source=('manual://dsdt.dat' 'fix-dsdt.patch')
sha256sums=('e1f9721a12205c20676b8ed45670dc03f61bac420955f28aa678d09e08dfbe6f'
            'fa87dc5e0121209c22a113717c5ea6e2e8cca24545915334d40d7986f802c523')

install='dsdt.install'

prepare() {
    cd "$srcdir"
    iasl -d -ve "dsdt.dat"
    patch -i "fix-dsdt.patch"
    iasl -tc -ve "dsdt.dsl"
}

package() {
    install -Dm644 "$srcdir/dsdt.aml" "$pkgdir/etc/initcpio/acpi_override/minisforum_v3_dsdt.aml"
}
