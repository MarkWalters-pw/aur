# Maintainer:
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname="spectacle"
pkgname="$_pkgname-git"
pkgver=24.08.0.r10.gc7de07d
pkgrel=1
pkgdesc='KDE screenshot capture utility'
url='https://invent.kde.org/graphics/spectacle'
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'kcrash'
  'kpipewire'
  'kstatusnotifieritem'
  'layer-shell-qt'
  'opencv'
  'prison'
  'purpose'
  'qt6-multimedia'
  'xcb-util-cursor'
  'zxing-cpp'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools'
  'ninja'
  'plasma-wayland-protocols'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
  local _file='desktop/org.kde.spectacle.appdata.xml'

  local _line=$(grep -E "$_regex" "$_file" | head -1)
  local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")
  local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')
  local _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _cmake_options=(
    -B "build"
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "build"
}
