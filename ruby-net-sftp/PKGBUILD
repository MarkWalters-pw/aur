# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Christopher Loen <christopherloen at gmail dot com>

_gemname=net-sftp
pkgname="ruby-${_gemname}"
pkgver=4.0.0
pkgrel=1
pkgdesc="A pure Ruby implementation of the SFTP client protocol"
arch=(any)
url=https://github.com/net-ssh/net-sftp
license=(MIT)
depends=(ruby ruby-net-ssh)
checkdepends=(ruby-bundler ruby-minitest ruby-mocha ruby-rake)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('e4e695e4978f382ac8fd5ab953a09617dd3dd5507056b3a2fd866f31417891a2')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
}

build() {
  cd "${_gemname}-${pkgver}"

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
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
}

# vim: set ts=2 sw=2 et:
