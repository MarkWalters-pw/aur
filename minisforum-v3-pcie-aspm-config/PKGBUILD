# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
# Based on work by https://github.com/JamiKettunen, see https://github.com/mudkipme/awesome-minisforum-v3/issues/5
pkgname=minisforum-v3-pcie-aspm-config
pkgver=1.0.0
pkgrel=1
pkgdesc="Configuration to apply active-state power management (ASPM) on supported devices on the Minisforum V3. Uses kernel cmdline option and udev rules"
arch=('any')
url="https://github.com/trijpstra-fourlights/minisforum-v3-pcie-aspm-config"
license=('MIT')
depends=('udev')
install="minisforum-v3-pcie-aspm-config.install"
source=("pcie-aspm.conf"
        "99-minisforum-v3-pcie-aspm.rules")
optdepends=("mkinitcpio-cmdline-pacman-hook: Automatically run mkinitcpio when cmdline params are modified by pacman")
sha256sums=('2c2956d29b58da3fa19866ee62af6a3904628ec84186f6deb87632d2a6579b1d'
            'da1cef838ef50f8b4163c5f46af78297edb3e1cff4e0ec77e10f293e02c812b7')

package() {
    install -Dm644 "$srcdir/pcie-aspm.conf" "$pkgdir/etc/cmdline.d/pcie-aspm.conf"
    install -Dm644 "$srcdir/99-minisforum-v3-pcie-aspm.rules" "$pkgdir/usr/lib/udev/rules.d/99-minisforum-v3-pcie-aspm.rules"
}

