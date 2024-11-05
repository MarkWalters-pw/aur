# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=10.19.4
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache-2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("findutils" "libarchive")
source=("$pkgname-$pkgver.zip::https://github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
b2sums=('8979834db2ac729a47df2776ba5920fe732c481260e3978470da7bd9142cc847a8823191a29a45b05c1f0118d41aa23fe961dc4fe2518915c96b0aaa1705a57e')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/cyberchef"
 install -d "$pkgdir/usr/share/licenses/cyberchef"
 bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$pkgdir/usr/share/webapps/cyberchef" --no-same-permissions
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
 find "$pkgdir/usr/share/webapps/cyberchef/" -type f -name "*LICENSE*" -exec mv {} "$pkgdir/usr/share/licenses/cyberchef" \;
}
