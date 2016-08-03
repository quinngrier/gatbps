all:

## begin_variables

GATBPS = 'gatbps'

GATBPSFLAGS =

## end_variables

## begin_rules

.PHONY: all

all:
	$(GATBPS) $(GATBPSFLAGS) '--' 'CC0-1.0.txt'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/CC0-1.0-AC-COPYRIGHT.ac'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/CC0-1.0-AM-COPYRIGHT.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/DATE.sh'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/GATBPS_CONFIG_FILE_RULES.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/VERSION.sh'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/VERSION_LTCUR.sh'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/cp.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/docbook-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/docbook.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/dvi-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/echo.sh'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/html-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/pdf-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/plaintext-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/plaintext.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/ps-dist.am'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/sh-form.sh'
	$(GATBPS) $(GATBPSFLAGS) '--' 'build-aux/texinfo.css'
	$(GATBPS) $(GATBPSFLAGS) '--' 'dev-aux/CC0-1.0-commit.txt'
	$(GATBPS) $(GATBPSFLAGS) '--' 'dev-aux/CC0-1.0-file.txt'
	$(GATBPS) $(GATBPSFLAGS) '--' 'dev-aux/Makefile.am.vim'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/CC0-1.0-appendix.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/CC0-1.0-copying.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/PACKAGEDATE.texi.in'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/PACKAGEVERSION.texi.in'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/bdots.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/bothcontents.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/dslash.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/gequ.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/indent.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/ipez.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/lcei.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/lequ.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/lflo.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/math.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/mdot.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/mdots.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/msign.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/mtvskipbot.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/mtvskiptop.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/nequ.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/prm.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/rarrow.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/rcei.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/rflo.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/sbs.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'doc/texi/sps.texi'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_ARG_ENABLE.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_ARG_ENABLE_BOOL.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CACHE_CHECK.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CHECK_BASIC.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CHECK_SOFT_INCLUDE.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CHECK_VARS.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CONFIG_FILE.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_CONFIG_FILE_SUBST.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_DEFINE_AT.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_DEFINE_DATE.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_DEFINE_VERSION.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_MSG_ERROR.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_AWK.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_M4.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_MAKEINFO.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_MKDIR_P.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_SED.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/GATBPS_PROG_TEXI2ANY.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'm4/gatbps_fatal.m4'
	$(GATBPS) $(GATBPSFLAGS) '--' 'src/tools/rules_code.m4'

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
