# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit vim-plugin

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/junegunn/vim-peekaboo.git"
else
	COMMIT_ID="cc4469c204099c73dd7534531fa8ba271f704831"
	SRC_URI="https://github.com/junegunn/vim-peekaboo/archive/${COMMIT_ID}.zip -> ${P}.zip"
	S="${WORKDIR}/vim-${PN}-${COMMIT_ID}"
fi

DESCRIPTION="Extends \" and @ in normal mode, <CTRL-R> in insert mode"
HOMEPAGE="https://github.com/junegunn/vim-peekaboo"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"

VIM_PLUGIN_HELPFILES="${PN}.txt"
