# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: Kim Brandt <myrveln@gmail.com>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=newrelic-php5
pkgver=11.0.0.13
pkgrel=1
pkgdesc='PHP Monitoring Agent'
arch=('aarch64' 'x86_64')
url='https://newrelic.com/php'
license=('Apache-2.0')
backup=('etc/php/conf.d/newrelic.ini')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.newrelic.com/php_agent/archive/$pkgver/$pkgname-$pkgver-linux.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('6a1f7017bf3a10fcd6cc00be846574a89802271cd609eaf70efc4452d48c23c300966d2e24f2bb9552ec11da1d8812558838f4bcbca60ba3c41aec4a422de815')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

package() {
    depends=('glibc'
             'php')
    optdepends=('logrotate: log rotation support')

    case "$CARCH" in
    'aarch64')
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.aarch64" "$pkgdir/usr/bin/newrelic-daemon"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/aarch64/newrelic-20230831.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
        ;;
    'x86_64')
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.x64" "$pkgdir/usr/bin/newrelic-daemon"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-20230831.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
        ;;
    *)
        echo "Unsupported architecture: $CARCH"
        exit 1
        ;;
    esac

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.cfg.template" "$pkgdir/etc/newrelic/newrelic.cfg"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini"

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic-daemon.service" "$pkgdir/usr/lib/systemd/system/newrelic-daemon.service"

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic-daemon.logrotate" "$pkgdir/etc/logrotate.d/newrelic-daemon"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"

    install -Dm644 "$srcdir/$pkgname-$pkgver/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
