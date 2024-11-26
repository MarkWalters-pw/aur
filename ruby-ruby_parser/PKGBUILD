# Maintainer: Andrea Richiardi <a.richiardi.work@gmail.com>
# Co-Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.
#
# this package is also depended up by Emacs' feature-mode aka cucumber.el

_gemname='ruby_parser'
pkgname="ruby-${_gemname}"
pkgver=3.21.0
pkgrel=1
pkgdesc='Ruby parser written in pure ruby'
arch=('any')
url='https://github.com/seattlerb/ruby_parser'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-sexp_processor')
makedepends=('ruby-hoe' 'ruby-minitest' 'ruby-oedipus_lex' 'ruby-racc' 'ruby-rake' 'unifdef')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('923c5c3e850a62d5a6d7742540768827508d40620dcf0809a784d09ef8dcfbc5323f23d19cdb543b60315fbd0bc33997e8c0dccde9c6dbe33c145f1146a1dfdf')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' Rakefile
}

build() {
  cd "${_gemname}-${pkgver}"

  PATH=/usr/lib/ruby/gems/3.0.0/gems/racc-1.6.0/bin:${PATH} rake gem
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 README.rdoc "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 History.rdoc README.rdoc debugging.md gauntlet.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
