# Maintainer: Heyian <heyian.6huwa@aleeas.com>
_pkgname=hyprpicker
pkgname=$_pkgname-bin
pkgver=0.4.1
pkgrel=1
url="https://github.com/hyprwm/hyprpicker"
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=('x86_64')
license=('BSD-3-Clause')
depends=(
    'wayland'
    'libxkbcommon'
    'cairo'
    'wayland-protocols'
    'libjpeg'
    'hyprutils>=0.2.0'
    'hyprwayland-scanner>=0.4.0'
)
optdepends=('wl-clipboard: --autocopy')
provides=("$pkgname")
conflicts=("$_pkgname-git" "$pkgname")
source=(
    "v$pkgver.tar.gz::https://github.com/hyprwm/hyprpicker/releases/download/v$pkgver/v$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/hyprwm/hyprpicker/refs/heads/main/LICENSE"
    "hyprpicker.1::https://raw.githubusercontent.com/hyprwm/hyprpicker/refs/heads/main/doc/hyprpicker.1"
    "README.md::https://raw.githubusercontent.com/hyprwm/hyprpicker/refs/heads/main/README.md"
)
sha256sums=('02e3f6d491bde24308be844cc328045d7c12b947dd1da2dc6c041cb233e7f5ac'
            'ea36a60a50dfa150ca3c5816cb6b0ad5b559da380e9f5b2babd4abbf7962a35a'
            '1729492b6d9a5ed0e070ef5dc440aa4d68ffb17bc5cef928fb13e18d26f8813a'
            'b31535aee9069f48b0bfa21337d37568bb61c1bdfa404b3b5d08818741dd4fbf')

package() {
    cp LICENSE "$_pkgname"
    cp hyprpicker.1 "$_pkgname"
    cp README.md "$_pkgname"
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin"

    install -Dm755 hyprpicker "$pkgdir/usr/bin/hyprpicker"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 hyprpicker.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

