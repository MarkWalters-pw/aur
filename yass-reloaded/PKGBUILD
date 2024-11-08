# Maintainer: Jonas Bögle <aur@iwr.sh>

pkgname=yass-reloaded
pkgver=2024.10
pkgrel=1
pkgdesc="Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs"
arch=('i686' 'x86_64')
url="https://github.com/DoubleDee73/Yass"
license=('GPL')
depends=('jdk-openjdk>=22' 'java-openjfx>=22' 'gtk2' 'bash')
makedepends=('unzip')
_filename="Yass-Reloaded-${pkgver}.jar"
source=(
	"https://github.com/DoubleDee73/Yass/releases/download/${pkgver}/${_filename}"
	"${pkgname}.desktop"
	"${pkgname}.sh")
sha256sums=('6fb2a9d627e0063817dad28e5a95518fc6afb06a2c70c1f5d80b230d947b9b61'
            '3302b96b565e374f6de96c7139407bf8ee7b4bc206405f7489ee2cb109a57382'
            '8566b476712d18152416b1c3c7402ec222c007857c6d8fc7e53d603113f5ed1f')
options=(!strip)
noextract=("${_filename}")

package() {
	# jar
	install -Dm644 "${srcdir}/${_filename}" "${pkgdir}/usr/share/java/${pkgname}.jar"
	# icon
	unzip -j -d "${srcdir}" -o "${_filename}" yass/resources/icons/yass-icon.png
	install -Dm644 "${srcdir}/yass-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	# desktop
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# launch script
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
