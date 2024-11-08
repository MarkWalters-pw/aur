# Maintainer: Laura Demkowicz-Duffy <dev[at]demkowiczduffy.co.uk>
pkgname=zigup-bin
_pkgname=zigup
pkgver=v2024_05_05
pkgrel=2
pkgdesc="Download and manage zig compilers"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/marler8997/zigup"
license=('MIT-0')
provides=('zigup' 'zig')
conflicts=('zigup' 'zig')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$url/releases/download/$pkgver/zigup-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/zigup-aarch64-linux.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/zigup-arm-linux.tar.gz")
sha256sums=('36bea57e38b7106e61095ff8625d44e0ff0821f79c0c485b36d231787b08b9a4')
sha256sums_x86_64=('9d3c0784474fed0778f453691f92dc9d075b653e3b8efed2f5da14d346e36ba8')
sha256sums_aarch64=('f9e724488f58223ee19472a009d219b305d1e13f6db03a935a4eb4ee7f6954ba')
sha256sums_armv7h=('d642e99e0e7657c4ceaa9cfb179a94dadfade25666e62b819f1a50720456ae79')

package() {
    install -Dm 0755 $_pkgname $pkgdir/usr/bin/$_pkgname

    cd "$_pkgname-$(echo $pkgver | sed 's/^v//')"
    install -Dm 0644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
