# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

CROS_WORKON_REPO="git://github.com/raspberrypi"
CROS_WORKON_PROJECT="userland"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_COMMIT="fb11b39d97371c076eef7c85bbcab5733883a41e"

inherit git-2 cros-workon cmake-utils

DESCRIPTION="OpenGLES libraries for Raspberry Pi"
LICENSE="MIT"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND=""
RDEPEND="!x11-drivers/opengles-bin"

src_unpack() {
	cros-workon_src_unpack
}

src_configure() {
	tc-export CC CXX LD AR RANLIB NM
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	pushd build/lib
	ln -sf libEGL.so libEGL.so.1
	ln -sf libGLESv2.so libGLESv2.so.2
	dolib.so libEGL.so.1 libGLESv2.so.2
	popd
}
