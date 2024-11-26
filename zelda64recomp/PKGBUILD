# Maintainer: AltoXorg <machinademoniko AT gmail DOT com>

# For package compiling issues, comment at the AUR package comments section or PM me on Discord @AltoXorg
# and I will try my best to resolve your problem if possible.
# This is much very experimental, so expect some game issues and crashes...

# An N64 Majora's Mask US ROM must be provided in order to build this package.
# Rename it to "baserom.mm.us.rev1.z64" and place it right to where this script is.

_RmlUi_commit=a893ea6386e0c842f90a726a53c9b9e888797519
_lunasvg_tag=v2.3.9
_mm_decomp_commit=5607eec18bae68e4cd38ef6d1fa69d7f1d84bfc8
_rt64_commit=e106c18965a89b26197bde972d9a83dd2dea1691
_sse2neon_commit=42c704755d3ec218ed9126a122f0a667beeb630a

_N64Recomp_commit=94b59d56f70228c3d3e3062cf1b1ab6ce42153c0
_mm_compat_commit=23beee0717364de43ca9a82957cc910cf818de90
_ido_static_recomp_commit=d6dd7fdea26cfe89dd01d7545618d4a9ae4f690a


_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}
pkgver=1.1.1
_zrecomp_dirname="${_reponame}-${pkgver}"
pkgrel=1
arch=("x86_64" "aarch64")
depends=("sdl2" "freetype2" "libx11" "libxrandr" "gtk3" "vulkan-driver" "vulkan-icd-loader")
makedepends=("git" "cmake" "ninja" "mold" "python" "make" "clang" "lld" "llvm" "mips-linux-gnu-binutils")
pkgdesc="A port of The Legend of Zelda Majora's Mask made possible by static recompilation"
license=("GPL-3.0-only")
conflicts=("${_pkgname}-bin")  #  i don't have control over this package so i'll append this anyway...
url="https://github.com/Zelda64Recomp/${_reponame}"
source=("${_zrecomp_dirname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"

        # main dependencies
        # We only fetch the required submodules for this linux platform
        "git+https://github.com/mikke89/RmlUi.git#commit=${_RmlUi_commit}"
        "git+https://github.com/sammycage/lunasvg.git#tag=${_lunasvg_tag}"
        "mm-decomp::git+https://github.com/zeldaret/mm#commit=${_mm_decomp_commit}"
        "git+https://github.com/rt64/rt64.git#commit=${_rt64_commit}"
        "git+https://github.com/DLTcollab/sse2neon.git#commit=${_sse2neon_commit}"

        # RT64 dependencies
        "git+https://github.com/epezent/implot.git"
        "git+https://github.com/redorav/hlslpp.git"
        #"git+https://github.com/mupen64plus/mupen64plus-win32-deps.git"
        #"git+https://github.com/mupen64plus/mupen64plus-core.git"
        "git+https://github.com/Cyan4973/xxHash.git"
        "git+https://github.com/zeux/volk.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/john-chapman/im3d.git"
        #"git+https://github.com/GPUOpen-LibrariesAndSDKs/D3D12MemoryAllocator.git"
        "dxc::git+https://github.com/rt64/dxc-bin.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/btzy/nativefiledialog-extended.git"

        # Tools for building MM elf and generating static recomps
        "mm-compat::git+https://github.com/zeldaret/mm#commit=${_mm_compat_commit}"
        "git+https://github.com/Mr-Wiseguy/N64Recomp.git#commit=${_N64Recomp_commit}"

        # N64Recomp dependencies
        "git+https://github.com/Decompollaborate/rabbitizer.git"
        "git+https://github.com/serge1/ELFIO.git"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/marzer/tomlplusplus.git"

        # Misc. patches and the rom requirement
        "mm-compat-disasm-script.patch::https://github.com/zeldaret/mm/pull/1606.patch"
        "zelda64recomp.desktop"
        "file://baserom.mm.us.rev1.z64")
source_aarch64=("git+https://github.com/decompals/ido-static-recomp.git#commit=${_ido_static_recomp_commit}")
sha256sums=('afb77583d01b73981e08dc6b31baced42abc39c7b3365968b095dc2d5104d2a1'
            'fffad7b6eb3c3cec5b4e9033a09c068d33fb0bf028cc1560a4b96d1a15db32f1'
            '9d3878d9f7d7f93a2181551b8271420fe32d33f7259b3744667bca659b7e2593'
            'dc421693786da0df9d309b07134d84edf6e513e986aab92327dfbc7c8bab4f68'
            '8eb9f91d4f69cc099d2de0d3ed72eec5138c0e6735d1e2d8bec979b178a9fde5'
            'ac242184d128281fb001c09f47638ec905b4cf42a6705a89f46606b8aaeac6bb'
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
            '3df28d035ed99e08e0bcca794e1912db00254c91bd4b32652b7d2db3a506a8b1'
            'ad0d188dd5cfa610456154ecedab2d020e20b641bc812956d7c84052003a51de'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '68fa964348231904c427d471091258de75308c7f0a77022fc8a009f8c6b9fae1'
            '59443fba2781cecccf96f76772a04764477c1c57d3226baa43d8cc3c30b085ad'
            'efb1365b3ae362604514c0f9a1a2d11f5dc8688ba5be660a37debf5e3be43f2b')
sha256sums_aarch64=('561f55850cc791c0bd3f29962675ef1a05f7c75a69c84215ff80a1008b99f59f')

# -- Per-repo submodules
# We only need some of them for this linux platform
_main_submodules=(
  RmlUi
  rt64
  #freetype-windows-binaries
  mm-decomp
  lunasvg
  sse2neon
)
_rt64_submodules=(
  implot
  hlslpp
  #mupen64plus-win32-deps
  #mupen64plus-core
  xxHash
  volk
  Vulkan-Headers
  VulkanMemoryAllocator
  imgui
  im3d
  #D3D12MemoryAllocator
  dxc
  stb
  nativefiledialog-extended
)
_n64recomp_submodules=(rabbitizer ELFIO fmt tomlplusplus)


PKG_PREFIX="/opt/${_pkgname}"

#  Print helpers
_msg_info() {
  echo "${BOLD}>> ${GREEN}$@${ALL_OFF}"
}

_msg_warn() {
  echo "${BOLD}>> ${YELLOW}$@${ALL_OFF}"
}

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
}

_init_submodules() {
  dir="$1"
  shift 1

  for sub in "$@"; do
    git submodule init "${dir}/${sub}"
    git config "submodule.${dir}/${sub}.url" "${srcdir}/${sub}"
    git -c protocol.file.allow=always submodule update "${dir}/${sub}"
  done
}

_symlink_submodules() {
  dir="$1"
  shift 1

  for sub in "$@"; do
    if [ ! -L "${dir}/${sub}" ]; then
      rm -rf "${dir}/${sub}"
      ln -srf "${srcdir}/${sub}" "${dir}/${sub}"
    fi
  done
}


prepare() {
  _msg_info "Setting up the submodules..."

  cd "${srcdir}/${_zrecomp_dirname}"
  _symlink_submodules lib "${_main_submodules[@]}"

  cd "${srcdir}/${_zrecomp_dirname}/lib/rt64"
  _init_submodules src/contrib "${_rt64_submodules[@]}"

  cd "${srcdir}/N64Recomp"
  _init_submodules lib "${_n64recomp_submodules[@]}"


  _msg_info "Patching stuff up..."


  cd "${srcdir}/${_zrecomp_dirname}"
  # Ignore warnings on GCC not just clang...
  # Unneeded since we use Clang compiler but just in case
  sed -i -e 's/__clang__/__GNUC__/' -e 's/clang/GCC/g' include/disable_warnings.h


  cd "${srcdir}/mm-compat"
  patch -Np1 < "${srcdir}/mm-compat-disasm-script.patch" || true
}

# yah this build process is a much bit complicated tbh
build() {
  _msg_info "Building the N64Recomp & RSPRecomp tools..."

  cd "${srcdir}/N64Recomp"

  cmake -B build -DCMAKE_BUILD_TYPE=Release .
  cmake --build build

  cp build/{N64Recomp,RSPRecomp} "${srcdir}/${_zrecomp_dirname}"

  if [ "$CARCH" != "x86_64" ]; then
    cd "${srcdir}/ido-static-recomp"
    if [[ ! -e target-built.stamp || "$(cat target-built.stamp)" != "${_mm_compat_commit}" ]]; then
      _msg_info "Building IDO compiler recompilation for $CARCH"

      # append our flags with the flags from this project's makefile
      export CFLAGS="$CFLAGS -MMD -fno-strict-aliasing -I." CXXFLAGS="$CXXFLAGS -MMD" LDFLAGS="$LDFLAGS -lm"

      make setup
      make VERSION=5.3 RELEASE=1
      make VERSION=7.1 RELEASE=1

      echo "${_mm_compat_commit}" > target-built.stamp
    fi

    rm -rf "${srcdir}/mm-compat/tools/ido_recomp/linux/"*
    ln -srf build/5.3/out "${srcdir}/mm-compat/tools/ido_recomp/linux/5.3"
    ln -srf build/7.1/out "${srcdir}/mm-compat/tools/ido_recomp/linux/7.1"
  fi

  cd "${srcdir}/mm-compat"
  cp "${srcdir}/baserom.mm.us.rev1.z64" .

  if [[ ! -e target-built.stamp || "$(cat target-built.stamp)" != "${_mm_compat_commit}" ]]; then
    _msg_info "Building the MM decomp-specific ELF file..."

    [ ! -e .venv ] && python -m venv .venv
    (
      # Unset the build flags so that we won't intervene from this host system to the decomp's compilation process
      unset CFLAGS CXXFLAGS LDFLAGS CC CPP CXX LD
      export RUN_CC_CHECK=0
      source .venv/bin/activate
      pip install -U -r requirements.txt

      # Mostly the same thing as the make init process with the only difference is to speed up time
      make distclean
      make setup
      make assets
      make disasm
      make uncompressed  # We only need the uncompressed stuff out
    )
    echo "${_mm_compat_commit}" > target-built.stamp
  else
    _msg_warn "Decomp ELF file already built, skipping..."
  fi

  # Copy both the elf file and the uncompressed rom
  cp mm.us.rev1.rom_uncompressed.{elf,z64} "${srcdir}/${_zrecomp_dirname}/"


  cd "${srcdir}/${_zrecomp_dirname}"

  _msg_info "Generating recomp functions..."
  ./RSPRecomp aspMain.us.rev1.toml
  ./RSPRecomp njpgdspMain.us.rev1.toml
  ./N64Recomp us.rev1.toml


  _msg_info "Building the game..."

  if _is_debug; then
    BUILD_TYPE=RelWithDebInfo
  else
    BUILD_TYPE=Release
  fi

  # The entirety of the codebase doesn't care about security at all so we'll remove this flag
  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  # use mold to speed up linking
  export LDFLAGS="$LDFLAGS -fuse-ld=mold"

  # The official build docs recommends using Clang,
  # but if you want to compensate file size or
  # just for your own sakes, you can use GCC.

  cmake -B build -GNinja . \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang

  cmake --build build $NINJAFLAGS
}


package() {
  cd "${srcdir}"

  bin_name=Zelda64Recompiled

  cat << SHELL > launch.sh
#!/usr/bin/env bash
cd "${PKG_PREFIX}"
exec ./${bin_name}
SHELL

  install -Dm755 "${_zrecomp_dirname}/build/${bin_name}" "${pkgdir}/${PKG_PREFIX}/${bin_name}"

  # Strip the executable whether you like it or not, except for debugging purposes...
  if ! _is_debug; then
    strip --strip-all "${pkgdir}/${PKG_PREFIX}/${bin_name}"
  fi

  cp -r --preserve=mode "${_zrecomp_dirname}/assets" "${pkgdir}/${PKG_PREFIX}/"
  install -Dm755 launch.sh "${pkgdir}/usr/bin/${bin_name}"
  install -Dm644 zelda64recomp.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${_zrecomp_dirname}/icons/512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zelda64recomp.png"

  install -Dm644 "${_zrecomp_dirname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
