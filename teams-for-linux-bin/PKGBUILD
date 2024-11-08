# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.11.0
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('bf4ab799a490ba07fb3c4fbc863c16da066813ac9984208a711e4e473a8bcc6b14d76d772475879757ea2a5b29468182326af4137658453f33f87d50088d5ec3')
b2sums_aarch64=('2a6e57f6459c7023f338bccd41a177163d17bad03086bc5f4f798ad24023b0cdd7415878ee7ce7b6d3822169bd435b37d5d27666717bf7dc5730e62716d9194a')
b2sums_armv7h=('18dca38bf9408280442151086c09d9e5f0abe5e265c122d5e5693b7503a74abb9e4023d8667d22233525bacc826592fa830fb73bdcadd206645822f2954ce8e7')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
