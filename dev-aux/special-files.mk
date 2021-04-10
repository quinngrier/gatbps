all:

## begin_variables

GATBPS = 'gatbps'

GATBPSFLAGS =

GENERATE = $(GATBPS) $(GATBPSFLAGS) '--'

MKDIR_P = 'mkdir' '-p'

files = \
  CC0-1.0.txt \
  build-aux/CC0-1.0-AC-COPYRIGHT.ac \
  build-aux/CC0-1.0-AM-COPYRIGHT.am \
  build-aux/DATE.sh \
  build-aux/GATBPS_CONFIG_FILE_RULES.am \
  build-aux/GATBPS_CONFIG_LATER_RULES.am \
  build-aux/GATBPS_CP_RULES.am \
  build-aux/GATBPS_VPATH_SEARCH.am \
  build-aux/GATBPS_V_PAD.am \
  build-aux/LTCURRENT.sh \
  build-aux/VERSION.sh \
  build-aux/cp.am \
  build-aux/docbook-dist.am \
  build-aux/docbook.am \
  build-aux/dvi-dist.am \
  build-aux/echo.sh \
  build-aux/gatbps.ac \
  build-aux/gatbps.am \
  build-aux/html-dist.am \
  build-aux/pdf-dist.am \
  build-aux/plaintext-dist.am \
  build-aux/plaintext.am \
  build-aux/ps-dist.am \
  build-aux/xml-dist.am \
  build-aux/xml.am \
  dev-aux/CC0-1.0-commit.txt \
  dev-aux/CC0-1.0-file.txt \
  dev-aux/format.ac.vim \
  dev-aux/format.am.vim \
  doc/texi/CC0-1.0-appendix.texi \
  doc/texi/CC0-1.0-copying.texi \
  doc/texi/PACKAGEDATE.texi.in \
  doc/texi/PACKAGEVERSION.texi.in \
  doc/texi/barrow.texi \
  doc/texi/bdarrow.texi \
  doc/texi/bdots.texi \
  doc/texi/bothcontents.texi \
  doc/texi/dprm.texi \
  doc/texi/dslash.texi \
  doc/texi/gequ.texi \
  doc/texi/indent.texi \
  doc/texi/insertascii.texi \
  doc/texi/insertmathjax.texi \
  doc/texi/ipez.texi \
  doc/texi/larrow.texi \
  doc/texi/lbarrow.texi \
  doc/texi/lbdarrow.texi \
  doc/texi/lcei.texi \
  doc/texi/ldarrow.texi \
  doc/texi/lequ.texi \
  doc/texi/lflo.texi \
  doc/texi/llarrow.texi \
  doc/texi/lldarrow.texi \
  doc/texi/lrarrow.texi \
  doc/texi/lrdarrow.texi \
  doc/texi/math.texi \
  doc/texi/mdot.texi \
  doc/texi/mdots.texi \
  doc/texi/msign.texi \
  doc/texi/mtvskipbot.texi \
  doc/texi/mtvskiptop.texi \
  doc/texi/nequ.texi \
  doc/texi/prm.texi \
  doc/texi/qprm.texi \
  doc/texi/rarrow.texi \
  doc/texi/rcei.texi \
  doc/texi/rdarrow.texi \
  doc/texi/rflo.texi \
  doc/texi/sbs.texi \
  doc/texi/sps.texi \
  doc/texi/texinfo.css \
  doc/texi/tprm.texi \
  gh-pages/CC0-1.0.txt \
  gh-pages/dev-aux/CC0-1.0-commit.txt \
  m4/GATBPS_ARG_ENABLE.m4 \
  m4/GATBPS_ARG_ENABLE_BOOL.m4 \
  m4/GATBPS_CACHE_CHECK.m4 \
  m4/GATBPS_CHECK_BASIC.m4 \
  m4/GATBPS_CHECK_EXEEXT.m4 \
  m4/GATBPS_CHECK_SHEBANG_LINE.m4 \
  m4/GATBPS_CHECK_VARS.m4 \
  m4/GATBPS_CONFIG_FILE.m4 \
  m4/GATBPS_CONFIG_FILE_SUBST.m4 \
  m4/GATBPS_CONFIG_LATER.m4 \
  m4/GATBPS_CONFIG_LATER_SUBST.m4 \
  m4/GATBPS_CONFIG_LATER_VAR.m4 \
  m4/GATBPS_CP.m4 \
  m4/GATBPS_CP_SUBST.m4 \
  m4/GATBPS_DEFINE_AT.m4 \
  m4/GATBPS_DEFINE_DATE.m4 \
  m4/GATBPS_DEFINE_TEXI2DVIFLAGS.m4 \
  m4/GATBPS_DEFINE_VERSION.m4 \
  m4/GATBPS_DEFINE_docbookdir.m4 \
  m4/GATBPS_DEFINE_enable_SHEBANG_LINES.m4 \
  m4/GATBPS_DEFINE_plaintextdir.m4 \
  m4/GATBPS_DEFINE_xmldir.m4 \
  m4/GATBPS_MSG_ERROR.m4 \
  m4/GATBPS_MSG_NOTICE.m4 \
  m4/GATBPS_PROG_AWK.m4 \
  m4/GATBPS_PROG_MAKEINFO.m4 \
  m4/GATBPS_PROG_MKDIR_P.m4 \
  m4/GATBPS_PROG_SED.m4 \
  m4/GATBPS_PROG_TEXI2ANY.m4 \
  m4/gatbps_fatal.m4 \
  m4/gatbps_notice.m4 \
  m4/gatbps_rule_word_error.m4 \
  src/tools/rules_code.m4 \
$(prevent_a_blank_line)

## end_variables

## begin_rules

$(files): FORCE
	$(MKDIR_P) './'$(@D)
	$(GENERATE) './'$@

.PHONY: FORCE
.PHONY: all

.SUFFIXES:

FORCE:

all: $(files)
all: FORCE

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
