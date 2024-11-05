# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=mcreator-eap
_pkgvermajor=2024.3
_pkgverbuild=39215
pkgver=$_pkgvermajor.$_pkgverbuild
pkgrel=2
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (EAP release)'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL-3.0-or-later')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname//-eap}/${pkgname//-eap}/releases/download/$pkgver/MCreator.EAP.$pkgver.Linux.64bit.tar.gz"
        "${pkgname//-eap}.desktop")
b2sums=('335afb7156ccd6ef9ce9f1055caf638e64130fefb4e53cb55c710f40af09f7540184bb0527e985d386995d2d249273ea10dba1886adf316500cf0db43cabf75e'
        'c4227c9cb09a4c0db1fd368f4815d890da16b3bf08552d5bf3766f5ad9706444e5ed42cd591422ddd326e295faa6c302d2144f2c6963598df6cca14537d13248')

prepare() {
    PKGBUILD_JAVA_PATH='$(find /usr/lib/jvm/ -maxdepth 1 -name '\''*21*'\'' -type d -print -quit)/bin/java'

    mkdir -p "$pkgname-$pkgver/"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver/"

    # Convert
    cd "$pkgname-$pkgver/"

    cat >"mcreator.sh"<<EOF
#!/bin/sh
export CLASSPATH="./$pkgname/lib/mcreator.jar:./lib/*"

cd /opt/$pkgname/
$PKGBUILD_JAVA_PATH --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    cp "$srcdir/${pkgname//-eap}.desktop" "${pkgname//-eap}.desktop"

    rm -rf jdk/
}

package() {
    depends=('glibc'
             'java-runtime=21')

    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$pkgname-$pkgver/." "$pkgdir/opt/$pkgname/"

    chmod 755 "$pkgdir/opt/$pkgname/${pkgname//-eap}.sh"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/${pkgname//-eap}.sh" "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/$pkgname/${pkgname//-eap}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -d "$pkgdir/usr/share/icons/"
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/icons/$pkgname.png"
}
