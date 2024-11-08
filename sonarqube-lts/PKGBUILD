# Maintainer: Alex Brinister <IrVQ55Gw9TZ7BW8e@tuta.io>
# Contributor: Tobias Hübner <dasNeutrum@gmx.de>

_pkgname=sonarqube
pkgname=${_pkgname}-lts
pkgver=9.9.7.96285
pkgrel=1
pkgdesc="An open source platform for continuous inspection of code quality"
arch=('x86_64')
url="http://www.sonarqube.org/"
license=('LGPL3')
depends=('java-runtime=17' 'fontconfig' 'freetype2')
optdepends=('postgresql: A sophisticated object-relational DBMS')
backup=("etc/webapps/${_pkgname}/sonar.properties")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("https://binaries.sonarsource.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers"
        "99-${_pkgname}.conf")

sha256sums=('82eb93a1380dac4725ad24fd94a11917fb2e0ac6b9a9c98b20e436ed2a50f351'
            'b99f23d98b730a8b2e0ddc602dca68dddd080114e309ae34fbce99c98ad55f8d'
            'b0204a7b86289929765c651627e9b55d02ae1f0da34184d2c05c7929d1222932'
            '8edc5ca392fad3ebbe339ef2a4de3b27a897b732ad7bd5ad472822aac30f0e1c'
            '2052545a15ef9655b5835b8c9bf09936fad5bff990b964b86cfcfeb8eac23f48')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except conf and logs to /usr/share/webapps/sonarqube.
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,elasticsearch,extensions,lib,temp,web} "${pkgdir}/usr/share/webapps/${_pkgname}/"

    # Delete unused files.
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/macosx-universal-64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/windows-x86-64"

    # Install the license.
    install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Install the configuration files to /etc/webapps/sonarqube.
    install -Dm644 "conf/sonar.properties" "${pkgdir}/etc/webapps/${_pkgname}/sonar.properties"

    # Install the systemd configuration and service files.
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf

    # Install an example conf for required sysctl values (vm.max_map_count and fs.file-max); 
    # see https://docs.sonarsource.com/sonarqube/9.9/requirements/prerequisites-and-overview/#linux.
    install -Dm644 "99-${_pkgname}.conf" "${pkgdir}/usr/share/doc/${_pkgname}/99-${_pkgname}.conf"

    # Create symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/run"
    ln -s "/etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/conf"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/temp" 
    ln -s "/var/lib/${_pkgname}/temp" "${pkgdir}/usr/share/webapps/${_pkgname}/temp" 
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/data" 
    ln -s "/var/lib/${_pkgname}/data" "${pkgdir}/usr/share/webapps/${_pkgname}/data"
    ln -s "/var/lib/${_pkgname}/downloads" "${pkgdir}/usr/share/webapps/${_pkgname}/extensions/downloads"
}
