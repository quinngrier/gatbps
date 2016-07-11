all:

## begin_variables

GATBPS = 'gatbps'

## end_variables

## begin_rules

.PHONY: all

all:
	$(GATBPS) '--' 'CC0-1.0.txt'
	$(GATBPS) '--' 'build-aux/CC0-1.0-AC-COPYRIGHT.ac'
	$(GATBPS) '--' 'build-aux/CC0-1.0-AM-COPYRIGHT.am'
	$(GATBPS) '--' 'build-aux/DATE.sh'
	$(GATBPS) '--' 'build-aux/GATBPS_CONFIG_FILE_RULES.am'
	$(GATBPS) '--' 'build-aux/VERSION.sh'
	$(GATBPS) '--' 'build-aux/VERSION_LTCUR.sh'
	$(GATBPS) '--' 'build-aux/docbook-dist.am'
	$(GATBPS) '--' 'build-aux/docbook.am'
	$(GATBPS) '--' 'build-aux/dvi-dist.am'
	$(GATBPS) '--' 'build-aux/echo.sh'
	$(GATBPS) '--' 'build-aux/html-dist.am'
	$(GATBPS) '--' 'build-aux/pdf-dist.am'
	$(GATBPS) '--' 'build-aux/plaintext-dist.am'
	$(GATBPS) '--' 'build-aux/plaintext.am'
	$(GATBPS) '--' 'build-aux/ps-dist.am'
	$(GATBPS) '--' 'build-aux/sh-form.sh'
	$(GATBPS) '--' 'build-aux/texinfo.css'
	$(GATBPS) '--' 'dev-aux/CC0-1.0-commit.txt'
	$(GATBPS) '--' 'dev-aux/CC0-1.0-file.txt'
	$(GATBPS) '--' 'dev-aux/Makefile.am.vim'
	$(GATBPS) '--' 'doc/texi/indent.texi'
	$(GATBPS) '--' 'm4/GATBPS_ARG_ENABLE.m4'
	$(GATBPS) '--' 'm4/GATBPS_ARG_ENABLE_BOOL.m4'
	$(GATBPS) '--' 'm4/GATBPS_CACHE_CHECK.m4'
	$(GATBPS) '--' 'm4/GATBPS_CHECK_BASIC.m4'
	$(GATBPS) '--' 'm4/GATBPS_CHECK_VARS.m4'
	$(GATBPS) '--' 'm4/GATBPS_CONFIG_FILE.m4'
	$(GATBPS) '--' 'm4/GATBPS_CONFIG_FILE_SUBST.m4'
	$(GATBPS) '--' 'm4/GATBPS_DEFINE_AT.m4'
	$(GATBPS) '--' 'm4/GATBPS_DEFINE_DATE.m4'
	$(GATBPS) '--' 'm4/GATBPS_DEFINE_VERSION.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_AWK.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_M4.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_MAKEINFO.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_MKDIR_P.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_SED.m4'
	$(GATBPS) '--' 'm4/GATBPS_PROG_TEXI2ANY.m4'

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
