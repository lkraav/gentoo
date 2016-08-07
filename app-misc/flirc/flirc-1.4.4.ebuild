EAPI=6

inherit eutils unpacker

DESCRIPTION="Flirc allows you to pair any remote control with your computer or media center."
HOMEPAGE="https://flirc.tv/"
SRC_URI="x86? ( http://apt.flirc.tv/arch/i386/binary/flirc_1.4.4-1_i386.deb )
	amd64? ( http://apt.flirc.tv/arch/x86_64/binary/flirc_1.4.4-1_amd64.deb )"
LICENSE="FLIRC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="headless"

RESTRICT="bindist mirror strip"

S="${WORKDIR}"

RDEPEND="dev-libs/libusb
	!headless? (
		x11-libs/libX11
		x11-libs/libXext )"


src_prepare () {
	if ! use headless ; then
		sed -i -e 's/^Version=.*$/Version=1.0/' "${S}"/usr/share/applications/Flirc.desktop
	fi
	eapply_user
}

src_install () {
	insinto /lib/udev/rules.d
	newins etc/udev/rules.d/99-flirc.rules 51-flirc.rules
	doman usr/share/doc/flirc/flirc_util.1
	exeinto /opt/bin
	doexe usr/bin/flirc_util
	if ! use headless ; then
		doman usr/share/doc/flirc/Flirc.1
		exeinto /opt/bin
		doexe usr/bin/Flirc
		insinto /usr/share/pixmaps
		doins usr/share/pixmaps/Flirc.png
		insinto /usr/share/applications
		doins usr/share/applications/Flirc.desktop
	fi
}
