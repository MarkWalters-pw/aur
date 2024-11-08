# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Michal Kimle <kimle.michal@gmail.com>

# there's no tagged release on github for 0.6.0, so we need to download the
# correct commit (i'm just guessing here, but this is the last commit from the
# day that 0.6.0 was released and it's updating the changelog so it seems like
# the right choice)
_commit=89bdc6ef9bc72f309e2baf6db21522444c496c48
_gemname=tty-config
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc="A highly customisable application configuration interface"
arch=(any)
url=https://github.com/piotrmurach/tty-config
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-inifile
              ruby-java-properties ruby-rhcl ruby-toml ruby-xml-simple)
makedepends=(rubygems ruby-rdoc)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz)
sha256sums=('502214512421164d554ffea43dcefab22a4ed94b2571492c3d9cfa86ac66a4f2')

prepare() {
  cd $_gemname-$_commit

  # we don't care about coverage or metrics
  echo 'source "https://rubygems.org"' > Gemfile
  echo gemspec >> Gemfile
}

build() {
  cd $_gemname-$_commit
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
  cd $_gemname-$_commit
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake
}

package() {
  cd $_gemname-$_commit

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
