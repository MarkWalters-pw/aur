# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=inflecto
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=3
pkgdesc="Inflector for strings"
arch=(any)
url=https://rubygems.org/gems/inflecto
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('e4ea51d7b1bae9580e50059084273b26bf518722853c59784d85e35dbb2ab420')

package() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
