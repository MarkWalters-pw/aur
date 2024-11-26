# Maintainer: Tuxx <tuxx@danktank.nl>
# Contributor: Tuxx <tuxx@danktank.nl>
pkgname=wallock-git
pkgver=r41.6bf9f5e
pkgrel=1
pkgdesc="wallock is a wallpaper and lock screen that enables macos like lock screens and wallapers on wayland. It is designed to work with wlroots based wayland compositors (sway, hyprland, etc..)."
arch=(any)
url="https://github.com/dpayne/wallock"
license=('MIT')
groups=()
depends=('libdrm' 'otf-firamono-nerd' 'ttf-firacode-nerd' 'cairo' 'wayland' 'mpv' 'mesa')
makedepends=('git' 'base-devel' 'cmake' 'libxkbcommon' 'egl-wayland' 'wayland-protocols')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=('!debug')
install=
source=(git+"https://github.com/dpayne/wallock")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_BUILD_TYPE=Release -B build
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build 
}
