# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/htmlview/htmlview-3.0.0-r1.ebuild,v 1.8 2007/02/04 18:47:53 beandog Exp $

inherit rpm eutils prefix

IUSE=""

RH_EXTRAVERSION="8"

DESCRIPTION="A script which calls an installed HTML viewer."
HOMEPAGE="http://www.redhat.com"
SRC_URI="mirror://fedora/development/SRPMS/${P}-${RH_EXTRAVERSION}.src.rpm"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"

S=${WORKDIR}

src_unpack() {
	rpm_src_unpack
	cd "${S}"
	sed -i -e '{ /^TERMS_GENERIC/s:"\(.*\)":"\1 /usr/bin/aterm /usr/bin/hanterm /usr/bin/kterm /usr/bin/mlterm /usr/bin/mrxvt /usr/bin/urxvt":
		/^TTYBROWSERS/s:"\(.*\)":"\1 /usr/bin/elinks":
		/^X11BROWSERS_GNOME/s:"\(.*\)":"\1 /usr/bin/kazehakase":
		/^X11BROWSERS_GENERIC/s:"\(.*\)":"\1 /usr/bin/firefox":
		s:/usr/bin/konsole:konsole:
		s:/usr/bin/kvt:kvt:
		s:/usr/bin/konqueror:konqueror:
		s:/usr/bin/kfmbrowser:kfmbrowser:
		s:/usr/X11R6/bin/xterm:/usr/bin/xterm:
		s:/sbin/pidof:pidof:
		}' htmlview || die
	epatch "${FILESDIR}"/${P}-prefix.patch
	eprefixify htmlview
}

src_install () {
	dobin htmlview
	dobin launchmail
}
