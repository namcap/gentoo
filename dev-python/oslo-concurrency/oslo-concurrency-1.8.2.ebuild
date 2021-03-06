# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="library for running  multi-thread, multi-process applications"
HOMEPAGE="https://pypi.python.org/pypi/oslo.concurrency"
SRC_URI="mirror://pypi/${PN:0:1}/oslo.concurrency/oslo.concurrency-${PV}.tar.gz"
S="${WORKDIR}/oslo.concurrency-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/pbr-0.8[${PYTHON_USEDEP}]
		<dev-python/pbr-1.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/hacking-0.10[${PYTHON_USEDEP}]
		<dev-python/hacking-0.11[${PYTHON_USEDEP}]
		>=dev-python/oslotest-1.5.1[${PYTHON_USEDEP}]
		<dev-python/oslotest-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-3.6[${PYTHON_USEDEP}]
		virtual/python-futures[${PYTHON_USEDEP}]
		>=dev-python/oslo-sphinx-2.5.0[${PYTHON_USEDEP}]
		<dev-python/oslo-sphinx-2.6.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-1.1.2[${PYTHON_USEDEP}]
		!~dev-python/sphinx-1.2.0[${PYTHON_USEDEP}]
		<dev-python/sphinx-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/eventlet-0.16.1[${PYTHON_USEDEP}]
		!~dev-python/eventlet-0.17.0[${PYTHON_USEDEP}]
	)"
RDEPEND="
	>=dev-python/Babel-1.3[${PYTHON_USEDEP}]
	>=dev-python/iso8601-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/fixtures-0.3.14[${PYTHON_USEDEP}]
	<dev-python/fixtures-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-config-1.9.3[${PYTHON_USEDEP}]
	<dev-python/oslo-config-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-1.5.0[${PYTHON_USEDEP}]
	<dev-python/oslo-i18n-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-utils-1.4.0[${PYTHON_USEDEP}]
	<dev-python/oslo-utils-1.5.0[${PYTHON_USEDEP}]
	dev-python/posix_ipc[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/retrying-1.2.3[${PYTHON_USEDEP}]
	!~dev-python/retrying-1.3.0[${PYTHON_USEDEP}]
"

python_prepare_all() {
	sed -i '/futures/d' test-requirements.txt || die
	distutils-r1_python_prepare_all
}

python_test() {
	nosetests tests/ || die "test failed under ${EPYTHON}"
}
