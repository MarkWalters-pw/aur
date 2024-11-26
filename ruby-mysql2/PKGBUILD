# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=mysql2
pkgname=ruby-${_gemname}
pkgver=0.5.6
pkgrel=1
pkgdesc="A simple, fast Mysql library for Ruby, binding to libmysql"
arch=(x86_64)
url=http://github.com/brianmario/mysql2
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(mariadb-clients ruby-rake ruby-rake-compiler)
checkdepends=(ruby-rspec)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0512c85ad4164bd574bef9b525d858124936208bea4dfa0ea7c079127615cdc8')

prepare() {
  cd $_gemname-$pkgver

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newever version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile
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

# TODO: we need a locally running mysql to run these tests
# check() {
#   cd $_gemname-$pkgver
#   local _gemdir="$(gem env gemdir)"
#   GEM_HOME="tmp_install/${_gemdir}" rake spec
# }

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 CHANGELOG.md README.md \
     -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
