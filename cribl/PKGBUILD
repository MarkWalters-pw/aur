# Maintainer: Artur Lukashenko <unitednf24@gmail.com>
pkgname=cribl
pkgver=4.6.0
criblver="b495abf6"
pkgrel=1
pkgdesc="Cribl Suite: Real-time log and machine data management. Ingest, transform, and route data for observability and analytics"
arch=("x86_64" "aarch64")
url="https://cribl.io"
license=("custom")
install="$pkgname.install"
source=("$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
sha256sums=("5701672085e61606516519489e65df53db939c0111ee47a0c175b0fa8b9e2f26"
            "37a2028501e3242e67b2e98ab5ff25805ff436a32f1e8373ea9dbe1e91cf6c57"
            "7b03bae0c9cc4e0b36b4126f9de9e866bb6a5a29e6af33da87858407bc17d624")
source_aarch64=("https://cdn.cribl.io/dl/$pkgver/$pkgname-$pkgver-$criblver-linux-arm64.tgz")
sha256sums_aarch64=("5cc632210fd5b744cb3d19f92103d97b479d78d9393513a6ee000d5143105e79")
source_x86_64=("https://cdn.cribl.io/dl/$pkgver/$pkgname-$pkgver-$criblver-linux-x64.tgz")
sha256sums_x86_64=("8f0c4b29c1320798650c1682521e1ff631ed7b5f5b7d1125a6a92a1d04c550ef")

package() {

    cd "$srcdir"
    install -vDm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
