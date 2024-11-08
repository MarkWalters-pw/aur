# Maintainer: aik2 aik2mlj@gmail.com

pkgname='plugdata-git'
_name='plugdata'
pkgdesc='Plugin wrapper around PureData with a new GUI made with JUCE, allowing patching in DAWs'
pkgver=r8229.85d73a8cd
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=('git' 'cmake')
optdepends=()
conflicts=('plugdata-bin')
replaces=('plugdata-bin')
arch=('x86_64' 'aarch64')
url='https://github.com/plugdata-team/plugdata/'
license=('GPL3')
source=("git+https://github.com/plugdata-team/plugdata/"
    "${_name}.desktop"
    "${_name}.png")
sha512sums=('SKIP'
    '1a64e0abbc5e2e9417bf3e2d7f0186b8137a92cebf2123adff550dba53468588c46200f5f40056fad745d583282e1bdd903da14dc064846f91309dc570bc25e3'
    '6ed1228803ea10d51e793f6c8f008b87465314a1f6484121745e42f84fe7b443a8319fcdba862b17af2a1a8b04b7275c0d69eb7a07d0841676f671d25e0790b4')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_name}"
    git submodule update --init --recursive --depth=1
}

build() {
    cd "${srcdir}/${_name}"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles" ..
    cmake --build .
}

package() {
    # Desktop entry & pixmaps
    install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    cd "${srcdir}/${_name}"

    # === modified from .github/scripts/package.sh ===
    # rm -rf Packaged
    # cp -r Plugins PlugData

    # mkdir PlugData/LV2/PlugData.lv2

    # ./Plugins/LV2/lv2_file_generator PlugData/LV2/PlugData_LV2.so PlugData
    # mv PlugData/LV2/PlugData_LV2.so PlugData/LV2/PlugData.lv2/PlugData.so

    # mv manifest.ttl PlugData/LV2/PlugData.lv2/manifest.ttl
    # mv presets.ttl PlugData/LV2/PlugData.lv2/presets.ttl
    # mv PlugData.ttl PlugData/LV2/PlugData.lv2/PlugData.ttl

    # rm PlugData/LV2/lv2_file_generator

    # mv PlugData Packaged
    # rm -rf Plugins
    # ======

    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find ./Plugins -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find ./Plugins -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    mkdir -p "${pkgdir}/usr/lib/clap/"
    find ./Plugins -name '*.clap' -type f -exec cp -ar {} "${pkgdir}/usr/lib/clap/" \;
    install -Dm755 -T Plugins/Standalone/* "${pkgdir}/usr/bin/${_name}"
}
