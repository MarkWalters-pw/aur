# Maintainer: Daniil Redchin <redchindaniil@gmail.com> <github.com/USSURATONCACHI>
pkgname=novpn
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool to easily run programs with access to only one network device"
arch=('any')
url="https://github.com/USSURATONCACHI/novpn"
license=('Apache-2.0')

# Every single one is used and is essential
depends=('bash' 'firejail' 'iproute2' 'iptables' 'grep' 'gawk' 'coreutils' 'systemd')
makedepends=('coreutils')

install=novpn.install

source=(
    novpn
    novpn_ns
    
    nu_configure_default.sh
    nu_down.sh
    nu_get_gateway.sh
    nu_ip_offset.sh
    nu_params.sh
    nu_print_params.sh
    nu_up.sh
    nu_wait_for_device.sh

    novpn-config
    novpn-systemd.service
)
sha256sums=('57b1ce95755407cc399e201a4165cd3d3dfaefadada2337cf950cfa510b27c5f'
            '76d69aecb279e2139ca68cc667805ed75e4644964a9535c303238f8ce04972d3'
            'aa5c031251c5ee0a8f0550a312e6f296001129bb9541131c269d34c7bf2a4e9a'
            '8ceec976673ac6dd1895d5d992d2b46f0f877dd87e7b5052996684e966df99a5'
            '9265915e6d79677797a625515d4a2273d58ce1ec512e6511df31126f9fa01810'
            '856d623ca751333f010e804d60ee3cf3c794065c043df1027271a1c8db68edd2'
            '5a43f34ed78ae678c26a7439e7f6ebfee50b4546f63595aadd9dbf63703a6101'
            'c0139cf5c179aea7d50219474a3ae786530dedb26f4e7dd8fd4d2632e0545458'
            '26c40f786a093bc71c86914439f4c4ce9ce6b1ae0523a66fe7967ea7d3d46790'
            '7282ff1ab4148406a754e1fe98187c0077984040fb4a8ec46e72a7a627dafa28'
            'e7c20baf88e074c14c1c39f7c7a5ce3ebd12e6af02026a8f794171421aa7bd40'
            'dfda90177b5d8fbe74e09d232a0eda684fad8b2b0d0f2b41662a00ed06fb8ef7')



package() {
    install -Dm755 "${srcdir}/novpn"     "${pkgdir}/usr/bin/novpn"
    install -Dm755 "${srcdir}/novpn_ns"  "${pkgdir}/usr/bin/novpn_ns"

    install -Dm755 "${srcdir}/nu_configure_default.sh" "${pkgdir}/usr/bin/novpn_utils/nu_configure_default.sh"
    install -Dm755 "${srcdir}/nu_down.sh"              "${pkgdir}/usr/bin/novpn_utils/nu_down.sh"
    install -Dm755 "${srcdir}/nu_get_gateway.sh"       "${pkgdir}/usr/bin/novpn_utils/nu_get_gateway.sh"
    install -Dm755 "${srcdir}/nu_ip_offset.sh"         "${pkgdir}/usr/bin/novpn_utils/nu_ip_offset.sh"
    install -Dm755 "${srcdir}/nu_params.sh"            "${pkgdir}/usr/bin/novpn_utils/nu_params.sh"
    install -Dm755 "${srcdir}/nu_print_params.sh"      "${pkgdir}/usr/bin/novpn_utils/nu_print_params.sh"
    install -Dm755 "${srcdir}/nu_up.sh"                "${pkgdir}/usr/bin/novpn_utils/nu_up.sh"
    install -Dm755 "${srcdir}/nu_wait_for_device.sh"   "${pkgdir}/usr/bin/novpn_utils/nu_wait_for_device.sh"

    install -Dm644 "${srcdir}/novpn-config"             "${pkgdir}/etc/novpn"
    install -Dm644 "${srcdir}/novpn-systemd.service"    "${pkgdir}/usr/lib/systemd/system/novpn.service"
}
