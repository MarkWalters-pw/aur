pkgname=jacartauc
pkgver=3.1.2.3478
pkgrel=1
pkgdesc="JaCarta Unified Client"
arch=("x86_64")
url="https://www.aladdin-rd.ru/support/downloads/jacarta/"

depends=(
  at-spi2-core
  bash
  cairo
  dbus
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libdrm
  libx11
  libxcb
  libxext
  libxkbcommon
  libxkbcommon-x11
  libxrender
  pango
  pcsclite
  systemd-libs
  zlib
)

source=("https://www.aladdin-rd.ru/upload/downloads/JaCarta_UC/jacarta-3.1/lunix/distributions/jacartauc_${pkgver}_rpm_x64.zip")
sha256sums=("06c1995c44702a46851a842d7c96f3b4a06fb5c12166b0100a7adef6614042fb")
options=(!strip !debug)

install="jacartauc.install"

package() {
  
  bsdtar -xvf "$srcdir"/jcsecurbio_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jcpkcs11-2_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jacartauc_*_x64.rpm -C "$pkgdir"
  
  mv "$pkgdir/tmp" "$pkgdir/opt/jacartauc/scripts" # keep installation scripts
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" # arch just symlinks /usr/lib64 to /usr/lib
  gunzip "$pkgdir/opt/jacartauc/bin/JaCartaUC.gz" # unpack binary

}