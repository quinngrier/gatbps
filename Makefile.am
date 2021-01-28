## begin_variables

AM_MAKEINFOFLAGS = \
  '-I' \
  'doc/texi' \
  '-I' \
  $(srcdir)'/doc/texi' \
$(prevent_a_blank_line)

AM_MAKEINFOHTMLFLAGS =
AM_MAKEINFOHTMLFLAGS += $(AM_MAKEINFOFLAGS)
AM_MAKEINFOHTMLFLAGS += '--css-include=texinfo.css'
AM_MAKEINFOHTMLFLAGS += '--no-headers'
AM_MAKEINFOHTMLFLAGS += '--no-split'
AM_MAKEINFOHTMLFLAGS += '--set-customization-variable' 'TOP_NODE_UP=Top'

AM_TEXI2DVIFLAGS = \
  $(AM_MAKEINFOFLAGS) \
$(prevent_a_blank_line)

CLEANFILES =

DISTCLEANFILES =

EXTRA_DIST =
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

TEXI2DVI = \
  'texi2dvi' \
  $(AM_TEXI2DVIFLAGS) \
  $(TEXI2DVIFLAGS) \
$(prevent_a_blank_line)

bin_SCRIPTS =

info_TEXINFOS =

man_MANS =
man_MANS += doc/man/gatbps.1

pkgsysconfdir = $(sysconfdir)/$(PACKAGE_TARNAME)

## end_variables

## begin_rules

## end_rules

## begin_includes

include $(srcdir)/bin/gatbps.am
include $(srcdir)/doc/gatbps.am

## end_includes

## begin_includes

include $(srcdir)/build-aux/GATBPS_CONFIG_FILE_RULES.am
include $(srcdir)/build-aux/GATBPS_CONFIG_LATER_RULES.am
include $(srcdir)/build-aux/GATBPS_CP_RULES.am
include $(srcdir)/build-aux/GATBPS_M4_RULES.am
include $(srcdir)/build-aux/GATBPS_RECIPE_MARKER.am
include $(srcdir)/build-aux/GATBPS_VPATH_SEARCH.am
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
