# Contributor: Severus <huynhok.uit@gmail.com> 

_pkgname=uim
pkgname=${_pkgname}-qt5
pkgver=20141111
pkgrel=1
pkgdesc="A multilingual input method framework"
arch=('i686' 'x86_64')
url="http://code.google.com/p/uim/"
license=('BSD')
depends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'libxft' 'libedit'  'm17n-lib')
makedepends=('patch' 'git' 'intltool' 'perl' 'ruby' 'librsvg' )
provides=('uim')
conflicts=('uim' 'uim-svn' 'uim-git')
options=('!libtool' '!docs' '!emptydirs')
install=uim-qt5.install
source=("git+https://github.com/NgoHuy/uim")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}
build() {
  cd ${srcdir}/${_pkgname}

  git checkout uim-vi-1.9-PKGBUILD
  patch -Np1 < ${srcdir}/destdir.patch
  ./make-wc.sh --prefix=/usr --libexecdir=/usr/lib/uim --with-qt-immodule --with-gtk3-immodule --with-qt4-immodule --with-qt5-immodule --without-sqlite3 --without-anthy --without-skk
  make -j2
}

package() {
  cd ${srcdir}/${_pkgname}

  make -j1 DESTDIR=${pkgdir} install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

