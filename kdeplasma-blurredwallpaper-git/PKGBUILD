# Maintainer: Bouteiller a2n Alan <a2n.dev@pm.me>

# previous tag jic : 52624d01b34f19daaa19b62b0e88e95c67d764ee

_tag=716f68470912751804c64bf7d31979cbd10f129b
_sourceName="blurredwallpaper"
_plasmoidName="a2n.blur"

pkgname="kdeplasma-blurredwallpaper-git"
pkgver=3.2.0
pkgrel=2
pkgdesc="KDE plasma wallpaper plugin that blur the wallpaper when a window is active"
arch=("any")
url="https://github.com/bouteillerAlan/blurredwallpaper"
license=("GPL3")
makedepends=(git)
source=("git+${url}.git#tag=${_tag}?signed")
md5sums=("SKIP")
validpgpkeys=(6A2ECC8A396F8A943A109A1E0F11C2A6BF79111E)

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}

package() {
  cd "${_sourceName}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

  find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

