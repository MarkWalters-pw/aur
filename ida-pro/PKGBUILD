# NOT compatible with AUR helpers!
#
# To install:
# 	git clone https://aur.archlinux.org/ida-pro.git && cd ida-pro
# 	Download the `ida-pro_VERSION_x64linux.run` installer from the IDA download center at https://my.hex-rays.com/ or VirusTotal, and place it in the same directory
# 	makepkg -sicf

# Maintainer: patchouli

pkgver=9.0
pkgname="ida-pro"
pkgrel=5
pkgdesc="Hex-Rays IDA Pro"
url="https://www.hex-rays.com/products/ida/${pkgver}/index.shtml"
license=('custom')
makedepends=('fakechroot')
depends=('libgl'
	'libx11'
	'libxext'
	'libxrender'
	'glib2'
	'qt5-base'
	'python-rpyc'
	)
options=('!strip')

_installer='ida-pro_90_x64linux.run'

source=("file://${_installer}"
		"${pkgname}.desktop"
		"${pkgname}-teams.desktop")

sha256sums=('159cf8983a0e7b199d6efab5af42eca31a288e7ef2ec44eba6336de4acb8107a' # Download on VT if you have a license: https://www.virustotal.com/gui/file/159cf8983a0e7b199d6efab5af42eca31a288e7ef2ec44eba6336de4acb8107a
			'662478dbcb939db8a36f89170246c2187b1086bff840dd96bd4d8f72eac3cad5'
			'437fc36a8edd8dd6adadd773dd777966797640d93f499892bdd1217afaf1b636')

arch=('x86_64')

package() {
	install -d "${pkgdir}"/opt/${pkgname}
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/{icons,applications,licenses/${pkgname}}
	install -d "${pkgdir}"/tmp

	# chroot is needed to prevent the installer from creating a single file outside of prefix
	# have to copy the installer due to chroot
	cp "${srcdir}"/${_installer} "${pkgdir}"/
	chmod +x "${pkgdir}"/${_installer}
	fakechroot chroot "${pkgdir}" /${_installer} --mode unattended --prefix /opt/${pkgname}
	rm "${pkgdir}"/${_installer}
	rm -R "${pkgdir}"/tmp

	# the installer needlessly makes a lot of files executable
	find "${pkgdir}"/opt/${pkgname} -type f -exec chmod -x {} \;
	chmod +x "${pkgdir}"/opt/${pkgname}/{assistant,hv,hvui,ida,idapyswitch,idat,picture_decoder,qwingraph,upg32}

	rm "${pkgdir}"/opt/${pkgname}/{uninstall*,Uninstall*}

	install "${srcdir}"/${pkgname}*.desktop "${pkgdir}"/usr/share/applications
	ln -s /opt/${pkgname}/appico.png "${pkgdir}"/usr/share/icons/${pkgname}.png
	ln -s /opt/${pkgname}/hvui.png "${pkgdir}"/usr/share/icons/${pkgname}-teams.png
	ln -s /opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /opt/${pkgname}/ida "${pkgdir}"/usr/bin/ida
}
