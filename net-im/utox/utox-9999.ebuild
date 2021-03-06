# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit git-2

DESCRIPTION="Lightweight Tox client"
HOMEPAGE="https://github.com/notsecure/uTox.git"
EGIT_REPO_URI="git://github.com/notsecure/uTox.git
				https://github.com/notsecure/uTox.git"
LICENSE="GPL-3"
SLOT="0"
IUSE="+dbus"

RDEPEND="net-libs/tox
         x11-libs/libX11
         media-libs/openal
         media-libs/libv4l
         media-libs/freetype
         media-libs/libvpx
         dbus? ( sys-apps/dbus )"

src_configure() {
	use dbus || sed -i '/^CFLAGS/a\CFLAGS+=-DNO_DBUS' Makefile
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
