# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.2.3
pkgrel=3
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'bluez-obex' 'dbus')
optdepends=('networkmanager: For PANU networking'
            'modemmanager: For DUN networking'
	    'pulseaudio: For switching device audio profiles')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_aarch64=("b95095b695576865880bb6c24a47255d3990a7e12bfa5ac69c2c704e008b9863")
sha256sums_arm=("a767da55dd59481b367d9326dd190fc17ec8af3ed0a08c75829447870703c192")
sha256sums_armv6h=("7bf20b864fc433bc8b36fae0e07ba934ed45d773a3def69d3c746b2ba2dde165")
sha256sums_armv7h=("1badd9ad1331ee76d192b20350b64933a039d7889530cd082fc7e2abb5a73117")
sha256sums_i686=("f379c9bafde2f6c9530938e96d98dc51437ae4237ab6c77102e71db6517b6bc5")
sha256sums_x86_64=("b9baadee9ab0cf777df454c80cf3d73b5ba0720dfcb619163b1f7f9ac03ebd8c")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
