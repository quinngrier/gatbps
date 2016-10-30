all:

## begin_variables

GATBPS = 'gatbps'

GATBPSFLAGS =

GENERATE = $(GATBPS) $(GATBPSFLAGS) '--'

## end_variables

## begin_rules

.PHONY: CC0-1.0.txt
.PHONY: all
.PHONY: build-aux/CC0-1.0-AC-COPYRIGHT.ac
.PHONY: build-aux/CC0-1.0-AM-COPYRIGHT.am
.PHONY: build-aux/DATE.sh
.PHONY: build-aux/GATBPS_CONFIG_FILE_RULES.am
.PHONY: build-aux/GATBPS_CP_RULES.am
.PHONY: build-aux/GATBPS_M4_RULES.am
.PHONY: build-aux/GATBPS_RECIPE_MARKER.am
.PHONY: build-aux/GATBPS_V_PAD.am
.PHONY: build-aux/VERSION.sh
.PHONY: build-aux/VERSION_LTCUR.sh
.PHONY: build-aux/cp.am
.PHONY: build-aux/docbook-dist.am
.PHONY: build-aux/docbook.am
.PHONY: build-aux/dvi-dist.am
.PHONY: build-aux/echo.sh
.PHONY: build-aux/html-dist.am
.PHONY: build-aux/m4.am
.PHONY: build-aux/pdf-dist.am
.PHONY: build-aux/plaintext-dist.am
.PHONY: build-aux/plaintext.am
.PHONY: build-aux/ps-dist.am
.PHONY: build-aux/sh-form.sh
.PHONY: build-aux/xml-dist.am
.PHONY: build-aux/xml.am
.PHONY: dev-aux/CC0-1.0-commit.txt
.PHONY: dev-aux/CC0-1.0-file.txt
.PHONY: dev-aux/format.ac.vim
.PHONY: dev-aux/format.am.vim
.PHONY: doc/texi/CC0-1.0-appendix.texi
.PHONY: doc/texi/CC0-1.0-copying.texi
.PHONY: doc/texi/PACKAGEDATE.texi.in
.PHONY: doc/texi/PACKAGEVERSION.texi.in
.PHONY: doc/texi/barrow.texi
.PHONY: doc/texi/bdarrow.texi
.PHONY: doc/texi/bdots.texi
.PHONY: doc/texi/bothcontents.texi
.PHONY: doc/texi/dprm.texi
.PHONY: doc/texi/dslash.texi
.PHONY: doc/texi/gequ.texi
.PHONY: doc/texi/indent.texi
.PHONY: doc/texi/insertascii.texi
.PHONY: doc/texi/insertmathjax.texi
.PHONY: doc/texi/ipez.texi
.PHONY: doc/texi/larrow.texi
.PHONY: doc/texi/lbarrow.texi
.PHONY: doc/texi/lbdarrow.texi
.PHONY: doc/texi/lcei.texi
.PHONY: doc/texi/ldarrow.texi
.PHONY: doc/texi/lequ.texi
.PHONY: doc/texi/lflo.texi
.PHONY: doc/texi/llarrow.texi
.PHONY: doc/texi/lldarrow.texi
.PHONY: doc/texi/lrarrow.texi
.PHONY: doc/texi/lrdarrow.texi
.PHONY: doc/texi/math.texi
.PHONY: doc/texi/mdot.texi
.PHONY: doc/texi/mdots.texi
.PHONY: doc/texi/msign.texi
.PHONY: doc/texi/mtvskipbot.texi
.PHONY: doc/texi/mtvskiptop.texi
.PHONY: doc/texi/nequ.texi
.PHONY: doc/texi/prm.texi
.PHONY: doc/texi/qprm.texi
.PHONY: doc/texi/rarrow.texi
.PHONY: doc/texi/rcei.texi
.PHONY: doc/texi/rdarrow.texi
.PHONY: doc/texi/rflo.texi
.PHONY: doc/texi/sbs.texi
.PHONY: doc/texi/sps.texi
.PHONY: doc/texi/texinfo.css
.PHONY: doc/texi/tprm.texi
.PHONY: gh-pages/CC0-1.0.txt
.PHONY: gh-pages/dev-aux/CC0-1.0-commit.txt
.PHONY: m4/GATBPS_ARG_ENABLE.m4
.PHONY: m4/GATBPS_ARG_ENABLE_BOOL.m4
.PHONY: m4/GATBPS_CACHE_CHECK.m4
.PHONY: m4/GATBPS_CHECK_BASIC.m4
.PHONY: m4/GATBPS_CHECK_SHEBANG_LINE.m4
.PHONY: m4/GATBPS_CHECK_SOFT_INCLUDE.m4
.PHONY: m4/GATBPS_CHECK_VARS.m4
.PHONY: m4/GATBPS_CONFIG_FILE.m4
.PHONY: m4/GATBPS_CONFIG_FILE_SUBST.m4
.PHONY: m4/GATBPS_CP.m4
.PHONY: m4/GATBPS_CP_SUBST.m4
.PHONY: m4/GATBPS_DEFINE_AT.m4
.PHONY: m4/GATBPS_DEFINE_DATE.m4
.PHONY: m4/GATBPS_DEFINE_VERSION.m4
.PHONY: m4/GATBPS_DEFINE_docbookdir.m4
.PHONY: m4/GATBPS_DEFINE_enable_SHEBANG_LINES.m4
.PHONY: m4/GATBPS_DEFINE_plaintextdir.m4
.PHONY: m4/GATBPS_DEFINE_xmldir.m4
.PHONY: m4/GATBPS_M4.m4
.PHONY: m4/GATBPS_M4_SUBST.m4
.PHONY: m4/GATBPS_MSG_ERROR.m4
.PHONY: m4/GATBPS_MSG_NOTICE.m4
.PHONY: m4/GATBPS_PROG_AWK.m4
.PHONY: m4/GATBPS_PROG_M4.m4
.PHONY: m4/GATBPS_PROG_MAKEINFO.m4
.PHONY: m4/GATBPS_PROG_MKDIR_P.m4
.PHONY: m4/GATBPS_PROG_SED.m4
.PHONY: m4/GATBPS_PROG_TEXI2ANY.m4
.PHONY: m4/gatbps_fatal.m4
.PHONY: m4/gatbps_notice.m4
.PHONY: m4/gatbps_rule_word_error.m4
.PHONY: src/tools/rules_code.m4

CC0-1.0.txt:
	$(GENERATE) $@

all: CC0-1.0.txt
all: build-aux/CC0-1.0-AC-COPYRIGHT.ac
all: build-aux/CC0-1.0-AM-COPYRIGHT.am
all: build-aux/DATE.sh
all: build-aux/GATBPS_CONFIG_FILE_RULES.am
all: build-aux/GATBPS_CP_RULES.am
all: build-aux/GATBPS_M4_RULES.am
all: build-aux/GATBPS_RECIPE_MARKER.am
all: build-aux/GATBPS_V_PAD.am
all: build-aux/VERSION.sh
all: build-aux/VERSION_LTCUR.sh
all: build-aux/cp.am
all: build-aux/docbook-dist.am
all: build-aux/docbook.am
all: build-aux/dvi-dist.am
all: build-aux/echo.sh
all: build-aux/html-dist.am
all: build-aux/m4.am
all: build-aux/pdf-dist.am
all: build-aux/plaintext-dist.am
all: build-aux/plaintext.am
all: build-aux/ps-dist.am
all: build-aux/sh-form.sh
all: build-aux/xml-dist.am
all: build-aux/xml.am
all: dev-aux/CC0-1.0-commit.txt
all: dev-aux/CC0-1.0-file.txt
all: dev-aux/format.ac.vim
all: dev-aux/format.am.vim
all: doc/texi/CC0-1.0-appendix.texi
all: doc/texi/CC0-1.0-copying.texi
all: doc/texi/PACKAGEDATE.texi.in
all: doc/texi/PACKAGEVERSION.texi.in
all: doc/texi/barrow.texi
all: doc/texi/bdarrow.texi
all: doc/texi/bdots.texi
all: doc/texi/bothcontents.texi
all: doc/texi/dprm.texi
all: doc/texi/dslash.texi
all: doc/texi/gequ.texi
all: doc/texi/indent.texi
all: doc/texi/insertascii.texi
all: doc/texi/insertmathjax.texi
all: doc/texi/ipez.texi
all: doc/texi/larrow.texi
all: doc/texi/lbarrow.texi
all: doc/texi/lbdarrow.texi
all: doc/texi/lcei.texi
all: doc/texi/ldarrow.texi
all: doc/texi/lequ.texi
all: doc/texi/lflo.texi
all: doc/texi/llarrow.texi
all: doc/texi/lldarrow.texi
all: doc/texi/lrarrow.texi
all: doc/texi/lrdarrow.texi
all: doc/texi/math.texi
all: doc/texi/mdot.texi
all: doc/texi/mdots.texi
all: doc/texi/msign.texi
all: doc/texi/mtvskipbot.texi
all: doc/texi/mtvskiptop.texi
all: doc/texi/nequ.texi
all: doc/texi/prm.texi
all: doc/texi/qprm.texi
all: doc/texi/rarrow.texi
all: doc/texi/rcei.texi
all: doc/texi/rdarrow.texi
all: doc/texi/rflo.texi
all: doc/texi/sbs.texi
all: doc/texi/sps.texi
all: doc/texi/texinfo.css
all: doc/texi/tprm.texi
all: gh-pages/CC0-1.0.txt
all: gh-pages/dev-aux/CC0-1.0-commit.txt
all: m4/GATBPS_ARG_ENABLE.m4
all: m4/GATBPS_ARG_ENABLE_BOOL.m4
all: m4/GATBPS_CACHE_CHECK.m4
all: m4/GATBPS_CHECK_BASIC.m4
all: m4/GATBPS_CHECK_SHEBANG_LINE.m4
all: m4/GATBPS_CHECK_SOFT_INCLUDE.m4
all: m4/GATBPS_CHECK_VARS.m4
all: m4/GATBPS_CONFIG_FILE.m4
all: m4/GATBPS_CONFIG_FILE_SUBST.m4
all: m4/GATBPS_CP.m4
all: m4/GATBPS_CP_SUBST.m4
all: m4/GATBPS_DEFINE_AT.m4
all: m4/GATBPS_DEFINE_DATE.m4
all: m4/GATBPS_DEFINE_VERSION.m4
all: m4/GATBPS_DEFINE_docbookdir.m4
all: m4/GATBPS_DEFINE_enable_SHEBANG_LINES.m4
all: m4/GATBPS_DEFINE_plaintextdir.m4
all: m4/GATBPS_DEFINE_xmldir.m4
all: m4/GATBPS_M4.m4
all: m4/GATBPS_M4_SUBST.m4
all: m4/GATBPS_MSG_ERROR.m4
all: m4/GATBPS_MSG_NOTICE.m4
all: m4/GATBPS_PROG_AWK.m4
all: m4/GATBPS_PROG_M4.m4
all: m4/GATBPS_PROG_MAKEINFO.m4
all: m4/GATBPS_PROG_MKDIR_P.m4
all: m4/GATBPS_PROG_SED.m4
all: m4/GATBPS_PROG_TEXI2ANY.m4
all: m4/gatbps_fatal.m4
all: m4/gatbps_notice.m4
all: m4/gatbps_rule_word_error.m4
all: src/tools/rules_code.m4

build-aux/CC0-1.0-AC-COPYRIGHT.ac:
	$(GENERATE) $@

build-aux/CC0-1.0-AM-COPYRIGHT.am:
	$(GENERATE) $@

build-aux/DATE.sh:
	$(GENERATE) $@

build-aux/GATBPS_CONFIG_FILE_RULES.am:
	$(GENERATE) $@

build-aux/GATBPS_CP_RULES.am:
	$(GENERATE) $@

build-aux/GATBPS_M4_RULES.am:
	$(GENERATE) $@

build-aux/GATBPS_RECIPE_MARKER.am:
	$(GENERATE) $@

build-aux/GATBPS_V_PAD.am:
	$(GENERATE) $@

build-aux/VERSION.sh:
	$(GENERATE) $@

build-aux/VERSION_LTCUR.sh:
	$(GENERATE) $@

build-aux/cp.am:
	$(GENERATE) $@

build-aux/docbook-dist.am:
	$(GENERATE) $@

build-aux/docbook.am:
	$(GENERATE) $@

build-aux/dvi-dist.am:
	$(GENERATE) $@

build-aux/echo.sh:
	$(GENERATE) $@

build-aux/html-dist.am:
	$(GENERATE) $@

build-aux/m4.am:
	$(GENERATE) $@

build-aux/pdf-dist.am:
	$(GENERATE) $@

build-aux/plaintext-dist.am:
	$(GENERATE) $@

build-aux/plaintext.am:
	$(GENERATE) $@

build-aux/ps-dist.am:
	$(GENERATE) $@

build-aux/sh-form.sh:
	$(GENERATE) $@

build-aux/xml-dist.am:
	$(GENERATE) $@

build-aux/xml.am:
	$(GENERATE) $@

dev-aux/CC0-1.0-commit.txt:
	$(GENERATE) $@

dev-aux/CC0-1.0-file.txt:
	$(GENERATE) $@

dev-aux/format.ac.vim:
	$(GENERATE) $@

dev-aux/format.am.vim:
	$(GENERATE) $@

doc/texi/CC0-1.0-appendix.texi:
	$(GENERATE) $@

doc/texi/CC0-1.0-copying.texi:
	$(GENERATE) $@

doc/texi/PACKAGEDATE.texi.in:
	$(GENERATE) $@

doc/texi/PACKAGEVERSION.texi.in:
	$(GENERATE) $@

doc/texi/barrow.texi:
	$(GENERATE) $@

doc/texi/bdarrow.texi:
	$(GENERATE) $@

doc/texi/bdots.texi:
	$(GENERATE) $@

doc/texi/bothcontents.texi:
	$(GENERATE) $@

doc/texi/dprm.texi:
	$(GENERATE) $@

doc/texi/dslash.texi:
	$(GENERATE) $@

doc/texi/gequ.texi:
	$(GENERATE) $@

doc/texi/indent.texi:
	$(GENERATE) $@

doc/texi/insertascii.texi:
	$(GENERATE) $@

doc/texi/insertmathjax.texi:
	$(GENERATE) $@

doc/texi/ipez.texi:
	$(GENERATE) $@

doc/texi/larrow.texi:
	$(GENERATE) $@

doc/texi/lbarrow.texi:
	$(GENERATE) $@

doc/texi/lbdarrow.texi:
	$(GENERATE) $@

doc/texi/lcei.texi:
	$(GENERATE) $@

doc/texi/ldarrow.texi:
	$(GENERATE) $@

doc/texi/lequ.texi:
	$(GENERATE) $@

doc/texi/lflo.texi:
	$(GENERATE) $@

doc/texi/llarrow.texi:
	$(GENERATE) $@

doc/texi/lldarrow.texi:
	$(GENERATE) $@

doc/texi/lrarrow.texi:
	$(GENERATE) $@

doc/texi/lrdarrow.texi:
	$(GENERATE) $@

doc/texi/math.texi:
	$(GENERATE) $@

doc/texi/mdot.texi:
	$(GENERATE) $@

doc/texi/mdots.texi:
	$(GENERATE) $@

doc/texi/msign.texi:
	$(GENERATE) $@

doc/texi/mtvskipbot.texi:
	$(GENERATE) $@

doc/texi/mtvskiptop.texi:
	$(GENERATE) $@

doc/texi/nequ.texi:
	$(GENERATE) $@

doc/texi/prm.texi:
	$(GENERATE) $@

doc/texi/qprm.texi:
	$(GENERATE) $@

doc/texi/rarrow.texi:
	$(GENERATE) $@

doc/texi/rcei.texi:
	$(GENERATE) $@

doc/texi/rdarrow.texi:
	$(GENERATE) $@

doc/texi/rflo.texi:
	$(GENERATE) $@

doc/texi/sbs.texi:
	$(GENERATE) $@

doc/texi/sps.texi:
	$(GENERATE) $@

doc/texi/texinfo.css:
	$(GENERATE) $@

doc/texi/tprm.texi:
	$(GENERATE) $@

gh-pages/CC0-1.0.txt:
	$(GENERATE) $@

gh-pages/dev-aux/CC0-1.0-commit.txt:
	$(GENERATE) $@

m4/GATBPS_ARG_ENABLE.m4:
	$(GENERATE) $@

m4/GATBPS_ARG_ENABLE_BOOL.m4:
	$(GENERATE) $@

m4/GATBPS_CACHE_CHECK.m4:
	$(GENERATE) $@

m4/GATBPS_CHECK_BASIC.m4:
	$(GENERATE) $@

m4/GATBPS_CHECK_SHEBANG_LINE.m4:
	$(GENERATE) $@

m4/GATBPS_CHECK_SOFT_INCLUDE.m4:
	$(GENERATE) $@

m4/GATBPS_CHECK_VARS.m4:
	$(GENERATE) $@

m4/GATBPS_CONFIG_FILE.m4:
	$(GENERATE) $@

m4/GATBPS_CONFIG_FILE_SUBST.m4:
	$(GENERATE) $@

m4/GATBPS_CP.m4:
	$(GENERATE) $@

m4/GATBPS_CP_SUBST.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_AT.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_DATE.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_VERSION.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_docbookdir.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_enable_SHEBANG_LINES.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_plaintextdir.m4:
	$(GENERATE) $@

m4/GATBPS_DEFINE_xmldir.m4:
	$(GENERATE) $@

m4/GATBPS_M4.m4:
	$(GENERATE) $@

m4/GATBPS_M4_SUBST.m4:
	$(GENERATE) $@

m4/GATBPS_MSG_ERROR.m4:
	$(GENERATE) $@

m4/GATBPS_MSG_NOTICE.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_AWK.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_M4.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_MAKEINFO.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_MKDIR_P.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_SED.m4:
	$(GENERATE) $@

m4/GATBPS_PROG_TEXI2ANY.m4:
	$(GENERATE) $@

m4/gatbps_fatal.m4:
	$(GENERATE) $@

m4/gatbps_notice.m4:
	$(GENERATE) $@

m4/gatbps_rule_word_error.m4:
	$(GENERATE) $@

src/tools/rules_code.m4:
	$(GENERATE) $@

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
