# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/zsh-git-prompt

pkgname=zsh-git-prompt
pkgver=0.6
pkgrel=1
pkgdesc='Informative git prompt for zsh'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('LicenseRef-MIT')
install="${pkgname}.install"
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b28a8249797b92b25e3c3156dc99153548a5b0877d2e6aa20be15caa719dcea2')

package() {
  depends=('zsh' 'python')

  cd "${pkgname}-${pkgver}"

  install -Dm755 zshrc.sh "${pkgdir}/usr/lib/${pkgname}/zshrc.sh"
  install -Dm755 python/gitstatus.py "${pkgdir}/usr/lib/${pkgname}/python/gitstatus.py"
  install -Dm755 shell/gitstatus.sh "${pkgdir}/usr/lib/${pkgname}/shell/gitstatus.sh"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
