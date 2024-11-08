# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rantly
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc="Ruby Imperative Random Data Generator and Quickcheck"
arch=(any)
url=https://github.com/rantly-rb/rantly
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-minitest ruby-rake ruby-simplecov ruby-rubocop ruby-rubocop-performance)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/${pkgver}.tar.gz
        ${url}/commit/73768bff7928d60c6b7c03aea5d15ea6206d1620.patch)
sha256sums=('510a61c89cb87dd99d2219be5baa892fb2646739be44844d84a9732a787d05ed'
            '6b640dd97452e3ea372c4c03cb2cfcddb64848c686a9e6642c602bbf1aa83b42')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/coveralls/d' Gemfile
  sed -i 's|~>|>=|g' Gemfile

  patch -p1 -N -i "${srcdir}/73768bff7928d60c6b7c03aea5d15ea6206d1620.patch"
}

build() {
  cd $_gemname-$pkgver
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
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
