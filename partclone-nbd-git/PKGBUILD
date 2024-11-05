# Maintainer: Nazmul Hossain <nazmulridoy399@gmail.com>
# from: git
pkgname=partclone-nbd-git
pkgver=r59.7bb76d5
pkgrel=1
pkgdesc="Export partclone/clonezilla images as block devices without restoring them"
arch=('x86_64')
license=('MIT')
url="https://github.com/allvpv/partclone-nbd"
depends=('glibc')
makedepends=('git' 'cmake')
provides=('partclone-nbd')
conflicts=('partclone-nbd')
options=(!debug !strip)
source=("git+$url.git")
sha256sums=('SKIP')
optdepends=('partclone: for creating compatible disk images'
            'clonezilla: for creating compatible disk images')

pkgver()
{
    cd "$srcdir/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/partclone-nbd"
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON
    cmake --build build
}

package() {
    cd "$srcdir/partclone-nbd/build"
    make DESTDIR="$pkgdir/" install

    # Install license
    install -Dm644 "$srcdir/partclone-nbd/LICENSE" "$pkgdir/usr/share/licenses/partclone-nbd/LICENSE"
}

