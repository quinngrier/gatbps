AM_MAKEINFOFLAGS =
AM_MAKEINFOFLAGS += -I $(srcdir)

AM_TEXI2DVIFLAGS =
AM_TEXI2DVIFLAGS += -I $(srcdir)

EXTRA_DIST =
EXTRA_DIST += AUTHORS
EXTRA_DIST += CC0-1.0.txt
EXTRA_DIST += COPYING
EXTRA_DIST += ChangeLog
EXTRA_DIST += DATE
EXTRA_DIST += DATE.sh
EXTRA_DIST += INSTALL
EXTRA_DIST += NEWS
EXTRA_DIST += README
EXTRA_DIST += VERSION
EXTRA_DIST += VERSION.sh
EXTRA_DIST += sh-form.sh

MOSTLYCLEANFILES =
MOSTLYCLEANFILES += gatbps.1
MOSTLYCLEANFILES += doc/gatbps.info
MOSTLYCLEANFILES += doc/gatbps.txt
MOSTLYCLEANFILES += doc/gatbps.xml

TEXI2DVI = texi2dvi $(AM_TEXI2DVIFLAGS) $(TEXI2DVIFLAGS)

bin_SCRIPTS =
bin_SCRIPTS += gatbps

doc_gatbps_TEXINFOS =
doc_gatbps_TEXINFOS += Building-and-Installation.texi
doc_gatbps_TEXINFOS += CC0-1.0-appendix.texi
doc_gatbps_TEXINFOS += CC0-1.0-copying.texi
doc_gatbps_TEXINFOS += Copyright-Information.texi
doc_gatbps_TEXINFOS += DATE.texi
doc_gatbps_TEXINFOS += Introduction.texi
doc_gatbps_TEXINFOS += Invoking-gatbps.texi
doc_gatbps_TEXINFOS += Invoking-sh-form-sh.texi
doc_gatbps_TEXINFOS += Mathematical-Notation-in-Texinfo.texi
doc_gatbps_TEXINFOS += Special-File-Reference.texi
doc_gatbps_TEXINFOS += VERSION.txi
doc_gatbps_TEXINFOS += bdots.texi
doc_gatbps_TEXINFOS += bothcontents.texi
doc_gatbps_TEXINFOS += dslash.texi
doc_gatbps_TEXINFOS += gatbps-Asynchronous-Events.texi
doc_gatbps_TEXINFOS += gatbps-Consequences-of-Errors.texi
doc_gatbps_TEXINFOS += gatbps-Description.texi
doc_gatbps_TEXINFOS += gatbps-Environment-Variables.texi
doc_gatbps_TEXINFOS += gatbps-Exit-Status.texi
doc_gatbps_TEXINFOS += gatbps-Input-Files.texi
doc_gatbps_TEXINFOS += gatbps-Operands.texi
doc_gatbps_TEXINFOS += gatbps-Options.texi
doc_gatbps_TEXINFOS += gatbps-Output-Files.texi
doc_gatbps_TEXINFOS += gatbps-Standard-Error.texi
doc_gatbps_TEXINFOS += gatbps-Standard-Input.texi
doc_gatbps_TEXINFOS += gatbps-Standard-Output.texi
doc_gatbps_TEXINFOS += gatbps-Synopsis.texi
doc_gatbps_TEXINFOS += gequ.texi
doc_gatbps_TEXINFOS += ipez.texi
doc_gatbps_TEXINFOS += lcei.texi
doc_gatbps_TEXINFOS += lequ.texi
doc_gatbps_TEXINFOS += lflo.texi
doc_gatbps_TEXINFOS += math.texi
doc_gatbps_TEXINFOS += mdot.texi
doc_gatbps_TEXINFOS += mdots.texi
doc_gatbps_TEXINFOS += msign.texi
doc_gatbps_TEXINFOS += nequ.texi
doc_gatbps_TEXINFOS += prm.texi
doc_gatbps_TEXINFOS += rarrow.texi
doc_gatbps_TEXINFOS += rcei.texi
doc_gatbps_TEXINFOS += rflo.texi
doc_gatbps_TEXINFOS += sbs.texi
doc_gatbps_TEXINFOS += sps.texi

info_TEXINFOS =
info_TEXINFOS += doc/gatbps.texi

man_MANS =
man_MANS += gatbps.1

txtdir = $(docdir)

.PHONY: docbook
.PHONY: txt

docbook: doc/gatbps.xml

gatbps.1: gatbps
	./gatbps --man >gatbps.1

doc/gatbps.txt: $(doc_gatbps_TEXINFOS)
doc/gatbps.txt: doc/gatbps.texi
	$(AM_V_MAKEINFO)$(MKDIR_P) 'doc'
	$(AM_V_at)$(MAKEINFO) \
  $(AM_MAKEINFOFLAGS) \
  $(MAKEINFOFLAGS) \
  '--plaintext' \
  '-I' '$(srcdir)' \
  '-o' 'doc/gatbps.txt' \
  '$(srcdir)/doc/gatbps.texi'

doc/gatbps.xml: $(doc_gatbps_TEXINFOS)
doc/gatbps.xml: doc/gatbps.texi
	$(AM_V_MAKEINFO)$(MKDIR_P) 'doc'
	$(AM_V_at)$(MAKEINFO) \
  $(AM_MAKEINFOFLAGS) \
  $(MAKEINFOFLAGS) \
  '--docbook' \
  '-I' '$(srcdir)' \
  '-o' '$@AT@' \
  '$(srcdir)/doc/gatbps.texi'

txt: doc/gatbps.txt

include $(srcdir)/CC0-1.0-AM-COPYRIGHT.am

##
## The authors of this file have waived all copyright and
## related or neighboring rights to the extent permitted by
## law as described by the CC0 1.0 Universal Public Domain
## Dedication. You should have received a copy of the full
## dedication along with this file, typically as a file
## named <CC0-1.0.txt>. If not, it may be available at
## <https://creativecommons.org/publicdomain/zero/1.0/>.
##
