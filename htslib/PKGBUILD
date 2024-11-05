# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Christopher Vittal ("viralstitch") <chris@vittal.dev>

pkgname=htslib
pkgver=1.21
pkgrel=1
pkgdesc='A C library for high-throughput sequencing data formats'
arch=('x86_64')
url="https://github.com/samtools/${pkgname}"
license=('MIT')
depends=('bzip2' 'curl' 'xz' 'zlib' 'openssl' 'glibc')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('84b510e735f4963641f26fd88c8abdee81ff4cb62168310ae716636aac0f1823')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-libcurl \
    --enable-plugins \
    --with-plugin-dir=/usr/lib/htslib/plugins

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # htslib shared library comes installed as 0644
  chmod +x ${pkgdir}/usr/lib/libhts.so.*.*
}
