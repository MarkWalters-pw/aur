# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com>

pkgname=furmark
pkgver=2.3.0.0
pkgrel=1
pkgdesc='Lightweight but intensive GPU stress test and benchmarking tool for OpenGL and Vulkan'
arch=('x86_64')
url='https://www.geeks3d.com/furmark/v2/'
license=('custom:freeware')
depends=(gcc-libs opengl-driver glu libxcb)
optdepends=('vulkan-driver: Vulkan benchmark support')
makedepends=('unzip')
source_x86_64=("https://gpumagick.com/downloads/files/2024/furmark2/FurMark_${pkgver}_linux64.zip")
source_aarch64=("https://gpumagick.com/downloads/files/2024/furmark2/FurMark_${pkgver}_rpi64.zip")
md5sums_x86_64=('c7e330a99104d4de52d567909f0dfc0b')
md5sums_aarch64=('509832867ad3dd0e003852b5df0c0390')

package(){
    cd $srcdir/FurMark_linux64

    install -d "$pkgdir/opt/$pkgname/"
    cp -a ./ "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/furmark" "$pkgdir/usr/bin/furmark"
    ln -s "/opt/$pkgname/FurMark_GUI" "$pkgdir/usr/bin/furmark-gui"

    install -Dm644 "./EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}
