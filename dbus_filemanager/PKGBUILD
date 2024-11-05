# Maintainer: Jan Kocka <kockahonza@gmail.com>
pkgname=dbus_filemanager
pkgver=1
pkgrel=1
pkgdesc="Simple, customizable python dbus daemon implementing FileManager1"
arch=(any)
url=""
license=("GPL")
depends=("python" "python-gobject" "python-dbus" "python-systemd" "python-pyxdg")
source=("org.${pkgname}.FileManager1.service" "${pkgname}")
sha256sums=('2f4c930d72991d50c8fec4e7cfa2502d396f9e6918ef10651f3482379c4ef62b'
            '7fc757f9bb455743ca7f73d416e9217268790a933551ec065e0fae92a1a76034')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/dbus-1/services"
    cp "${srcdir}/org.${pkgname}.FileManager1.service" "${pkgdir}/usr/share/dbus-1/services"
}
