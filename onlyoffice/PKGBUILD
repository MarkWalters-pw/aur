# Maintainer: Levi Zim (kxxt) <rsworktech@outlook.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >
pkgname=onlyoffice
pkgver=8.2.0
pkgrel=1
pkgdesc="An office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit local documents "
arch=(x86_64)
url="https://www.onlyoffice.com/desktop.aspx"
license=('AGPL-3.0-only')
depends=(
    'curl' 'gtk3' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
    'gst-plugins-ugly' 'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation'
    'ttf-carlito' 'desktop-file-utils' 'hicolor-icon-theme'    
    'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'qt5-svg'
)
makedepends=(
    git python
    # build_tools/tools/linux/deps.py
    nodejs-lts-iron
    npm
    yarn
    grunt-cli
    cmake
    p7zip
    # v8
    ninja
    # grunt
    jdk11-openjdk
)
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
conflicts=(onlyoffice-bin onlyoffice-git)
options=(
    '!emptydirs'
    '!lto'
)
_url=https://github.com/ONLYOFFICE
# The tag used for sumodules
_tag=v8.2.1.1
source=(
    # Source
    "git+${_url}/DesktopEditors#tag=v$pkgver"
    "$pkgname-core::git+${_url}/core#tag=$_tag"
    "$pkgname-desktop-apps::git+${_url}/desktop-apps#tag=$_tag"
    "$pkgname-desktop-sdk::git+${_url}/desktop-sdk#tag=$_tag"
    "$pkgname-dictionaries::git+${_url}/dictionaries#tag=$_tag"
    "$pkgname-sdkjs::git+${_url}/sdkjs#tag=$_tag"
    "$pkgname-sdkjs-forms::git+${_url}/sdkjs-forms#tag=$_tag"
    "$pkgname-web-apps::git+${_url}/web-apps#tag=$_tag"
    "$pkgname-build_tools::git+${_url}/build_tools#tag=$_tag"
    "$pkgname-core-fonts::git+${_url}/core-fonts#tag=$_tag"
    "$pkgname-document-templates::git+${_url}/document-templates#tag=$_tag"
    "onlyoffice.github.io::git+${_url}/onlyoffice.github.io"
    # V8
    "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=8dde9800ee2b8326ab11a87abd67d3bd9f8c8773"
    "git+https://github.com/v8/v8#branch=9.0-lkgr"
    # Patches
    "v8-89-fix-cstdint.diff"
    "0001-Add-update-only-to-avoid-download-and-build-at-once.patch"
    "0002-Add-no-third-party-update-and-update-third-party-onl.patch"
    "0003-use-QT_VERSION-env-instead-of-guessing.patch"
    "0004-Only-build-tar.patch"
    "0001-Fix-boost-module-import.patch"
    "use-fpermissive.diff"
    "fix-glib-qt-macro-collision.diff"
)
sha256sums=('0fb345df9a5f36c3db750a2f0189bd3a82d9c208a6b04154122ade767fe9f46b'
            '649f4cc007f725a1660262e059e37418e3ec5092a2cf08fbde99ee6cae0af5db'
            'c78143a88b9f3536ec658cf51f010d833ad71b2249f93421d9470001a5285181'
            '409058619dfb94d7f861ac0174bc78c1185dac75d9f2093fd2429be51e86dc1d'
            'a4a962604c085ff982d06d3b6b03763ada18ce27364742ea63c8754f85d4cd0f'
            '85e7ffbec48c2bb6569960e87aa6718f787d12356e665b859bdd90d1557133f5'
            '25c73109bbf2001686b5ed22eb06221968328dab2926086f7f36b6935629af36'
            '4adc3c252c925aa1bbac4a614b43ae3a5d19034818ed374ffbf81c97081a2aa9'
            '520849b85fae25d9c5442fad5407d971907caf6e21f8adc678beb29533c73513'
            '3724102cfeeb1fde8f86ae767b14eaa672ca43ec472d87321c84cc1ce18189d1'
            '34d0505c7c77d56a3da63fc3f4c77516f639b8b18eb89a8fbf0ca4d96f9930b4'
            'SKIP'
            'cd7a982bf79eae86a8b7727193e2a9feccd1388cd0cc474b8d786ac6dc695cfe'
            'SKIP'
            '36e4855625bf3eaab293208478492393fb4e8f0f1076fac06df56ca828319ffc'
            'a4f2502acfdc48d3daad5ed166c1cd15cb0595a4d5018f22d9390f73f25dd8c6'
            'e9d56d030039ad72e89dc48877f7fccaeac4cfa5ff584833849be2601fca5fb7'
            'bdcf095fd46fb47f2992510078c46cef2b0084000ff4a0c4f956efb0db7e4d57'
            '0f7acc17b78eaeb338f098088ee11356045a53af6698c79ada45fa261c8d18fe'
            '005951c1b8a281148a3a7e79261c728c4d80ff2c580e278e823a84c8751916f9'
            '222dab12468f27b2bc1cc098ad2e4ca5bff8df845939f5cba2efff2165eafbcd'
            'bd655f04eb044f19da779911eb7ad6fd13c899a659720fbcf08f38194365669c')

prepare() {
    for _module in core desktop-{apps,sdk} dictionaries sdkjs{,-forms} \
        web-apps build_tools document-templates core-fonts
    do
        mv "$pkgname-${_module}" "${_module}"
    done
    cd "$srcdir/build_tools"/tools/linux

    # Pretend that we have all dependencies installed
    touch packages_complete

    # Use system qt
    # ref: build_tools/tools/linux/use_system_qt.py
    mkdir -p system_qt/gcc_64
    ln -s /usr/bin            ./system_qt/gcc_64/bin
    ln -s /usr/lib            ./system_qt/gcc_64/lib
    ln -s /usr/lib/qt/plugins ./system_qt/gcc_64/plugins

    # Check build_tools/tools/linux/automate.py for options to configure.py
    cd "$srcdir/build_tools"
    patch -Np1 -i ../0001-Fix-boost-module-import.patch
    patch -Np1 -i ../0001-Add-update-only-to-avoid-download-and-build-at-once.patch
    patch -Np1 -i ../0002-Add-no-third-party-update-and-update-third-party-onl.patch
    # Fix the way to get qt version
    patch -Np1 -i ../0003-use-QT_VERSION-env-instead-of-guessing.patch
    # Don't build debs/rpm/..
    patch -Np1 -i ../0004-Only-build-tar.patch

    # We manually update the sources, so --update 0
    ./configure.py --module desktop --update 0 --branch "tags/$_tag" --qt-dir "$(realpath tools/linux/system_qt)"
    ./make.py --update-only

    # fetch V8 before updating third party to have a chance to patch it
    cd "$srcdir/"
    mv depot_tools core/Common/3dParty/v8_89/
    cd core/Common/3dParty/v8_89/
    cat >.gclient <<EOF
solutions = [
  {
    "name": "v8",
    "url": "file://${srcdir}/v8@makepkg",
    "deps_file": "DEPS",
    "managed": False,
    "custom_deps": {},
    "custom_vars": {},
  },
]
EOF
    export PATH="$(pwd)/depot_tools:$PATH" DEPOT_TOOLS_UPDATE=0
    # ref: build_tools/scripts/core_common/modules/v8_89.py
    gclient sync --force
    # V8 use system libstdc++
    ln -sf /usr/lib/libstdc++.so.6 \
        v8/third_party/llvm-build/Release+Asserts/lib/libstdc++.so.6
    patch -Np1 -d v8 < "$srcdir/v8-89-fix-cstdint.diff"

    cd "$srcdir"
    # Fix some compile error
    patch -Np1 -d core < use-fpermissive.diff
    patch -Np1 -d desktop-apps < fix-glib-qt-macro-collision.diff
    # patch -Np1 -d desktop-apps < package-add-dir-target.diff
    # pragma (end)?region breaks if-else-if. Is this a gcc bug?
    sed -Ei '/pragma (end)?region/d' core/MsBinaryFile/XlsFile/Format/Logic/Biff_structures/StringPtgParser.cpp 
    # Fix missing unistd.h
    # TODO: use system zlib
    sed -i '1s/^/#include<unistd.h>\n/' core/OfficeUtils/src/zlib-1.2.11/gzwrite.c
    sed -i '1s/^/#include<unistd.h>\n/' core/OfficeUtils/src/zlib-1.2.11/gzread.c
    sed -i '1s/^/#include<unistd.h>\n/' core/OfficeUtils/src/zlib-1.2.11/gzlib.c
    sed -i '1s/^/#include<cmath>\n/' desktop-sdk/ChromiumBasedEditors/videoplayerlib/src/qtimelabel.cpp
    sed -i '1s/^/#include<cmath>\n/' desktop-sdk/ChromiumBasedEditors/videoplayerlib/src/qvideoslider.cpp
    sed -i '1s/^/#include<cmath>\n/' desktop-sdk/ChromiumBasedEditors/videoplayerlib/src/qvideoplaylist.cpp
    sed -i '1s/^/#include<QPainterPath>\n/' desktop-apps/win-linux/src/windows/platform_linux/cwindowplatform.cpp

    cd "$srcdir/build_tools"
    unset CFLAGS
    unset CXXFLAGS
    ./make.py --update-third-party-only
}

build() {
    cd build_tools
    local qt_ver="$(pacman -Q qt5-base | awk '{print $2}')"
    export QT_VERSION="${qt_ver//+*}"

    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    # -O2 causes a linker segfault during LTO
    export CFLAGS="${CFLAGS/-O2/}"
    export CXXFLAGS="${CXXFLAGS/-O2/}"
    # TODO: figure out which flag is causing linker error
    unset CFLAGS
    unset CXXFLAGS

    ./make.py --no-third-party-update
}

package() {
    cd build_tools
    ./make_package.py -P linux_x86_64 -T desktop -V "$pkgver" -B "$pkgrel"
    cd ../desktop-apps/win-linux/package/linux/tar
    tar xf onlyoffice-desktopeditors-"$pkgver"-"$pkgrel"-"$CARCH".tar.xz
    rm -f *.tar.xz

    install -d "$pkgdir"/opt/onlyoffice
    cp -r usr "$pkgdir"
    chmod +x "$pkgdir"/usr/bin/*
    # Symlink for backward compatibility
    ln -s onlyoffice-desktopeditors "$pkgdir"/usr/bin/desktopeditors
    cp -r opt "$pkgdir"

    # We are using system Qt5 and icu
    rm "$pkgdir"/opt/onlyoffice/desktopeditors/libQt5*
    rm "$pkgdir"/opt/onlyoffice/desktopeditors/libicu*
}
