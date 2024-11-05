# Maintainer:
# Contributor: westpain <homicide@disroot.org>
# Contributor: rikki48 <xdxdxdxdlmao@mail.ru>

## options
: ${_branch:=dev}

_pkgname="ayugram-desktop"
pkgname="$_pkgname-git"
pkgver=5.6.3.r1.g4e0ffc1
pkgrel=1
pkgdesc='Unofficial Telegram messaging app with ToS breaking features in mind'
url="https://github.com/AyuGram/AyuGramDesktop"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  ada
  ffmpeg
  hunspell
  jemalloc
  kcoreaddons
  libdispatch
  libpipewire
  libvpx
  libxcomposite
  libxdamage
  libxrandr
  libxtst
  minizip
  openal
  openh264
  opus
  protobuf
  qt6-base
  qt6-declarative
  qt6-svg
  qt6-wayland
  rnnoise
  xcb-util-keysyms
  xxhash
)
makedepends=(
  boost
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  libtg_owt
  microsoft-gsl
  mm-common
  ninja
  perl-xml-parser
  plasma-wayland-protocols
  python
  python-packaging
  range-v3
  tl-expected
  wayland-protocols
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=('ayugram-desktop')
conflicts=('ayugram-desktop')

_pkgsrc="ayugram"
source=(
  "$_pkgsrc"::"git+https://github.com/AyuGram/AyuGramDesktop.git#branch=${_branch:-dev}"
  #'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'
  'ayugram.lib_tl'::'git+https://github.com/AyuGram/lib_tl.git'
  'ayugram.lib_ui'::'git+https://github.com/AyuGram/lib_ui.git'
  'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
  'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'
  'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'
  'desktop-app.gsl'::'git+https://github.com/desktop-app/GSL.git'
  'desktop-app.lib_base'::'git+https://github.com/desktop-app/lib_base.git'
  'desktop-app.lib_crl'::'git+https://github.com/desktop-app/lib_crl.git'
  'desktop-app.lib_lottie'::'git+https://github.com/desktop-app/lib_lottie.git'
  'desktop-app.lib_qr'::'git+https://github.com/desktop-app/lib_qr.git'
  'desktop-app.lib_rpl'::'git+https://github.com/desktop-app/lib_rpl.git'
  'desktop-app.lib_spellcheck'::'git+https://github.com/desktop-app/lib_spellcheck.git'
  'desktop-app.lib_storage'::'git+https://github.com/desktop-app/lib_storage.git'
  'desktop-app.lib_webrtc'::'git+https://github.com/desktop-app/lib_webrtc.git'
  'desktop-app.lib_webview'::'git+https://github.com/desktop-app/lib_webview.git'
  'desktop-app.libprisma'::'git+https://github.com/desktop-app/libprisma.git'
  'desktop-app.rlottie'::'git+https://github.com/desktop-app/rlottie.git'
  #'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
  'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
  #'flatpak.xdg-desktop-portal'::'git+https://github.com/flatpak/xdg-desktop-portal.git'
  'google.cld3'::'git+https://github.com/google/cld3.git'
  'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
  'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
  'hunspell'::'git+https://github.com/hunspell/hunspell.git'
  #'jemalloc'::'git+https://github.com/jemalloc/jemalloc.git'
  'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'
  'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
  'lz4'::'git+https://github.com/lz4/lz4.git'
  'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'
  'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'
  'telegramdesktop.libtgvoip'::'git+https://github.com/telegramdesktop/libtgvoip.git'
  'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'

  "cppgir"::"git+https://gitlab.com/mnauw/cppgir.git"
  "cppgir-expected-lite"::"git+https://github.com/martinmoene/expected-lite.git"
)

sha256sums=(
  #'SKIP'
  #'SKIP'
  #'SKIP'
  #'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule init
  #git config apple.swift-corelibs-libdispatch.url 'Telegram/ThirdParty/dispatch'
  git config ayugram.lib_tl.url 'Telegram/lib_tl'
  git config ayugram.lib_ui.url 'Telegram/lib_ui'
  git config cyan4973.xxhash.url 'Telegram/ThirdParty/xxHash'
  git config desktop-app.cmake_helpers.url 'cmake'
  git config desktop-app.codegen.url 'Telegram/codegen'
  git config desktop-app.gsl.url 'Telegram/ThirdParty/GSL'
  git config desktop-app.lib_base.url 'Telegram/lib_base'
  git config desktop-app.lib_crl.url 'Telegram/lib_crl'
  git config desktop-app.lib_lottie.url 'Telegram/lib_lottie'
  git config desktop-app.lib_qr.url 'Telegram/lib_qr'
  git config desktop-app.lib_rpl.url 'Telegram/lib_rpl'
  git config desktop-app.lib_spellcheck.url 'Telegram/lib_spellcheck'
  git config desktop-app.lib_storage.url 'Telegram/lib_storage'
  git config desktop-app.lib_webrtc.url 'Telegram/lib_webrtc'
  git config desktop-app.lib_webview.url 'Telegram/lib_webview'
  git config desktop-app.libprisma.url 'Telegram/ThirdParty/libprisma'
  git config desktop-app.rlottie.url 'Telegram/ThirdParty/rlottie'
  #git config ericniebler.range-v3.url 'Telegram/ThirdParty/range-v3'
  git config fcitx.fcitx5-qt.url 'Telegram/ThirdParty/fcitx5-qt'
  #git config flatpak.xdg-desktop-portal.url 'Telegram/ThirdParty/xdg-desktop-portal'
  git config google.cld3.url 'Telegram/ThirdParty/cld3'
  git config hamonikr.nimf.url 'Telegram/ThirdParty/nimf'
  git config hime-ime.hime.url 'Telegram/ThirdParty/hime'
  git config hunspell.url 'Telegram/ThirdParty/hunspell'
  #git config jemalloc.url 'Telegram/ThirdParty/jemalloc'
  git config kde.kcoreaddons.url 'Telegram/ThirdParty/kcoreaddons'
  git config kde.kimageformats.url 'Telegram/ThirdParty/kimageformats'
  git config lz4.url 'Telegram/ThirdParty/lz4'
  git config nayuki.qr-code-generator.url 'Telegram/ThirdParty/QR'
  git config tartanllama.expected.url 'Telegram/ThirdParty/expected'
  git config telegramdesktop.libtgvoip.url 'Telegram/ThirdParty/libtgvoip'
  git config telegrammessenger.tgcalls.url 'Telegram/ThirdParty/tgcalls'
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/$_pkgsrc/cmake"
  git submodule init
  git config submodule.external/glib/cppgir.url "$srcdir/cppgir"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/$_pkgsrc/cmake/external/glib/cppgir"
  git submodule init
  git config submodule.expected-lite.url "$srcdir/cppgir-expected-lite"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_TEST=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
