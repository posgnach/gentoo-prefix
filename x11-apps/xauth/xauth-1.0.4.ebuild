# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xauth/xauth-1.0.4.ebuild,v 1.5 2009/12/27 17:41:29 josejx Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="X authority file utility"

KEYWORDS="~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"
IUSE="ipv6"

RDEPEND="x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXext
	x11-libs/libXmu"
DEPEND="${RDEPEND}"

pkg_setup() {
	CONFIGURE_OPTIONS="$(use_enable ipv6)"
}
