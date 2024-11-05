# Maintainer:
# Contributor: Figue <ffigue at gmail dot com>

## options
: ${_install_path:=opt}
: ${_rh_pkgrel:="1.rh1.fc42"}

## basic info
_pkgname="icecat"
pkgname="$_pkgname-bin"
pkgver=115.17.0
pkgrel=1
pkgdesc="GNU version of the Firefox ESR browser"
url="https://koji.fedoraproject.org/koji/packageinfo?packageID=19055"
license=('MPL-2.0')
arch=('x86_64')

provides=("icecat=$pkgver")
conflicts=('icecat')

options=('!strip' '!debug')

_dl_url="https://kojipkgs.fedoraproject.org/packages/icecat/$pkgver/$_rh_pkgrel/$CARCH/"
_dl_file="icecat-$pkgver-$_rh_pkgrel.$CARCH.rpm"

source=("$_dl_url/$_dl_file")
sha256sums=('bd96112de759449f613c70cfc2785593fbde3a18915ea5996998ae6e6ae84742')

package() {
  depends=(
    'alsa-lib'
    'dbus-glib'
    'gtk3'
    'libvpx'
    'nspr'
    'nss'
  )

  # main files
  _path="$pkgdir/$_install_path"
  install -dm755 "$_path"
  mv usr/lib64/icecat "$_path/"

  # duplicate binary
  ln -sf icecat-bin "$_path/$_pkgname/icecat"

  # icon, desktop file
  _path="$pkgdir/usr/share"
  install -dm755 "$_path"
  mv usr/share/icons "$_path/"
  mv usr/share/applications "$_path/"

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # disable auto-updates
  local _policies_json="$pkgdir/$_install_path/$_pkgname/distribution/policies.json"
  install -Dm644 /dev/stdin "$_policies_json" << END
{
  "policies": {
    "DisableAppUpdate": true
  }
}
END

  # custom defaults
  local vendorjs="$pkgdir/$_install_path/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$vendorjs" << END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable JPEG XL images
pref("image.jxl.enabled", true);

// Prevent about:config warning
pref("browser.aboutConfig.showWarning", false);

// Prevent telemetry notification
pref("services.settings.main.search-telemetry-v2.last_check", $(date +%s));
END

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
