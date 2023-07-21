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
	dev-fasmg/xpu-ext-aes
	dev-fasmg/xpu-ext-avx
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
	cp examples/x86/include/ext/vaes.inc "${T}"
	dos2unix "${T}/vaes.inc"
}

src_install () {
	insinto /usr/include/fasmg/xpu/intel/ext
	doins "${T}/vaes.inc"
}
