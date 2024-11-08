# Maintainer: aik2 aik2mlj@gmail.com

pkgname='plugdata-bin'
_name='plugdata'
pkgdesc='Plugin wrapper around Pure Data with a new JUCE GUI, allowing patching in DAWs'
pkgver=0.9.1
pkgrel=1
groups=('lv2-plugins' 'vst3-plugins' 'clap-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=()
optdepends=()
conflicts=('plugdata-git')
replaces=('plugdata-git')
arch=('x86_64' 'aarch64')
url='https://github.com/plugdata-team/plugdata'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/plugdata-team/plugdata/releases/download/v${pkgver}/plugdata-Arch-x64.tar.gz"
  "${_name}.desktop"
  "${_name}.png")
sha512sums=('SKIP'
  '1a64e0abbc5e2e9417bf3e2d7f0186b8137a92cebf2123adff550dba53468588c46200f5f40056fad745d583282e1bdd903da14dc064846f91309dc570bc25e3'
  '6ed1228803ea10d51e793f6c8f008b87465314a1f6484121745e42f84fe7b443a8319fcdba862b17af2a1a8b04b7275c0d69eb7a07d0841676f671d25e0790b4')

package() {
  # Desktop entry & pixmaps
  install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
  install -Dm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

  mkdir -p "${pkgdir}/usr/lib/lv2/"
  find . -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  find . -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
  mkdir -p "${pkgdir}/usr/lib/clap/"
  find . -name '*.clap' -type f -exec cp -ar {} "${pkgdir}/usr/lib/clap/" \;
  install -Dm755 -T ./plugdata/Standalone/* "${pkgdir}/usr/bin/${_name}"
}
