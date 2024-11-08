# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rchardet
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=3
pkgdesc="Character encoding auto-detection in Ruby"
arch=(any)
url=https://github.com/jmhodges/rchardet
license=(LGPL-2.1-or-later)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-bump)
makedepends=(ruby-rdoc rubygems)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('663ebadfca8ac4b93f0cd6ddb9c24139fc0cc5e75fd64aabcb75b059e066f0ae')

prepare() {
  cd "$_gemname-$pkgver"
  # "LGPL" is invalid and so gem build complains
  # the license file in the readme is LGPL 2.1
  sed -i 's/"LGPL"/"LGPL-2.1-or-later"/' $_gemname.gemspec

  # remove stuff that we don't need to run minitest
  for pkg in bundler/setup bundler/gem_tasks wwtd/tasks; do
    sed -i "s|require '$pkg'||" Rakefile
  done

  sed -i '/wwtd/d' Gemfile
  sed -i '/minitest-rg/d' Gemfile
  sed -i '/minitest\/rg/d' test/test_helper.rb

  rm Gemfile.lock

  # keeping the gemfile requires building in a chroot
  # rm Gemfile
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
  cd "$_gemname-$pkgver"

  cp --archive --verbose tmp_install/* "${pkgdir}"
  install -Dm0644 Readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
