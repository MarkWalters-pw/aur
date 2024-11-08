# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-accept
pkgname=ruby-${_gemname}
pkgver=2.2.1
pkgrel=1
pkgdesc="Parse Accept and Accept-Language HTTP headers in Ruby"
arch=(any)
url=https://github.com/socketry/http-accept
license=(MIT)
depends=(ruby)
checkdepends=(ruby-covered ruby-sus ruby-bake-test ruby-bake-test-external ruby-json)
makedepends=(rubygems ruby-rdoc)
source=(https://github.com/socketry/http-accept/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('a616e1c17c5bf6063503d56947b990383b4a031806f1a5cb19c7fe3c0570699d')

prepare() {
  cd ${_gemname}-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  sed -i '/cert_chain/d' ${_gemname}.gemspec
  sed -i '/signing_key/d' ${_gemname}.gemspec

  # remove optional gems from gemfile
  sed -i '/:maintenance,/,+6d' gems.rb
}

build() {
  cd ${_gemname}-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd ${_gemname}-$pkgver
  local _gemdir="$(gem env gemdir)"
  # Can't require json
  # see: https://gitlab.archlinux.org/archlinux/packaging/packages/ruby-json/-/merge_requests/1
  #
  # GEM_HOME="tmp_install/${_gemdir}" bake test
  # GEM_HOME="tmp_install/${_gemdir}" bake test:external
}

package() {
  cd ${_gemname}-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
