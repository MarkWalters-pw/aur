# Maintainer: Manuel de la Fuente <aur at manuelfte dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: klepz <felipe.junger@aluno.ufabc.edu.br>
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=chrome-remote-desktop-existing-session
_pkgname=chrome-remote-desktop
pkgver=130.0.6723.14
pkgrel=1
pkgdesc="Access other computers or allow another user to access your computer securely over the Internet. Patched to allow connections to the existing X session."
arch=("x86_64")
url="https://remotedesktop.google.com"
license=("BSD")
depends=("gtk3" "libutempter" "libxss" "nss" "python-packaging" "python-psutil" "python-pyxdg" "xf86-video-dummy" "xorg-xhost" "xorg-server-xvfb" "xorg-setxkbmap" "xorg-xauth" "xorg-xdpyinfo" "xorg-xrandr")
conflicts=("${_pkgname}" "${_pkgname}-bin")
install="${_pkgname}.install"
source=(
  "${_pkgname}-${pkgver}.deb::https://dl.google.com/linux/${_pkgname}/deb/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
  "${_pkgname}.service"
  "pamrule"
  "crd"
  "xdg-base-directory.patch"
  "use_existing_session.patch"
)
sha256sums=(
  "20a70b57c56eefcbf791bdaabda510fedd801c9e50985a5eecaae001730fdad7"
  "e5da5ae89b5bc599f72f415d1523341b25357931b0de46159fce50ab83615a4b"
  "fcc38269eb1cc902abff9688eda9377a22367e39b9f111f87c0dd8e77adb82e2"
  "021110f49d465294517eec92eeb24ebca41e264ef33cbdda78732add1f269d02"
  "90bcfab85a87cfa6d038a55c556206f74b22eb03644ea51f46732cfb27679963"
  "e1fdb8846103403067effef547fe43520244c46ca2eaa2863f7443bc832c16b7"
)

# curl -qs https://dl.google.com/linux/chrome-remote-desktop/deb/dists/stable/main/binary-amd64/Packages | grep "^Version\|^SHA256" | awk '{print $2}'

prepare() {
  cd "${srcdir}"

  bsdtar -xf data.tar.xz -C .
  
  # Removing unnecessary .deb related files
  rm -R "${srcdir}/etc/cron.daily"
  rm -R "${srcdir}/etc/init.d"
  rm -R "${srcdir}/etc/pam.d"

  # Fix problem with missing import xdg.BaseDirectory, fixing xorg_binary location
  patch -Np1 -i "${srcdir}/xdg-base-directory.patch"

  # Fix problem with creating a new X session instead of connecting to the existing one
  patch -Np1 -i "${srcdir}/use_existing_session.patch"
  # Credits: https://gist.github.com/nightuser/2ec1b91a66ec33ef0a0a67b6c570eb40
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/etc/"* "${pkgdir}/etc"
  cp -r "${srcdir}/opt/"* "${pkgdir}/opt"
  install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/copyright"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -Dm644 "${srcdir}/lib/systemd/system/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
  install -Dm644 "${srcdir}/pamrule" "${pkgdir}/etc/pam.d/${_pkgname}"
  install -Dm755 "${srcdir}/crd" "${pkgdir}/usr/bin/crd"
  install -dm755 "${pkgdir}/etc/chromium/native-messaging-hosts"
  
  for _file in $(find "${pkgdir}/etc/opt/chrome/native-messaging-hosts" -type f); do
    local _filename=$(basename ${_file})
    if [[ ! -f "/etc/chromium/native-messaging-hosts/${_filename}" ]]; then
      ln -s "/etc/opt/chrome/native-messaging-hosts/${_filename}" "${pkgdir}/etc/chromium/native-messaging-hosts/${_filename}"
    fi
  done
  chmod u+s "${pkgdir}/opt/google/${_pkgname}/user-session"
}
