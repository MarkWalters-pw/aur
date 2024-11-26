# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="wechat"
pkgname="${_pkgname}-bin"
pkgver=4.0.0.30
pkgrel=2
pkgdesc="Wechat from tencent | 微信官方版"
arch=("x86_64" "aarch64" "loong64")
url="https://linux.weixin.qq.com"
license=("proprietary")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-universal")
replaces=("${_pkgname}-universal" "${_pkgname}-universal-privilege")
depends=(at-spi2-core jack libpulse libxcomposite libxdamage libxkbcommon-x11 libxrandr mesa nss pango xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm)
makedepends=("patchelf")
optdepends=("noto-fonts-cjk: Chinese font support" "noto-fonts-emoji: emoji support")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.deb")
source_loong64=("${_pkgname}-${pkgver}-loong64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_LoongArch.deb")
sha256sums_x86_64=('0e2834310e1d321da841a4cde9c657d9c086c5ee8c82d09e47eab53629a5038f')
sha256sums_aarch64=('dd1f5029bb20274dd7903a0c5bf7796e1392262e048ce88265530a88328d72ec')
sha256sums_loong64=('5017543b0fe8ad28bf862deec92c4a7faefa7b95bba205f20107a15c6a5a2098')
noextract=("${_pkgname}-${pkgver}-"{x86_64,aarch64,loong64}.deb)
options=("!strip")

prepare() {
    bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" ./data.tar.xz | xz -cdT0 | tar -x .
    rm -rf usr/share/doc
    patchelf --set-rpath '$ORIGIN' "opt/${_pkgname}/libwxtrans.so"
    find "opt/${_pkgname}/vlc_plugins" -type f | xargs -I {} patchelf --set-rpath '$ORIGIN:$ORIGIN/../..' {}
    sed -e "s|^Icon=.*|Icon=${_pkgname}|" \
        -e "s|^Categories=.*|Categories=Network;InstantMessaging;Chat;|" \
        -e "s|^Exec=.*|Exec=env 'QT_QPA_PLATFORM=wayland;xcb' /usr/bin/wechat %U|" \
        -i "usr/share/applications/${_pkgname}.desktop"
}

package() {
    mv {opt,usr} "${pkgdir}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
