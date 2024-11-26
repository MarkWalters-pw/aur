# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-password-policy
pkgver=2024.01.08
pkgrel=1
_commit="d3b69859553a"
pkgdesc="password policy for creating accounts"
arch=('any')
url="https://modules.prosody.im/mod_password_policy.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('31f798ea9a854b12d28ef806c59e00affb550d06')


package() {
  cd "${srcdir}/prosody-modules/mod_password_policy"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
