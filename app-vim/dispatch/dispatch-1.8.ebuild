# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit vim-plugin

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tpope/vim-dispatch.git"
else
	SRC_URI="https://github.com/tpope/vim-dispatch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~ppc-macos ~x64-macos"
	S="${WORKDIR}/vim-${P}"
fi

DESCRIPTION="Asynchronous build and test dispatcher"
HOMEPAGE="https://github.com/tpope/vim-dispatch"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"

VIM_PLUGIN_HELPFILES="${PN}.txt"
