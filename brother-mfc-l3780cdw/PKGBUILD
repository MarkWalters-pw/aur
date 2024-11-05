# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=brother-mfc-l3780cdw
pkgver=3.5.1_1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L3780CDW"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcl3780cdw_us_as&os=128&dlid=dlf105764_000&flang=4&type3=10283"
license=('LicenseRef-brother')
depends=('cups' 'ghostscript' 'perl')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')

source=("https://download.brother.com/welcome/dlf105764/mfcl3780cdwpdrv-${pkgver/_/-}.i386.deb")
sha256sums=('0973b0836578c0c3b55298b07046a86d5c57eea9d7118d20f06cfb68bc35ffec')

package(){
    tar -xaf ${srcdir}/data.tar.gz -C ${pkgdir}/
    cd "${pkgdir}/opt/brother/Printers/mfcl3780cdw"

    # symlink cups filters
    install -d "${pkgdir}/usr/lib/cups/filter/"
    ln -s "/opt/brother/Printers/mfcl3780cdw/cupswrapper/brother_lpdwrapper_mfcl3780cdw" "${pkgdir}/usr/lib/cups/filter"

    # symlink cups ppd files
    install -d "${pkgdir}/usr/share/cups/model/"
    ln -s "/opt/brother/Printers/mfcl3780cdw/cupswrapper/brother_mfcl3780cdw_printer_en.ppd" "$pkgdir/usr/share/cups/model"

    # install license files
    install -Dm644 LICENSE_ENG.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
    install -Dm644 LICENSE_JPN.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_JPN.txt"
}
