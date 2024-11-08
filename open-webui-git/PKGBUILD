# Maintainer: Ben Davis <bendavis78@gmail.com>

_appname="open-webui"
_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname="${_appname}-git"
pkgrel=1
pkgver=0.3.8.r16.geff736a
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=("x86_64")
url="https://openwebui.com/"
license=("MIT")
groups=()
depends=("python311")
makedepends=("git" "npm")
provides=("stable-diffusion-ui")
source=(
    "${pkgname}::git+https://github.com/open-webui/open-webui"
    "open-webui.service"
    "open-webui.conf"
)
install="${pkgname}.install"
sha1sums=('SKIP'
          '9b789adb8d91f15ece2187af4aec810847d4b0b2'
          'fb015c224b9529988823f0e24d65ab4a004d30c0')
options=("!strip" "!debug")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    npm install
    npm run build
}

package() {
    # Install systemd service
    install -Dm644 "./$_appname.service" "$pkgdir/usr/lib/systemd/system/$_appname.service"

    # Install the default config file to /usr/share/$_appname/open-webui.conf
    install -d "$pkgdir/usr/share/$_appname"
    install -Dm644 "./$_appname.conf" "$pkgdir/usr/share/$_appname/$_appname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir${_appprefix}"  # /opt

    install -d "$pkgdir${_appprefix}/$_appname"
    install -d "$pkgdir${_appdataprefix}/$_appname"
    
    # copy over files
    cp -R "$srcdir/${pkgname}/." "$pkgdir${_appprefix}/$_appname"

    # clean up stuff we don't need
    rm -rf "$pkgdir${_appprefix}/$_appname/node_modules"
    rm -rf "$pkgdir${_appprefix}/$_appname/.git"

    # Fix permissions
    echo "Setting permissions for $pkgdir${_appprefix}/$_appname" 
    chmod 755 "$pkgdir${_appprefix}/$_appname"
    find "$pkgdir${_appprefix}/$_appname" -type d -exec chmod 755 {} \;
    find "$pkgdir${_appprefix}/$_appname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdir${_appdataprefix}/$_appname" 
    chmod 755 "$pkgdir${_appdataprefix}/$_appname"
    find "$pkgdir${_appdataprefix}/$_appname" -type d -exec chmod 775 {} \;
    find "$pkgdir${_appdataprefix}/$_appname" -type f -exec chmod 664 {} \;
}
