# Maintainer: bkuri <aur+nzbget-git@bkuri.com>
# Contributor: selfdenial <selfdenial@pm.me>
# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-git
pkgver=24.4.r2518.93f50605
pkgrel=1
pkgdesc="Download from Usenet using .nzb files (testing release)"

arch=('x86_64')
install=nzbget.install
license=('GPL')
options=('!strip' 'debug')
url="https://github.com/nzbgetcom/nzbget"

depends=('libxml2' 'openssl')
makedepends=('cmake' 'boost' 'git')
optdepends=('python: run scripts'
            'unrar: unpacking archives'
            'p7zip: unpacking archives')

conflicts=('nzbget' 'nzbget-systemd')
provides=('nzbget' 'nzbget-systemd')

source=("$pkgname::git+https://github.com/nzbgetcom/nzbget.git#branch=develop"
        "nzbget.service")

sha256sums=('SKIP'
            'e92d2d09e56930475c9f28641a3326a17aa187834e1bd6328a65b6ed7cc25e99')

build() {
  cd "${srcdir}/${pkgname}/build"

  # Configure the build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -Wno-dev \
    -DCMAKE_POLICY_DEFAULT_CMP0167=NEW

  # Build the project
  cmake --build . -j $(nproc)
}

package() {
  # Install built files
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="$pkgdir" cmake --install .
  
  # Install systemd service file
  install -Dm644 "${srcdir}/nzbget.service" "${pkgdir}/usr/lib/systemd/system/nzbget.service"
  
  # Create necessary directories
  install -dm 755 "${pkgdir}/var/lib/nzbget"
  install -dm 755 "${pkgdir}/usr/share/nzbget"
  
  # Install additional files
  cd "${srcdir}/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/nzbget/README.md"
  install -Dm 644 nzbget.conf "${pkgdir}/usr/share/nzbget/nzbget.conf"

  # Strip binary (makepkg handles debug symbols on its own)
  cd "$pkgdir/usr/bin"
  if [[ -f nzbget && "$(file -bi nzbget)" == *"application/x-executable"* ]]; then
    strip --strip-unneeded nzbget
  fi
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  
  # Extract version from CMakeLists.txt
  local _pkgver=$(grep -oP 'set\(VERSION "\K[^"]+' CMakeLists.txt)
  
  # Get commit count and short hash
  local _rev=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short HEAD)
  
  # Construct and print version string
  printf "%s.r%s.%s" "${_pkgver}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  
  # Ensure build directory exists
  mkdir -p build
}
