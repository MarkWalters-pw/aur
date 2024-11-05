pkgname=dualsensectl
pkgver=0.5
pkgrel=1
pkgdesc='Tool for controlling Sony PlayStation 5 DualSense controller on Linux'
arch=('x86_64')
conflicts=('dualsensectl-git')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('dbus' 'hidapi')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nowrep/dualsensectl/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0d700293c72615fd0aeddc774be09844498d4ca530d9f49d45ce3137ffe7408490fc6efddf6ccaf91253e3d9c7a63b36ebce0680d449d1900bdfa276fa618206')

build() {
    make -C "$pkgname-$pkgver"
}

package() {
    make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

install() {
    $(CC) main.c -o $(TARGET) $(DEFINES) $(CFLAGS) $(LIBS)
    install -D -m 755 -p $(TARGET) $(DESTDIR)/usr/bin/$(TARGET)
    install -D -m 755 -p completion/$(TARGET) $(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)
    install -D -m 755 -p completion/_$(TARGET) $(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)
}
