# Maintainer: Michael Engelhard <engelhard.michael+git@gmail.com>
pkgname=neolight
pkgver=1.3.0
pkgrel=1
pkgdesc='Additional layers for the german qwertz keyboard layout and others.'
arch=('any')
url='https://github.com/mihi314/neolight'
license=('GPL-3.0-or-later')
depends=('xkeyboard-config')
optdepends=('ibus: adds neolight to the ibus input methods')

_tag="v${pkgver}"
_repo_url='https://raw.githubusercontent.com/mihi314/neolight'

install='neolight.install'
# TODO: maybe release a tarball instead of specifying individual files here
source=("neolight_symbols-${pkgver}::${_repo_url}/${_tag}/linux/neolight_symbols"
        "neolight_types-${pkgver}::${_repo_url}/${_tag}/linux/neolight_types"
        "register-neolight.sh-${pkgver}::${_repo_url}/${_tag}/linux/register-neolight.sh"
        "register-neolight.hook")
md5sums=('0d6b93739f3f60b1729bfebf5152c67b'
         'ba64578baee9718f00f989cf8025ea0a'
         '8efb310e11a41762fc609f7750d37793'
         'c6e81d0589bab55863b25cbffbaebf09')

package() {
    install -Dm 644 "${srcdir}/neolight_symbols-${pkgver}" "${pkgdir}/usr/share/X11/xkb/symbols/neolight"
    install -Dm 644 "${srcdir}/neolight_types-${pkgver}" "${pkgdir}/usr/share/X11/xkb/types/neolight"
    install -Dm 755 "${srcdir}/register-neolight.sh-${pkgver}" "${pkgdir}/usr/share/libalpm/scripts/register-neolight.sh"
    install -Dm 644 "${srcdir}/register-neolight.hook" "${pkgdir}/usr/share/libalpm/hooks/register-neolight.hook"
}
