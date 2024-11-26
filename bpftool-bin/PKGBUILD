# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=bpftool-bin
pkgver=7.4.0
pkgrel=1
pkgdesc='bpftool is a tool for inspection and simple manipulation of eBPF programs and maps'
url='https://github.com/libbpf/bpftool'
source=("https://github.com/libbpf/bpftool/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("https://github.com/libbpf/bpftool/releases/download/v$pkgver/bpftool-v$pkgver-amd64.tar.gz")
source_aarch64=("https://github.com/libbpf/bpftool/releases/download/v$pkgver/bpftool-v$pkgver-arm64.tar.gz")
arch=('x86_64' 'aarch64')
makedepends=('python-docutils')
provides=('bpftool')
conflicts=('bpftool')
license=('GPL-2.0-only')
changelog='CHANGELOG'
b2sums=('ae7b6bc6cb742712981ba8972bcecccc63d440b2a77c5a14f91ba5106c013774313d65fd3f42b843ba4027ab17cf9d44d256270f7f8ad11907714f16f3149078')
b2sums_x86_64=('b4dff22034220336363faa30c7792b104e7bb6ead860510503d2c234f0ec98e099c2fdae2738956990100aa4898e63ce3a420d46aaa0aefb879234d8723a51cb')
b2sums_aarch64=('302a8d7caaae9d0ea850e455e99f62a9c3c0c7f60d90f2797422fd10b7631ff7588595950c59ecf5761510a3f7b447c072ed8224dde485d54e7f0bec937fb8f4')

package() {
  cd "$srcdir"
  install -Dm755 bpftool "$pkgdir/usr/bin/bpftool"

  cd "bpftool-$pkgver"
  install -Dm644 bash-completion/bpftool "$pkgdir/usr/share/bash-completion/completions/bpftool"

  cd "docs"
  make
  install -Dm644 -t "$pkgdir/usr/share/man/man8" *.8
}
