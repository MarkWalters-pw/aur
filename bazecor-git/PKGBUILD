# Maintainer: Tim Quelch <tim@tquelch.com>

_pkgname="bazecor"
_branch="development"
pkgname="${_pkgname}-git"
pkgver=1.4.3.4439
pkgrel=1
pkgdesc="Graphical configurator for Dygma Raise. Development branch"
url="https://github.com/Dygmalab/Bazecor"
license=("GPL3")
depends=("fuse")
makedepends=("yarn" "git" "nvm" "squashfs-tools" "python" "jq")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64")
source=("${pkgname}::git+https://github.com/Dygmalab/Bazecor.git#branch=${_branch}")
cksums=("SKIP")
options=(!strip)
install="bazecor.install"

# From https://wiki.archlinux.org/title/Node.js_package_guidelines
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
    cd "$srcdir/$pkgname" || return
    printf "%s.%s" \
        "$(jq -r '.version' package.json | sed 's/-/_/g')" \
        "$(git rev-list --count HEAD)"
}

prepare() {
    _ensure_local_nvm
    nvm install 20
    nvm use 20
}

# Bazecor checks whether a udev config file as a particular filename has certain contents. If it
# doesn't, it prompts the user to create this (with root escalation). Instead of relying on creating
# this file at runtime we extract the expected contents here and distribute it with the package.
_extract_udev_rules() {
    udevPath=${srcdir}/${pkgname}/src/main/utils/udev.ts

    udevPatchedName=udev-patched.ts

    pushd "$(dirname $udevPath)"

    # We copy the module and add a line at the end to output the contents of the specified variable.
    # We then execute this with node to get the value as a shell variable.
    # The filename has changed over time as more rules have been added upstream. By programaticaly
    # extracting it here we don't have to keep track of the changing gname
    cp "$(basename "$udevPath")" "$udevPatchedName"
    echo "process.stdout.write(filename)" >> "$udevPatchedName"
    udevFilename=$(npm exec ts-node -- "$udevPatchedName")

    cp "$(basename "$udevPath")" "$udevPatchedName"
    echo "process.stdout.write(udevRulesToWrite)" >> "$udevPatchedName"
    udevContents=$(npm exec ts-node -- "$udevPatchedName")

    rm "$udevPatchedName"
    popd

    # Save the contents to a file which will later be installed
    echo "$udevContents" > "${srcdir}/${pkgname}/$(basename "$udevFilename")"
}

build() {
    _ensure_local_nvm
    pushd "$srcdir/$pkgname"
    yarn || /bin/true           # yarn errors, but seems to still work

    # mksquashfs will throw a error if both the SOURCE_DATE_EPOCH 
    # environment variable and the -all-time flag are set.
    unset SOURCE_DATE_EPOCH

    yarn run make-lin

    popd

    # We extract the appimage so that we can access the desktop and the icons
    _appimage=$(find "${srcdir}/${pkgname}" -iname "*.AppImage")
    chmod +x "${_appimage}"
    "$_appimage" --appimage-extract

    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname^}.desktop"
    chmod -R a-x+rX squashfs-root/usr

    _extract_udev_rules
}

package() {
    # AppImage
    # We assume that there is only one output that matches this pattern
    _appimage=$(find "${srcdir}/${pkgname}" -iname "*.AppImage")
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Symlink AppImage
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # udev rules
    # We assume that the filename extracted for udev rules has the suffix ".rules".
    _udevRules=$(find "${srcdir}/${pkgname}" -maxdepth 1 -iname "*.rules")
    install -Dm755 "${_udevRules}" "${pkgdir}/etc/udev/rules.d/$(basename "$_udevRules")"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname^}.desktop"\
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
