# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
pkgname=cernbox
pkgver=5.2.1.13464
pkgrel=1
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('qtkeychain')
optdepends=('cernbox-nemo: Nemo integration')
provides=('ocsync' 'cernboxsync')

_repo='https://cernbox.cern.ch/cernbox/doc/Linux/repo/Fedora_39/'
source=(
    ${_repo}cernbox-client_${pkgver}.rpm
)
md5sums=('a1340d6d9765dbe8dcfbc4c54a9329b4')

package() {
    mkdir "${pkgdir}/opt"
    cp -dpr "${srcdir}/opt/cernbox-client.AppDir" "${pkgdir}/opt/"

    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/bin" "${pkgdir}/usr/"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
}
