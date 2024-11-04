# Maintainer: o.s.dv.f@seznam.cz
pkgname=deshader-git
pkgver=re11bb4f
pkgrel=1
pkgdesc="Shader debugging via GLSL code instrumentation. This is preliminary package, does not coply with all package guidelines."
arch=(armv7h
      aarch64
      x86_64
      i686)
url="https://github.com/OSDVF/deshader"
depends=('gtk3'
         'webkit2gtk')
makedepends=('git'
             'zig=0.13.0'
             'binutils'
             'unzip'
             'curl'
             'zip'
             'tar'
             'pkgconf'
             )
optdepends=("vcpkg: for building with system'S VCPKG; downloaded internally at build when not present"
            "bun: for building Editor with system's bun; downloaded internally at build when not present"
            "wolfssl: will be installed by VCPKG when not present"
            "glslang: will be installed by VCPKG when not present"
            "libnfd: will be installed by VCPKG when not present")
options=('!lto')
provides=("deshader=$pkgver"
          "deshader-run=$pkgver"
          "libdeshader.so")
conflicts=('deshader'
          'deshader-run')
source=('deshader.desktop'
        '48.png'
        '256.png'
        'scalable.svg'
        'git+https://github.com/OSDVF/deshader.git')
sha256sums=('a6ba07a7cd31917da89e94930cba71e78f079dccfc7449b537247ded63822e3d'
            '00bcebeeb6423504e5b877c398751bfa15df23266131ffe1fb3058e2f1511de4'
            'dd20694f4cc973e44ce5df87a7da166515aa9df6a8045fa13df726980308aa92'
            '7869f875bc5c6144b149f34e5ae13327707fbd12394db057976012d3240ada8e'
            'SKIP')
license=('GPL-3.0-or-later')

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    printf "r%s" "$(git describe --tags --always)"
}

build_deshader() {
    zig build deshader --release=safe && # do not override build flags by makepkg
    zig build generate_headers generate_stubs
}

build() {
    # do not override build flags by makepkg -- will corrupt the build for use with Zig
    export CFLAGS=""
    export CXXFLAGS=""
    export CPPFLAGS=""
    export LDFLAGS="-z,itb,-z,shstk"

    cd "$srcdir/${pkgname%-git}" || exit 1
    if ! build_deshader; then # must be ran twice to fix the C import
        sh fix_c_import.sh
        echo "Retrying build"
        build_deshader
    fi
    zig build launcher --release=safe
}

check() {
    pass=false
    for line in $(DESHADER_LIB="$srcdir/${pkgname%-git}/zig-out/lib/libdeshader.so" "$srcdir/${pkgname%-git}/zig-out/bin/deshader-run" -version)
    do
        if [ $pkgver == "r$line" ]; then
            pass=true
            echo "Built $pkgver matches"
            break
        fi
    done
    if ! $pass; then
        echo "Version mismatch"
        exit 1
    fi
}

prepare() {
    export PATH="$srcdir/dep/bin:$srcdir/vcpkg:$PATH"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/dep/.zig-cache"
    export VCPKG_DEFAULT_BINARY_CACHE_DIR="$srcdir/dep/.vcpkg-cache"
    export VCPKG_DISABLE_METRICS=1

    # get the submodules
    cd "$srcdir/${pkgname%-git}" || exit 1

    git submodule update --init --recursive

    cd "$srcdir" || exit 1
    # check for bun in the path
    if ! command -v bun; then
        # download bun
        curl -fsSL https://bun.sh/install | BUN_INSTALL="$srcdir/dep" bash
    fi

    # check for VCPKG
    if ! command -v vcpkg; then
        # check for downloaded VCPKG repository
        if [ -d "$srcdir/vcpkg" ]; then
            # check if it is a git repository
            if [ -d "$srcdir/vcpkg/.git" ]; then
                # update VCPKG
                cd "$srcdir/vcpkg" || exit 1
                git pull
            else
                # remove the directory
                rm -rf "$srcdir/vcpkg"
            fi
        
        else
            # download VCPKG
            git clone https://github.com/microsoft/vcpkg.git
        fi
        cd "$srcdir/vcpkg" || exit 1
        chmod +x ./bootstrap-vcpkg.sh
        ./bootstrap-vcpkg.sh
    fi
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    install -m755 "$srcdir/${pkgname%-git}/zig-out/bin/deshader-run" "$pkgdir/usr/bin/deshader-run"
    install -m755 "$srcdir/${pkgname%-git}/zig-out/lib/libdeshader.so" "$pkgdir/usr/lib/libdeshader.so"

    #install headers
    install -d "${pkgdir}/usr/include/deshader"
    for h in "$srcdir/${pkgname%-git}/zig-out/include/deshader/"*; do
        install -m644 "$h" "$pkgdir/usr/include/deshader/"
    done

    #install desktop file and icons
    install -m644 "$srcdir/deshader.desktop" "$pkgdir/usr/share/applications/deshader.desktop"
    install -m644 "$srcdir/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/deshader.png"
    install -m644 "$srcdir/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/deshader.png"
    install -m644 "$srcdir/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/deshader.svg"
}
