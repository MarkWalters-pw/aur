# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=2.10.0
pkgrel=1

arch=(any)

url="https://github.com/iBotPeaches/Apktool"
license=("Apache-2.0")

depends=("java-runtime>=8")

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar" 
        "apktool")
sha256sums=("c0350abbab5314248dfe2ee0c907def4edd14f6faef1f5d372d3d4abd28f0431"
            "48a5c9d664c88c8beac4a85461e84437d104a42dac6334322a3bafca12b63bae")

noextract=("apktool_${pkgver}.jar")

package() {
    # copy the main .jar file
    install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

    # copy the executable script
    install -Dm755 apktool "${pkgdir}/usr/bin/apktool"
}