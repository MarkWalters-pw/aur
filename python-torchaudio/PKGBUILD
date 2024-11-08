# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=2.4.1
_sox_ver=14.4.2
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=('python' 'python-pytorch' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libFLAC.so' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('python-kaldi-io' 'cuda')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'boost')
conflicts=('python-torchaudio-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://downloads.sourceforge.net/project/sox/sox/$_sox_ver/sox-$_sox_ver.tar.bz2"
	"7797f83e1d66ff78872763e1da3a5fb2f0534c40.patch")
sha256sums=('a6b7e1b606ae353b9c4db1c8e754263f53f0457e9ab538e9669c0af0c46a0d5c'
	'81a6956d4330e75b5827316e44ae381e6f1e8928003c6aa45896da9041ea149c'
  '9d1d6c5018e08cedef4028b23418f7ad69a2d24065509a0697bad25532fd9484')

prepare() {
	ln -s "$srcdir/sox-$_sox_ver" "$srcdir/${_pkgname}-${pkgver}/third_party/sox"
	cd "$srcdir/${_pkgname}-${pkgver}"
	patch -p1 < "$srcdir/7797f83e1d66ff78872763e1da3a5fb2f0534c40.patch"
}

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	export CUDACXX=/opt/cuda/bin/nvcc
	export CUDAHOSTCXX=$CXX
	# Follow architectures used by pytorch
	# https://github.com/archlinux/svntogit-community/blob/packages/python-pytorch/trunk/PKGBUILD
	export TORCH_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0+PTX"

	CUDA_HOME=/opt/cuda/ BUILD_SOX=1 python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	BUILD_SOX=1 python setup.py install --root="$pkgdir"/ --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
