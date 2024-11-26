# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A
# Contributor: puleiya <ninettristan@gmail.com>
pkgname=zedpro
pkgver=2024.2.b2
pkgrel=1
pkgdesc="Zed! Encrypted containers manager"
arch=("x86_64")
url="http://www.primx.eu"
license=("Prim'X")
depends=("libxslt" "qt5-base" "hicolor-icon-theme" "libldap-2.5")
makedepends=("unzip")
conflicts=("zedfree")
options=("!strip" "!emptydirs")
install=${pkgname}.install
source=("ZEDPRO-${pkgver}.Ubuntu.amd64.zip::https://www.zedencrypt.com/file/get/-/item_key/13802-25-299e76f8"
        "AdminPack.Ubuntu.2023.5.tar.gz::https://www.zedencrypt.com/file/get/-/item_key/13802-52-8bb9a063")
sha512sums=("74c702b85fb99314b281c6dc7798f57025c39f86b7c85a8028c6c6cd6f804f6a0ee51750346edeee2907a4280d0ef282e84c26ebf8b5d663bf768d923ea63938"
            "c995b2312446918f80b4d89e25fcce58c7425919f603733063494ad497c2867b75ae888e40a06778a37e141499624facf5b628632c58aad7a2a1f3d66ab02ed0")

build() {
    # Extract package data from Debian packages
    cd ${srcdir}
    ar -x Ubuntu\ 22.04/ZEDPRO-${pkgver%.b*}.Ubuntu22.04.amd64.deb
}

package() {
    # Extract package data
    tar -xf "${srcdir}"/data.tar.zst -C "${pkgdir}"
    install -m755 zedcmd ${pkgdir}/usr/bin
    install -m644 "ZEDPRO Configuration Guide EN.pdf" "${pkgdir}/usr/share/doc/zed_pro/en/ZEDPRO Configuration Guide.pdf"
    find "${pkgdir}" -type d -print0 | xargs -0 chmod 755
}
