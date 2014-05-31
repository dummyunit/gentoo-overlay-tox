# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="CLI Frontend for Tox"
HOMEPAGE="http://wiki.tox.im/Toxic"
EGIT_REPO_URI="git://github.com/Tox/toxic 
				https://github.com/Tox/toxic"
LICENSE="GPL-3"
SLOT="0"
IUSE="+av unixtime"

RDEPEND="net-libs/tox
		dev-libs/check
		dev-libs/libconfig
		av? ( net-libs/tox[av] media-libs/openal )
		sys-libs/ncurses"

DEPEND="${RDEPEND}
		dev-libs/libconfig
		sys-devel/automake
		virtual/pkgconfig
		sys-devel/libtool"

src_prepare() {
		if use unixtime; then
			epatch "${WORKDIR}/fun/unixtime.patch" || die "Epatch failed!"
		fi
		eautoreconf
}

src_prepare() {
		eautoreconf
		$(use_enable av)
}

pkg_postinst() {
		elog "DHT node list is available in /usr/share/${PN}/DHTservers"
}
