# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=brotli
_brotlicommit=ed738e842d2fbdf2d6459e39267a633c4a9b2f5d
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc="Brotli compressor/decompressor"
arch=(x86_64)
url=https://github.com/miyucy/brotli
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-test-unit ruby-test-unit-rr ruby-rantly)
makedepends=(git rubygems ruby-rake ruby-rake-compiler ruby-bundler ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz
        git+https://github.com/google/brotli.git#commit=${_brotlicommit})
sha256sums=('18543ab6d4e9af5519d7feed6ab75ac535d67344dec45dd06c4dc40b1dddbbf1'
            'f03d32ffc5f7852aa7bb9da4bd8c09b5c59a7cb636c80a961d77676083f7fa34')

prepare() {
  cd $_gemname-$pkgver
  cp -r "$srcdir/brotli/"* vendor/brotli
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  rake build
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
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
