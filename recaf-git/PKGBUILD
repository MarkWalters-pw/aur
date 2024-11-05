# Maintainer: dreamscache.d <dreamscache.d@gmail.com>
_pkgname=recaf
pkgname=${_pkgname}-git
pkgver=r4448.02ba1332c
pkgrel=2
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-environment-openjdk=22" "ttf-font")
makedepends=("git" "jdk22-openjdk")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
replaces=("recaf")
source=("recaf::git+https://github.com/Col-E/Recaf#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	export JAVA_HOME="/usr/lib/jvm/java-22-openjdk"
	export GRADLE_USER_HOME="$srcdir/$_pkgname/.gradle"
	./gradlew --no-daemon build
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 "recaf-ui/build/libs/recaf-ui-"*"-all.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
	install -Dm644 "recaf-ui/src/main/resources/icons/logo-full.png" "$pkgdir/usr/share/pixmaps/recaf.png"
	printf '#!/usr/bin/env bash\nexec java -jar "/usr/share/java/%s/%s.jar" "$@"' "$_pkgname" "$_pkgname" > "recaf"
	printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=sh -c 'if [ -n \"\$0\" ]; then recaf --input=\"\$0\"; else recaf; fi' %%u\nIcon=recaf\nTerminal=false\nMimeType=application/java-archive\nCategories=Development;Java" "$pkgdesc" > "recaf.desktop"
	install -Dm755 "recaf" "$pkgdir/usr/bin/recaf"
	install -Dm644 "recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"
}
