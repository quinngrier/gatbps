## begin_variables

AM_MAKEINFOFLAGS =
AM_MAKEINFOFLAGS += '-I' 'doc/texi' '-I' $(srcdir)'/doc/texi'

AM_MAKEINFOHTMLFLAGS =
AM_MAKEINFOHTMLFLAGS += $(AM_MAKEINFOFLAGS)
AM_MAKEINFOHTMLFLAGS += '--css-include=texinfo.css'
AM_MAKEINFOHTMLFLAGS += '--no-headers'
AM_MAKEINFOHTMLFLAGS += '--no-split'
AM_MAKEINFOHTMLFLAGS += '--set-customization-variable' 'TOP_NODE_UP=Top'

AM_TEXI2DVIFLAGS =
AM_TEXI2DVIFLAGS += $(AM_MAKEINFOFLAGS)

CLEANFILES =

DISTCLEANFILES =

EXTRA_DIST =
EXTRA_DIST += $(bin_gatbps_src)
EXTRA_DIST += $(docbook_dist_dst)
EXTRA_DIST += $(dvi_dist_dst)
EXTRA_DIST += $(html_dist_dst)
EXTRA_DIST += $(pdf_dist_dst)
EXTRA_DIST += $(plaintext_dist_dst)
EXTRA_DIST += $(ps_dist_dst)
EXTRA_DIST += $(xml_dist_dst)
EXTRA_DIST += AUTHORS
EXTRA_DIST += CC0-1.0.txt
EXTRA_DIST += COPYING
EXTRA_DIST += ChangeLog
EXTRA_DIST += DATE
EXTRA_DIST += INSTALL
EXTRA_DIST += NEWS
EXTRA_DIST += README
EXTRA_DIST += VERSION
EXTRA_DIST += build-aux/DATE.sh
EXTRA_DIST += build-aux/VERSION.sh
EXTRA_DIST += build-aux/echo.sh
EXTRA_DIST += build-aux/sh-form.sh

GATBPS_M4FLAGS =
GATBPS_M4FLAGS += '-I' $(srcdir)

MAINTAINERCLEANFILES =

MOSTLYCLEANFILES =

SUFFIXES =

TEXI2DVI =
TEXI2DVI += 'texi2dvi' $(AM_TEXI2DVIFLAGS) $(TEXI2DVIFLAGS)

bin_SCRIPTS =

docbook_dep =
docbook_dep += $(doc_gatbps_TEXINFOS)

docbook_dist_dep =
docbook_dist_dep += $(doc_gatbps_TEXINFOS)
docbook_dist_dep += doc/gatbps.texi

docbook_dist_dst =
docbook_dist_dst += doc/gatbps-$(PACKAGE_VERSION)-docbook.xml

docbook_dist_src =
docbook_dist_src += doc/gatbps-docbook.xml

docbook_dst =
docbook_dst += doc/gatbps-docbook.xml

docbook_src =
docbook_src += doc/gatbps.texi

dvi_dist_dep =
dvi_dist_dep += $(doc_gatbps_TEXINFOS)
dvi_dist_dep += doc/gatbps.texi

dvi_dist_dst =
dvi_dist_dst += doc/gatbps-$(PACKAGE_VERSION).dvi

dvi_dist_src =
dvi_dist_src += doc/gatbps.dvi

html_dist_dep =
html_dist_dep += $(doc_gatbps_TEXINFOS)
html_dist_dep += doc/gatbps.texi

html_dist_dst =
html_dist_dst += doc/gatbps-$(PACKAGE_VERSION).html

html_dist_src =
html_dist_src += doc/gatbps.html

info_TEXINFOS =
info_TEXINFOS += doc/gatbps.texi

man_MANS =
man_MANS += doc/man/gatbps.1

nodist_bin_gatbps_src =
nodist_bin_gatbps_src += src/tools/AWK_DEFAULT_SH.m4
nodist_bin_gatbps_src += src/tools/AWK_DEFAULT_TROFF.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_DATE.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_DATE_DAY_ZPAD.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_DATE_MONTH_ZPAD.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_DATE_TROFF.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_DATE_YEAR.m4
nodist_bin_gatbps_src += src/tools/PACKAGE_VERSION.m4
nodist_bin_gatbps_src += src/tools/SED_DEFAULT_SH.m4
nodist_bin_gatbps_src += src/tools/SED_DEFAULT_TROFF.m4
nodist_bin_gatbps_src += src/tools/SHEBANG_LINE.m4
nodist_bin_gatbps_src += src/tools/TEXI2ANY_DEFAULT_SH.m4
nodist_bin_gatbps_src += src/tools/TEXI2ANY_DEFAULT_TROFF.m4

pdf_dist_dep =
pdf_dist_dep += $(doc_gatbps_TEXINFOS)
pdf_dist_dep += doc/gatbps.texi

pdf_dist_dst =
pdf_dist_dst += doc/gatbps-$(PACKAGE_VERSION).pdf

pdf_dist_src =
pdf_dist_src += doc/gatbps.pdf

plaintext_dep =
plaintext_dep += $(doc_gatbps_TEXINFOS)

plaintext_dist_dep =
plaintext_dist_dep += $(doc_gatbps_TEXINFOS)
plaintext_dist_dep += doc/gatbps.texi

plaintext_dist_dst =
plaintext_dist_dst += doc/gatbps-$(PACKAGE_VERSION).txt

plaintext_dist_src =
plaintext_dist_src += doc/gatbps.txt

plaintext_dst =
plaintext_dst += doc/gatbps.txt

plaintext_src =
plaintext_src += doc/gatbps.texi

ps_dist_dep =
ps_dist_dep += $(doc_gatbps_TEXINFOS)
ps_dist_dep += doc/gatbps.texi

ps_dist_dst =
ps_dist_dst += doc/gatbps-$(PACKAGE_VERSION).ps

ps_dist_src =
ps_dist_src += doc/gatbps.ps

xml_dep =
xml_dep += $(doc_gatbps_TEXINFOS)

xml_dist_dep =
xml_dist_dep += $(doc_gatbps_TEXINFOS)
xml_dist_dep += doc/gatbps.texi

xml_dist_dst =
xml_dist_dst += doc/gatbps-$(PACKAGE_VERSION).xml

xml_dist_src =
xml_dist_src += doc/gatbps.xml

xml_dst =
xml_dst += doc/gatbps.xml

xml_src =
xml_src += doc/gatbps.texi

## end_variables

## begin_rules

## end_rules

## begin_includes

include $(srcdir)/bin/gatbps.am
include $(srcdir)/build-aux/GATBPS_CONFIG_FILE_RULES.am
include $(srcdir)/build-aux/GATBPS_CP_RULES.am
include $(srcdir)/build-aux/GATBPS_M4_RULES.am
include $(srcdir)/build-aux/GATBPS_RECIPE_MARKER.am
include $(srcdir)/build-aux/GATBPS_VPATH_SEARCH.am
include $(srcdir)/build-aux/GATBPS_V_NOP.am
include $(srcdir)/build-aux/GATBPS_V_PAD.am
include $(srcdir)/build-aux/cp.am
include $(srcdir)/build-aux/docbook-dist.am
include $(srcdir)/build-aux/docbook.am
include $(srcdir)/build-aux/dvi-dist.am
include $(srcdir)/build-aux/html-dist.am
include $(srcdir)/build-aux/m4.am
include $(srcdir)/build-aux/pdf-dist.am
include $(srcdir)/build-aux/plaintext-dist.am
include $(srcdir)/build-aux/plaintext.am
include $(srcdir)/build-aux/ps-dist.am
include $(srcdir)/build-aux/xml-dist.am
include $(srcdir)/build-aux/xml.am
include $(srcdir)/doc/gatbps.am

## end_includes

include $(srcdir)/build-aux/CC0-1.0-AM-COPYRIGHT.am

##
## The authors of this file have waived all copyright and
## related or neighboring rights to the extent permitted by
## law as described by the CC0 1.0 Universal Public Domain
## Dedication. You should have received a copy of the full
## dedication along with this file, typically as a file
## named <CC0-1.0.txt>. If not, it may be available at
## <https://creativecommons.org/publicdomain/zero/1.0/>.
##
