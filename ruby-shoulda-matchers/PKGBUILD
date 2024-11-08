# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=shoulda-matchers
pkgname=ruby-$_gemname
pkgver=6.4.0
pkgrel=1
pkgdesc="Shoulda Matchers provides RSpec- and Minitest-compatible one-liners"
arch=(any)
url=https://github.com/thoughtbot/shoulda-matchers
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(rubygems ruby-rdoc)
# checkdepends=(ruby-bundler ruby-rake ruby-rspec)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('1c74a848ab2a9d01f8cf1abadbdba11cc4f1f2657d90b3b6293d8eb47d830fa4')

prepare() {
  cd $_gemname-$pkgver
  # sed -i "/require 'appraisal'/d" Rakefile
  # sed -i '/appraisal/d' Gemfile
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

# check() {
#   cd $_gemname-$pkgver
#   local _gemdir="$(gem env gemdir)"
#   GEM_HOME="tmp_install/${_gemdir}" rake spec:unit
#   GEM_HOME="tmp_install/${_gemdir}" rake spec:acceptance
# }

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
