# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=zstd-ruby
pkgname=ruby-$_gemname
pkgver=1.5.6.6
pkgrel=1
pkgdesc="Ruby binding for zstd"
arch=(x86_64)
url=https://github.com/SpringMT/zstd-ruby
license=(BSD-3-Clause)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-pry ruby-rake ruby-rake-compiler ruby-rspec)
makedepends=(rubygems ruby-bundler ruby-rake ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('f34a8e7e9d35e97147862f48f1ee42efbf82d26f31db26542faed5c8155202f9')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  rake compile
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
  GEM_HOME="tmp_install/${_gemdir}" rake spec
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
