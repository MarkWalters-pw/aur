# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=webrobots
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=3
pkgdesc="A Ruby library to help write robots.txt compliant web robots"
arch=(any)
url=https://github.com/knu/webrobots
license=(BSD-2-Clause)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-nokogiri ruby-rake ruby-shoulda ruby-simplecov
              ruby-test-unit ruby-vcr ruby-webmock)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('08a5d80307c7654d90294ed4a9742506cc6638ef467afe93fcd1906b49228c69')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i '/coveralls/Id' test/simplecov_start.rb
  sed -i '/coveralls/d' ${_gemname}.gemspec
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
  GEM_HOME="tmp_install/${_gemdir}" rake
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
}

# vim: set ts=2 sw=2 et:
