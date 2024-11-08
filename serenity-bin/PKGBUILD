# Maintainer:  mzwing <mzwing@mzwing.eu.org>
# Contributor: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Henry-ZHR <henry-zhr@qq.com>

_pkgname=serenity
pkgname=serenity-bin
_pkgver=1.0.0-beta.17
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc='The configuration generator for sing-box'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/SagerNet/serenity'
license=('custom:GPL-3.0-or-later WITH name use or association addition')
optdepends=('sing-box')
provides=('serenity')
conflicts=('serenity' 'serenity-git')
backup=("etc/$_pkgname/config.json")
source=("LICENSE"::$url/raw/dev/LICENSE)
source_i686=("${_pkgname}_${_pkgver}_linux_i686.pkg.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_386.pkg.tar.zst")
source_x86_64=("${_pkgname}_${_pkgver}_linux_x86_64.pkg.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${_pkgname}_${_pkgver}_linux_aarch64.pkg.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_arm64.pkg.tar.zst")
source_armv7h=("${_pkgname}_${_pkgver}_linux_armv7h.pkg.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_armv7.pkg.tar.zst")
sha256sums=('650d5e3b99a446fb38e820fa87a49562e0c79eab868fff58618ac487a58e554c')
sha256sums_i686=('0c3151ffafd0762ab94d8a731140b9aba8a945c87eea489d0dff3b2ac94a38ec')
sha256sums_x86_64=('2b8d157ef08dcb15e56ed6c4e910f44a60c12bcb2753648d98d11723fa6d1125')
sha256sums_aarch64=('79e808b5d2f66bbf4b59bd39398ee2aac79d2c310071f2026cab78e79c239172')
sha256sums_armv7h=('31bb2cae115260f101874b51ea65b3c9deadb826e71154402a2ac07363dfe459')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
    cp -dpr --no-preserve=ownership "$srcdir/usr/" "$pkgdir/usr"
    cp -dpr --no-preserve=ownership "$srcdir/etc/" "$pkgdir/etc"
}
