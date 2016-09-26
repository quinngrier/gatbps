all:

## begin_variables

GATBPS = 'gatbps'

GATBPSFLAGS =

GENERATE = $(GATBPS) $(GATBPSFLAGS) '--'

## end_variables

## begin_rules

.PHONY: all

all:
	$(GENERATE) 'CC0-1.0.txt'
	$(GENERATE) 'build-aux/CC0-1.0-AC-COPYRIGHT.ac'
	$(GENERATE) 'build-aux/CC0-1.0-AM-COPYRIGHT.am'
	$(GENERATE) 'build-aux/DATE.sh'
	$(GENERATE) 'build-aux/GATBPS_CONFIG_FILE_RULES.am'
	$(GENERATE) 'build-aux/GATBPS_CP_RULES.am'
	$(GENERATE) 'build-aux/GATBPS_M4_RULES.am'
	$(GENERATE) 'build-aux/GATBPS_RECIPE_MARKER.am'
	$(GENERATE) 'build-aux/GATBPS_V_PAD.am'
	$(GENERATE) 'build-aux/VERSION.sh'
	$(GENERATE) 'build-aux/VERSION_LTCUR.sh'
	$(GENERATE) 'build-aux/cp.am'
	$(GENERATE) 'build-aux/docbook-dist.am'
	$(GENERATE) 'build-aux/docbook.am'
	$(GENERATE) 'build-aux/dvi-dist.am'
	$(GENERATE) 'build-aux/echo.sh'
	$(GENERATE) 'build-aux/html-dist.am'
	$(GENERATE) 'build-aux/m4.am'
	$(GENERATE) 'build-aux/pdf-dist.am'
	$(GENERATE) 'build-aux/plaintext-dist.am'
	$(GENERATE) 'build-aux/plaintext.am'
	$(GENERATE) 'build-aux/ps-dist.am'
	$(GENERATE) 'build-aux/sh-form.sh'
	$(GENERATE) 'build-aux/texinfo.css'
	$(GENERATE) 'build-aux/xml.am'
	$(GENERATE) 'dev-aux/CC0-1.0-commit.txt'
	$(GENERATE) 'dev-aux/CC0-1.0-file.txt'
	$(GENERATE) 'dev-aux/Makefile.am.vim'
	$(GENERATE) 'dev-aux/configure.ac.vim'
	$(GENERATE) 'doc/texi/CC0-1.0-appendix.texi'
	$(GENERATE) 'doc/texi/CC0-1.0-copying.texi'
	$(GENERATE) 'doc/texi/PACKAGEDATE.texi.in'
	$(GENERATE) 'doc/texi/PACKAGEVERSION.texi.in'
	$(GENERATE) 'doc/texi/bdots.texi'
	$(GENERATE) 'doc/texi/bothcontents.texi'
	$(GENERATE) 'doc/texi/dslash.texi'
	$(GENERATE) 'doc/texi/gequ.texi'
	$(GENERATE) 'doc/texi/indent.texi'
	$(GENERATE) 'doc/texi/ipez.texi'
	$(GENERATE) 'doc/texi/lcei.texi'
	$(GENERATE) 'doc/texi/lequ.texi'
	$(GENERATE) 'doc/texi/lflo.texi'
	$(GENERATE) 'doc/texi/math.texi'
	$(GENERATE) 'doc/texi/mdot.texi'
	$(GENERATE) 'doc/texi/mdots.texi'
	$(GENERATE) 'doc/texi/msign.texi'
	$(GENERATE) 'doc/texi/mtvskipbot.texi'
	$(GENERATE) 'doc/texi/mtvskiptop.texi'
	$(GENERATE) 'doc/texi/nequ.texi'
	$(GENERATE) 'doc/texi/prm.texi'
	$(GENERATE) 'doc/texi/rarrow.texi'
	$(GENERATE) 'doc/texi/rcei.texi'
	$(GENERATE) 'doc/texi/rflo.texi'
	$(GENERATE) 'doc/texi/sbs.texi'
	$(GENERATE) 'doc/texi/sps.texi'
	$(GENERATE) 'gh-pages/CC0-1.0.txt'
	$(GENERATE) 'gh-pages/dev-aux/CC0-1.0-commit.txt'
	$(GENERATE) 'm4/GATBPS_ARG_ENABLE.m4'
	$(GENERATE) 'm4/GATBPS_ARG_ENABLE_BOOL.m4'
	$(GENERATE) 'm4/GATBPS_CACHE_CHECK.m4'
	$(GENERATE) 'm4/GATBPS_CHECK_BASIC.m4'
	$(GENERATE) 'm4/GATBPS_CHECK_SHEBANG_LINE.m4'
	$(GENERATE) 'm4/GATBPS_CHECK_SOFT_INCLUDE.m4'
	$(GENERATE) 'm4/GATBPS_CHECK_VARS.m4'
	$(GENERATE) 'm4/GATBPS_CONFIG_FILE.m4'
	$(GENERATE) 'm4/GATBPS_CONFIG_FILE_SUBST.m4'
	$(GENERATE) 'm4/GATBPS_CP.m4'
	$(GENERATE) 'm4/GATBPS_CP_SUBST.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_AT.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_DATE.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_VERSION.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_docbookdir.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_enable_SHEBANG_LINES.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_plaintextdir.m4'
	$(GENERATE) 'm4/GATBPS_DEFINE_xmldir.m4'
	$(GENERATE) 'm4/GATBPS_M4.m4'
	$(GENERATE) 'm4/GATBPS_M4_SUBST.m4'
	$(GENERATE) 'm4/GATBPS_MSG_ERROR.m4'
	$(GENERATE) 'm4/GATBPS_MSG_NOTICE.m4'
	$(GENERATE) 'm4/GATBPS_PROG_AWK.m4'
	$(GENERATE) 'm4/GATBPS_PROG_M4.m4'
	$(GENERATE) 'm4/GATBPS_PROG_MAKEINFO.m4'
	$(GENERATE) 'm4/GATBPS_PROG_MKDIR_P.m4'
	$(GENERATE) 'm4/GATBPS_PROG_SED.m4'
	$(GENERATE) 'm4/GATBPS_PROG_TEXI2ANY.m4'
	$(GENERATE) 'm4/gatbps_fatal.m4'
	$(GENERATE) 'm4/gatbps_notice.m4'
	$(GENERATE) 'src/tools/rules_code.m4'

## end_rules

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
