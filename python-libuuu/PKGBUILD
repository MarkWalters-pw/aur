# Maintainer: Maud Spierings <maud_spierings@hotmail.com>

pkgname=python-libuuu
pkgver=1.5.191
pkgrel=1
pkgdesc='A python wrapper for libuuu'
arch=('x86_64' 'aarch64')
url='https://github.com/nxp-imx/mfgtools'
license=(BSD-3-Clause)
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl' 'tinyxml2' 'python-setuptools-scm')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel')
changelog=History.md
source=(
	"git+$url#commit=6c2141e3e820c5a487482adcde5cf66266c07656" # 1.5.191
	"git+https://github.com/microsoft/vcpkg.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

build() {
	cd "${srcdir}"

	export VCPKG_ROOT="${srcdir}/vcpkg"
	$VCPKG_ROOT/bootstrap-vcpkg.sh -disableMetrics

	cd mfgtools/wrapper
	cmake \
		--preset unix \
		-B build \
		-DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
	cmake --build build
	mkdir -p libuuu/lib
	cp build/libuuu.so libuuu/lib
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/mfgtools/wrapper"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

