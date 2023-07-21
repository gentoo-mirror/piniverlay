# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Flat assembler"
HOMEPAGE="https://flatassembler.net"
SRC_URI="https://flatassembler.net/fasmg.k328.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

DEPEND="
	dev-fasmg/xpu-i80387
	dev-fasmg/xpu-i80486
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	app-text/dos2unix
"

src_unpack () {
	mkdir "${S}"
	pushd "${S}"
	unpack "${A}"
	popd
}

src_compile () {
	cp examples/x86/include/p5.inc "${T}"
	dos2unix "${T}/p5.inc"
}

src_install () {
	insinto /usr/include/fasmg/xpu/intel
	doins "${T}/p5.inc"
}
