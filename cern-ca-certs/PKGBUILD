# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
pkgname=cern-ca-certs
pkgver=20230604_1
pkgrel=1
pkgdesc="CERN CA certificates"
arch=("any")
url="https://ca.cern.ch/ca/"
license=(unknown)
depends=(p11-kit ca-certificates-utils)
makedepends=(rpmextract)

_version=${pkgver//_/-}
source=("https://linuxsoft.cern.ch/cern/centos/s9/CERN/x86_64/Packages/c/CERN-CA-certs-${_version}.el9.cern.noarch.rpm")
sha256sums=('09b9ff98bd6881b7409e2793ee0c07fa20051fe7f94a0bbc7fafd0942d7eb738')

install=cern-ca-certs.install

package() {
    rpmextract.sh *.rpm
    mkdir -p ${pkgdir}/etc/ca-certificates/trust-source/anchors
    mv ${srcdir}/etc/pki/tls/certs/*.crt ${pkgdir}/etc/ca-certificates/trust-source/anchors
}
