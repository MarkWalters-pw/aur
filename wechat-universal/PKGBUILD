# Maintainer: lihe07 <umikahoshi at gmail dot com>

pkgname=wechat-universal
pkgver=4.0.0.21
pkgrel=1
pkgdesc="WeChat (Universal) with namespace sandboxing"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com"
license=('proprietary', 'GPLv3')
provides=("${pkgname}")
conflicts=("${pkgname}"{,-bwrap,-privileged})
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'util-linux'
  'flatpak-xdg-utils'
  'libxcomposite'
  'libxkbcommon-x11'
  'libxrandr'
  'lsb-release'
  'mesa'
  'nss'
  'openssl-1.1'
  'pango'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'xdg-desktop-portal'
  'xdg-user-dirs'
)

options=(!strip !debug emptydirs)

_lib_uos='libuosdevicea'

source=(
  "${pkgname}.sh"
  "${pkgname}.desktop"
  "${_lib_uos}".{c,Makefile}
)

_deb_stem="com.tencent.wechat_${pkgver}"
_deb_url_common="https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/${_deb_stem}"

source_x86_64=("${_deb_url_common}_amd64.deb")
source_aarch64=("${_deb_url_common}_arm64.deb")
source_loong64=("${_deb_url_common}_loongarch64.deb")

noextract=("${_deb_stem}"_{amd,arm,loongarch}64.deb)

sha256sums=(
  'a21bc4c34f4b289e13b586732e684fd4ca1157afd3cdc89edf7e130f918fc026'
  'b783b7b0035efb5a0fcb4ddba6446f645a4911e4a9f71475e408a5c87ef04c30'
  'fc3ce9eb8dee3ee149233ebdb844d3733b2b2a8664422d068cf39b7fb08138f8'
  'f05f6f907898740dab9833c1762e56dbc521db3c612dd86d2e2cd4b81eb257bf'
)

sha256sums_x86_64=(
  'd6d3bc011b762ee0b03f3eeb3b6e7ff5d4ce21ff51c2a73d4ddaa26534e88d19'
)
sha256sums_aarch64=(
  '5e5f9b4ff597679f2b721bd404031f71da8cc4e211c69e6ac8c444fc5bc40bd2'
)
sha256sums_loong64=(
  '6fa8f7cb5d0739d46f2a84d363d8f68c6a0cfd6f57023748ad035903d75d994c'
)

_debian_arch_from_carch() {
  case "${CARCH}" in
  'x86_64')
    echo 'amd64'
    ;;
  'aarch64')
    echo 'arm64'
    ;;
  'loong64')
    echo 'loongarch64'
    ;;
  *)
    echo 'unknown'
    ;;
  esac
}

prepare() {
  echo 'Extracting data.tar from deb...'
  bsdtar -xOf "${_deb_stem}_$(_debian_arch_from_carch).deb" ./data.tar.xz |
    xz -cd >data.tar
  echo 'Preparing to compile libuosdevica.so...'
  mkdir -p "${_lib_uos}"
  mv "${_lib_uos}"{.c,/}
  mv "${_lib_uos}"{.Makefile,/Makefile}
}

build() {
  cd "${_lib_uos}"
  echo "Building ${_lib_uos}.so stub by Zephyr Lykos..."
  make
}

package() {
  echo 'Popupating pkgdir with data from wechat-universal deb file...'
  tar -C "${pkgdir}" --no-same-owner -xf data.tar ./opt/apps/com.tencent.wechat
  mv "${pkgdir}"/opt/{apps/com.tencent.wechat/files,"${pkgname}"}
  #rm "${pkgdir}/opt/${pkgname}/${_lib_uos}.so"

  echo 'Installing icons...'
  for res in 16 32 48 64 128 256; do
    install -Dm644 \
      "${pkgdir}/opt/apps/com.tencent.wechat/entries/icons/hicolor/${res}x${res}/apps/com.tencent.wechat.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done
  rm -rf "${pkgdir}"/opt/apps

  echo 'Fixing licenses...'
  local _wechat_root="${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}"/usr/lib/license
  install -Dm755 {"${_lib_uos}","${_wechat_root}"/usr/lib/license}"/${_lib_uos}.so"
  echo 'DISTRIB_ID=uos' |
    install -Dm755 /dev/stdin "${_wechat_root}"/etc/lsb-release

  echo 'Installing scripts...'
  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 wechat-universal.sh "${pkgdir}"/usr/bin/"${pkgname}"

  echo 'Installing desktop files...'
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
