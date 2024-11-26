# Maintainer: Perkelo <alessandro [dot] scala [eight][at] gmail [dot] com>

pkgname=whatsapp-nativefier-nomaximize-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to make whatsapp-nativefier exit on close, instead of minimizing."
arch=("any")
install=whatsapp-nativefier-nomaximize-hook.install
license=("MIT")
depends=('whatsapp-nativefier')
source=(whatsapp-nativefier-nomaximize.hook whatsapp-nativefier-nomaximize whatsapp-nativefier-nomaximize.patch)
sha256sums=('37ac3df31c8c470962181de663c3e440f6359cebfc2b56d5d2e890349ff53c1d'
            'eed0ac57e7f099cbf9760d982c90b719c8f844c2cffb1e1a7c22a1adf82abf77'
            '0768dc9aeffa05e1dbca0fb7c8c5ed6b1f264a6aa3ff01c3d57c438c93472ddd')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/whatsapp-nativefier-nomaximize.hook" "${pkgdir}/usr/share/libalpm/hooks/whatsapp-nativefier-nomaximize.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/whatsapp-nativefier-nomaximize" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-nomaximize" 
    install -m755  "${srcdir}/whatsapp-nativefier-nomaximize.patch" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-nomaximize.patch" 
}
