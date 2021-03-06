# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="JSON Matching Expressions"
HOMEPAGE="https://github.com/boto/jmespath https://pypi.python.org/pypi/jmespath"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"
RDEPEND=""

python_test() {
	nosetests || die
}
