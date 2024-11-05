# Maintainer: pappy <pa314159@users.noreply.github.com>

# https://help.sonatype.com/en/download-archives---repository-manager-3.html
_version=3.71.0
_patch=06

pkgname=nexus-oss
pkgver=${_version}.${_patch}
pkgrel=1
pkgdesc='Nexus 3 Repository OSS'
arch=('any')
url='http://nexus.sonatype.org'
license=("custom:$pkgname")
depends=('java-runtime-headless=17')
provides=($pkgname)
backup=("var/lib/$pkgname/etc/nexus.properties"
		"usr/lib/$pkgname/bin/nexus.vmoptions"
		)
source=(
		"https://download.sonatype.com/nexus/3/nexus-$_version-$_patch-unix.tar.gz"
		"$pkgname.install"
		"$pkgname.properties"
		"$pkgname.service"
		"$pkgname.sysusers"
		"$pkgname.tmpfiles"
		"pref_jre.cfg"
		)
sha256sums=('b025287558184677fc231035c9f5e5e6cc4bc1cafd76d13a06233a4ed09d08f6'
            'af6c075333c2b792bbe28820bde9f09d91da43dc3554c3ab6ab3cd7fa0cb85a6'
            'd4076f486fc6b2cc6bb457f874a2082c7ab018f407744b83f5edbd36573e00ac'
            '28d947b261c9087a16b0d5313aae92deccb03d4e109102eb702f4ab7e4899f44'
            '77d699b5ccf6387fa2f69df2cd71cdb75b4ffbf46a10110dd6c0e2802783dbef'
            'efd66ac28e622cdf58f5733bdced6654b170558834c3e4304b3a2dfb7d964994'
            'b57a14b2462899a8b5c03e1b721e6fcae594934dcf0c4be842692b276d6700ae')

install=$pkgname.install

package() {
	install -dm755 $pkgdir/usr/lib
	install -dm750 $pkgdir/var/lib/$pkgname
	install -dm750 $pkgdir/var/log/$pkgname

	cp -a $srcdir/nexus-$_version-$_patch $pkgdir/usr/lib/$pkgname

	install -Dm640 $srcdir/$pkgname.properties $pkgdir/var/lib/$pkgname/etc/nexus.properties
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -m644 pref_jre.cfg $pkgdir/usr/lib/$pkgname/.install4j
	install -Dm644 $srcdir/nexus-$_version-$_patch/OSS-LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

	pushd $pkgdir/usr/lib/$pkgname
	sed -i s:../sonatype-work/nexus3:/var/lib/$pkgname:g bin/nexus.vmoptions
	rm -rf bin/nexus.rc bin/contrib *LICENSE.txt
	popd

	chmod -R o-rwx $pkgdir/var/lib/$pkgname
}

