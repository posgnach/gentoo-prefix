# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libnl/libnl-1.1-r2.ebuild,v 1.3 2010/01/10 08:28:48 robbat2 Exp $

EAPI="2"

inherit eutils multilib

DESCRIPTION="A library for applications dealing with netlink socket"
HOMEPAGE="http://people.suug.ch/~tgr/libnl/"
SRC_URI="http://people.suug.ch/~tgr/libnl/files/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-vlan-header.patch
	epatch "${FILESDIR}"/${P}-minor-leaks.patch
	epatch "${FILESDIR}"/${P}-glibc-2.8-ULONG_MAX.patch
	epatch "${FILESDIR}"/${P}-flags.patch
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog
}
