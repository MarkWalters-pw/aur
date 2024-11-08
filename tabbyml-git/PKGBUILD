# Maintainer: Ben Davis <bendavis78@gmail.com>

_appname="tabbyml"
_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname="${_appname}-git"
pkgrel=1
pkgver=nightly.r5.gaabc22e
pkgdesc="Opensource, self-hosted AI coding assistant"
arch=("x86_64")
url="https://tabby.tabbyml.com"
license=("MIT")
groups=()
depends=("python311" "protobuf" "sqlite3" "graphviz")
makedepends=("git" "make" "rust" "sqlite3")
provides=("tabby")
source=(
    "${pkgname}::git+https://github.com/TabbyML/tabby"
    "git+https://github.com/ggerganov/llama.cpp"
    "tabbyml-server.service"
    "server.conf"
    "config.toml"
)
install="${pkgname}.install"
sha1sums=('SKIP'
          'SKIP'
          '946b6b1d5169ff57246ac63c0717f633c1fb7af6'
          'a3f26d5c57e74da76d51c7ed28753b0b867a95b7'
          '4138aaeed2a83024398acd0a117821824b24b843')
options=("!strip" "!debug")

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.crates/llama-cpp-server/llama.cpp.url "$srcdir/llama.cpp"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname"
    unset SQLX_OFFLINE  # Not sure what's causing this to be set, but it causes build failre
    export RUSTFLAGS="--remap-path-prefix ${srcdir}/${pkgname}="
    cargo build --release
}

package() {
    # Install systemd service
    install -Dm644 "./tabbyml-server.service" "$pkgdir/usr/lib/systemd/system/tabbyml-server.service"

    # Install the default config file to /usr/share/$_appname/tabbyml.conf
    install -d "$pkgdir/usr/share/$_appname"
    install -Dm644 "./server.conf" "$pkgdir/usr/share/$_appname/server.conf"
    install -Dm644 "./config.toml" "$pkgdir/usr/share/$_appname/config.toml"

    install -d "$pkgdir${_appprefix}/$_appname"  # /opt/tabbyml
    install -d "$pkgdir${_appdataprefix}/$_appname"  # /var/opt/tabbyml (TABBY_ROOT)
    
    # install binaries
    install -Dm755 "$srcdir/$pkgname/target/release/tabby" "$pkgdir${_appprefix}/$_appname/bin/tabby"
    install -Dm755 "$srcdir/$pkgname/target/release/llama-server" "$pkgdir${_appprefix}/$_appname/bin/llama-server"
}
