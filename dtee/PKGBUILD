# Maintainer: Simon Arlott <arch@sa.me.uk>
pkgname=dtee
pkgver=1.1.1
pkgrel=1
pkgdesc="Run a program with standard output and standard error copied to files"
arch=('x86_64')
url="https://dtee.readthedocs.io/"
license=('GPL3')
depends=('boost-libs' 'libboost_program_options.so')
makedepends=('boost' 'meson' 'ninja' 'python-sphinx')
checkdepends=('bash' 'coreutils' 'diffutils' 'findutils')
options=('zipman' 'lto')
source=("https://dtee.bin.uuid.uk/source/${pkgname}-${pkgver}.tar.gz"
	"https://dtee.bin.uuid.uk/source/${pkgname}-${pkgver}.tar.gz.asc")
noextract=()
sha256sums=('f1de814533861b591c41945c2c728c029e5db2b25bfcb5366601f9cad52eb5f6'
            'SKIP')
validpgpkeys=('47849A12DAF9BD2AF5505FBB4FF886F318206BD9')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/arch
	GIT_DIR="${srcdir}/.git" meson setup --prefix /usr --buildtype=plain build/arch --unity on
	GIT_DIR="${srcdir}/.git" ninja -C build/arch
}

check() {
	cd "$pkgname-$pkgver"
	GIT_DIR="${srcdir}/.git" ninja -C build/arch test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" GIT_DIR="${srcdir}/.git" ninja -C build/arch install
}
