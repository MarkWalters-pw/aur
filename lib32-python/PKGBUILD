# Maintainer: Arzet Ro <arzeth0 [at the] gmail [dot] com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-python
pkgver=3.12.5
pkgrel=5
_pybasever=3.12
pkgdesc="Next generation of the python high-level scripting language"
arch=('x86_64')
license=('custom')
url="http://www.python.org/"
depends=('lib32-expat' 'lib32-bzip2' 'lib32-gdbm' 'lib32-openssl' 'lib32-libffi' 'lib32-zlib' 'lib32-libtirpc' 'lib32-libnsl' 'lib32-readline' 'python')
makedepends=('lib32-tk' 'lib32-xz' 'lib32-sqlite' 'valgrind' 'lib32-bluez-libs' 'lib32-llvm')
optdepends=('lib32-sqlite'
            'lib32-xz: for lzma'
            'lib32-tk: for tkinter')
provides=('lib32-python3')
source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz"{,.asc}
        "python-config-32.patch")
sha512sums=('7a1c30d798434fe24697bc253f6010d75145e7650f66803328425c8525331b9fa6b63d12a652687582db205f8d4c8279c8f73c338168592481517b063351c921'
            'SKIP'
            'da50e8f95a630a48da579b32d06fd778d77c9974445e9eadec3529bb98ad8c3925c86a5786fa5d8072c9ccb70d8d3af71b23b0e5f617a2c4d5b2a21657a30790')
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D'  # Ned Deily (Python release signing key) <nad@python.org>
              'E3FF2839C048B25C084DEBE9B26995E310250568'  # Łukasz Langa (GPG langa.pl) <lukasz@langa.pl>
              'A035C8C19219BA821ECEA86B64E628F8D684696D'  # Pablo Galindo Salgado <pablogsal@gmail.com>
              '7169605F62C751356D054A26A821E680E5FA6305') # Thomas Wouters <thomas@python.org>

prepare() {
  cd "${srcdir}/Python-${pkgver}"
  
  # Give the configuration script an extention
  patch -Np1 -i "${srcdir}/python-config-32.patch"
  
  # Fix hard-coded paths
  sed -i "s|base}/lib|base}/lib32|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|/include|/lib32/python{py_version_short}/include|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|lib/|lib32/|g" "${srcdir}/Python-${pkgver}/Modules/getpath.c"
  sed -i "s|prefix)/lib|prefix)/lib32|g" "${srcdir}/Python-${pkgver}/Makefile.pre.in"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  #rm -rf Modules/_ctypes/{darwin,libffi}*
  
  # Currently it is impossible to build multilib system mpdecimal module
  # without conflicting header config errors.
  # rm -r Modules/_decimal/libmpdec
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'

  # No idea why, but when testing in VirtualBox VM, it is `unknown`, so set it to `no`
  export ax_cv_c_float_words_bigendian=no

  # Prefer the built-in libb2
  # in order to avoid accidentally depending on the system lib32-libb2.
  # Also, the support for bundled and external libb2 is removed in the upcoming Python 3.13:
  # https://github.com/python/cpython/commit/325e9b8ef400b86fb077aa40d5cb8cec6e4df7bb
  # Python 3.13 will bundle HACL instead: https://github.com/hacl-star/hacl-star
  export LIBB2_CFLAGS=' '
  export LIBB2_LIBS=' '
  sed -i 's/pkg_cv_LIBB2_CFLAGS="\$LIBB2_CFLAGS"/pkg_failed=yes/' configure
  sed -i 's/pkg_cv_LIBB2_LIBS="\$LIBB2_LIBS"/pkg_failed=yes/' configure

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --with-platlibdir=lib32 \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --libexecdir=/usr/lib32 \
              --includedir=/usr/lib32/python${_pybasever}/include \
              --exec_prefix=/usr/lib32/python${_pybasever}/ \
              --bindir=/usr/bin \
              --sbindir=/usr/sbin \
              --with-suffix='-32'

  make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd "${srcdir}/Python-${pkgver}"

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" install

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/scripts/
  
  # create symlinks
  ln -s python${_pybasever}-32-config ${pkgdir}/usr/bin/python3-32-config
  ln -s python${_pybasever}-32 ${pkgdir}/usr/bin/python-32
  ln -s python${_pybasever}-32-config ${pkgdir}/usr/bin/python-32-config

  # remove python3-config, conflicts with regular python
  rm -rf ${pkgdir}/usr/bin/python3-config

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Clean up
  rm -rf "${pkgdir}"/{etc,usr/share} # needs bin/ and include/

  # Leave the python binary and configure script for dependants to find the headers
  cd "${pkgdir}"/usr/bin
  rm pydoc* idle* 2to3*
}
