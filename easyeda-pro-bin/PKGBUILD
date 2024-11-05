# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=easyeda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=2.2.32.3.1
pkgrel=1
pkgdesc="EasyEDA Professional Edition"
arch=('x86_64' 'aarch64')
url="https://pro.easyeda.com/"
license=('LicenseRef-EasyEDA-Proprietary')
depends=('gtk3' 'nss' 'alsa-lib')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-git $_pkgname-electron)
install=$pkgname.install
source=("LICENSE-$pkgver.html::https://easyeda.com/page/legal"
        "$pkgname.install")
source_x86_64=("$_pkgname-x86_64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-$pkgver.zip")
source_aarch64=("$_pkgname-aarch64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-arm64-$pkgver.zip")
sha256sums=('SKIP'
            'ab64abe7821e4ea37a0e4d1f77c94f37d6a51c7df2038ba7b609c640adf8e51d')
sha256sums_x86_64=('e5e2a51f9fee1aff98284e1bbb01f8a39bba441163f8a41d65e8f347cce28133')
sha256sums_aarch64=('9543db52cc5f6bf4e3cb5adb59cac430c406bd13f2e3001c4066461cc58a2551')

package() {
    cd $srcdir
    install -Dm644 LICENSE-$pkgver.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html

    cd $srcdir/$_pkgname
    install -Dm644 EasyEDA-Distribution-License.txt \
                   $pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt
    install -dm755 $pkgdir/opt/$_pkgname
    cp -dpr --no-preserve=ownership * $pkgdir/opt/$_pkgname
    rm -rf $pkgdir/opt/$_pkgname/icon
    rm -rf $pkgdir/opt/$_pkgname/easyeda-pro.dkt
    rm -rf $pkgdir/opt/$_pkgname/EasyEDA-Distribution-License.txt

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm644 icon/icon_${_icon}x${_icon}.png \
                       $pkgdir/usr/share/icons/hicolor/${_icon}x${_icon}/apps/$_pkgname.png
    done
    if [ -f icon/icon_512x512@2x.png ]; then
        install -Dm644 icon/icon_512x512@2x.png \
                       $pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png
    fi

    # desktop entry
    if [ -f easyeda-pro.dkt ]; then
        install -Dm644 easyeda-pro.dkt \
                       $pkgdir/usr/share/applications/$_pkgname.desktop

        sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
            $pkgdir/usr/share/applications/$_pkgname.desktop
        sed -i 's|/opt/easyeda-pro/||g' \
            $pkgdir/usr/share/applications/$_pkgname.desktop
    else
        install -Dm644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << "EOF"
[Desktop Entry]
Categories=Development;Electronics;
Comment=A Simple and Powerful Electronic Circuit Design Tool
Exec=easyeda-pro %f
Keywords=PCB;EasyEDA;EDA
GenericName=EasyEDA Pro
Icon=easyeda-pro
Name=EasyEDA Pro
Type=Application
Name[en_US]=EasyEDA Pro
MimeType=application/eprj
EOF
    fi

    # soft link
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
    chmod 755 $pkgdir/opt/$_pkgname/$_pkgname
    chmod 755 $pkgdir/opt/$_pkgname/chrome_crashpad_handler
}
