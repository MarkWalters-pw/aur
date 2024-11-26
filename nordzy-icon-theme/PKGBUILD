# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=nordzy-icon-theme
pkgver=1.8.7
pkgrel=1
epoch=
pkgdesc="Nordzy is a free and open source icon theme for Linux desktops using the Nord color palette from Arctic Ice Studio and based on WhiteSur and Numix Icon Theme."
arch=('any')
url="https://github.com/alvatip/Nordzy-icon"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme')
conflicts=("$pkgname-git")
options=('!strip')

source=(
	"Nordzy-cyan-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-cyan-dark.tar.gz"
	"Nordzy-cyan-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-cyan.tar.gz"
	"Nordzy-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-dark.tar.gz"
	"Nordzy-green-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-green-dark.tar.gz"
	"Nordzy-green-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-green.tar.gz"
	"Nordzy-orange-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-orange-dark.tar.gz"
	"Nordzy-orange-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-orange.tar.gz"
	"Nordzy-pink-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-pink-dark.tar.gz"
	"Nordzy-pink-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-pink.tar.gz"
	"Nordzy-purple-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-purple-dark.tar.gz"
	"Nordzy-purple-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-purple.tar.gz"
	"Nordzy-red-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-red-dark.tar.gz"
	"Nordzy-red-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-red.tar.gz"
	"Nordzy-turquoise-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-turquoise-dark.tar.gz"
	"Nordzy-turquoise-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-turquoise.tar.gz"
	"Nordzy-yellow-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-yellow-dark.tar.gz"
	"Nordzy-yellow-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-yellow.tar.gz"
	"Nordzy-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy.tar.gz"
)
sha256sums=('3f28fa9dac41c8662a26ae2f6d50ad34e7dd42e4cabb1b57b2291f3d7cf1878b'
            '4fe89889d309b96eddfb50094eeadfaf1b07f58ef6efe9cbc15c7da008d941ad'
            'ad752b5ce70577408431734fc8004f928a00027a8fce6dd131ae2d0c3dc82069'
            '510b73bc15721452e0930d9b4a490f585d463578f5f021609f5bbfd02e1a293b'
            'a1336304fa248a06f4da460670abf7f06225fa44e3e54d222f32cdb353711a27'
            'a4a4d09db3d0e72fa7b2e19d6c789922e2a8c15b33d763028882b48ef6909b39'
            'c0b5ef9c802aab1eef4ffe512147bfa93ef80a3a7fbabbac87b1fe4c400cb410'
            'a437f20eff11b685541ffa601df404de826ee32775f6ebe1acf38f32dc9da554'
            'b2ecdac795d57942318d35dab33cd44def92e9232a879254bbe8ebdb01f4762c'
            '7605ca7850665e8be9a4c991b8f0311ca7b818b7282c69b29866d678dac7d641'
            'f389764f3c47c0877cca5323e75ad59e262bd2cf1c96da4bb1abd120c96f36ac'
            '3a802a0a3716e0b6922fe92c0d96b6d0e310af8f46ad8d51ab81c42321506719'
            'ad2df40a34406dc7f0c38f4a17baa7e5118c5ff431324000c8e3c15f211d4ba5'
            '8b8e17a31e92d2794ea8a2c9e9974d075df069bcd328cfdead1d368afbf00285'
            'b9f9692dacc60853e529b6127128d5f63e255e66b96e3fa2e8f93bf352d0e243'
            'd1f3b76ff58e7fe4a9d93cfcba2de4d041a2ff4dbf287412a5723f449d028610'
            'b5e171b9486148fc39fabd3e94621a2955db2cec31cbaca8174ad94237ade288'
            '38c346bc4de165b79d5b678284b63cc0fa058dccea29ec1b6fabea7117d7b8ad')

_package_icon_theme() {
	local _name="$1"
	cd "${srcdir}/${_name}"
	install -d -m755 "${pkgdir}/usr/share/icons/${_name}"
	cp -a --no-preserve=ownership . "${pkgdir}/usr/share/icons/${_name}"
}

package() {
	_package_icon_theme Nordzy-dark
	_package_icon_theme Nordzy-green
	_package_icon_theme Nordzy-green-dark
	_package_icon_theme Nordzy-turquoise-dark
	_package_icon_theme Nordzy-orange-dark
	_package_icon_theme Nordzy-pink
	_package_icon_theme Nordzy-pink-dark
	_package_icon_theme Nordzy-cyan
	_package_icon_theme Nordzy-yellow
	_package_icon_theme Nordzy-red-dark
	_package_icon_theme Nordzy-red
	_package_icon_theme Nordzy-purple
	_package_icon_theme Nordzy-purple-dark
	_package_icon_theme Nordzy
	_package_icon_theme Nordzy-orange
	_package_icon_theme Nordzy-yellow-dark
	_package_icon_theme Nordzy-cyan-dark
	_package_icon_theme Nordzy-turquoise
}
