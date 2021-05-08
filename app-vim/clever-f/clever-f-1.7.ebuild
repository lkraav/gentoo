# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit vim-plugin

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhysd/clever-f.vim.git"
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/rhysd/clever-f.vim/archive/ver${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~ppc-macos ~x64-macos"
fi

DESCRIPTION="extended f, f, t and t key mappings for vim"
HOMEPAGE="https://github.com/rhysd/clever-f.vim"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"

VIM_PLUGIN_HELPFILES="${PN}.txt"
