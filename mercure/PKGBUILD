# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=mercure
pkgver=0.16.3
pkgrel=1
pkgdesc='Server-sent live updates: protocol and reference implementation'
arch=('x86_64')
url='https://mercure.rocks'
license=('AGPL3')
backup=('etc/mercure/Caddyfile' 'etc/mercure/dev.Caddyfile')

source=('mercure.service' 'mercure.sysusers' 'mercure.tmpfiles' 'Caddyfile' 'dev.Caddyfile')
source_x86_64=("mercure-${pkgver}_x86_64::https://github.com/dunglas/mercure/releases/download/v${pkgver}/mercure_Linux_x86_64.tar.gz")

sha512sums=('c6b650f7cb4a59197170f0675585eae04d235f5a52eba3d232813d7e4b8bc5a3be0c56bcf6a9e133b81e32e139991dfc54bdc0a85b8d9e16718bdf40b7c01394'
            '9dd5104f850e8aca3b420de6ac407e42fd32bde145d9ac9d47fa00e101a4f5f64136b745bb467ea8b250099bc80ae84baf1fa46b972cdc37a61aa5057c02ad67'
            '68236e714ba954332f4ee2a9f558795cfcdfd32d2162fa5f369a1d0f38d8524c23199f1b14df39670d001a769bb460f1431caa84dec108f37129ead5d3d04391'
            'ebc6c3ce7f9d9d35f9a91eaecdd41958719f0081ddc1b42b52800c839a63dc8f0c07bc59e289022ccb0478381d2512e5d9a883869f56365601bf0c37e684000d'
            '66d5f99fe323ef91058d73d083ef6201b2129720dda36709b6a04789f4f0d08c8e959e27113668d09e07f012eb324cb5ec9a79724923329a8ca007800ab677e5')
sha512sums_x86_64=('7a75abf7b05951cc2869cb8b725694afeab9e0295bd50be1f8da7acaedd5564fd82da2f3c2ddca4014da0f930fad485f09ba7c63e4233d524cc9d43c06e4cd32')

package(){
  install -Dm 755 mercure "${pkgdir}"/usr/bin/mercure
  install -Dm 755 mercure.service "${pkgdir}"/usr/lib/systemd/system/mercure.service
  install -Dm 644 mercure.sysusers "${pkgdir}"/usr/lib/sysusers.d/mercure.conf
  install -Dm 644 mercure.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mercure.conf
  install -Dm 644 ../Caddyfile "${pkgdir}"/etc/mercure/Caddyfile
  install -Dm 644 ../dev.Caddyfile "${pkgdir}"/etc/mercure/dev.Caddyfile
}
