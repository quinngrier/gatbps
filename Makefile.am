AM_MAKEINFOFLAGS =
AM_MAKEINFOFLAGS += -I $(srcdir)/doc/texi

AM_TEXI2DVIFLAGS =
AM_TEXI2DVIFLAGS += -I $(srcdir)/doc/texi

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
doc_gatbps_TEXINFOS += doc/texi/Building-and-Installation.texi
doc_gatbps_TEXINFOS += doc/texi/CC0-1.0-appendix.texi
doc_gatbps_TEXINFOS += doc/texi/CC0-1.0-copying.texi
doc_gatbps_TEXINFOS += doc/texi/Copyright-Information.texi
doc_gatbps_TEXINFOS += doc/texi/DATE.texi
doc_gatbps_TEXINFOS += doc/texi/Introduction.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-gatbps.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-sh-form-sh.texi
doc_gatbps_TEXINFOS += doc/texi/Mathematical-Notation-in-Texinfo.texi
doc_gatbps_TEXINFOS += doc/texi/Special-File-Reference.texi
doc_gatbps_TEXINFOS += doc/texi/VERSION.txi
doc_gatbps_TEXINFOS += doc/texi/bdots.texi
doc_gatbps_TEXINFOS += doc/texi/bothcontents.texi
doc_gatbps_TEXINFOS += doc/texi/dslash.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Asynchronous-Events.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Consequences-of-Errors.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Description.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Environment-Variables.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Exit-Status.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Input-Files.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Operands.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Options.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Output-Files.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Error.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Input.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Output.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Synopsis.texi
doc_gatbps_TEXINFOS += doc/texi/gequ.texi
doc_gatbps_TEXINFOS += doc/texi/ipez.texi
doc_gatbps_TEXINFOS += doc/texi/lcei.texi
doc_gatbps_TEXINFOS += doc/texi/lequ.texi
doc_gatbps_TEXINFOS += doc/texi/lflo.texi
doc_gatbps_TEXINFOS += doc/texi/math.texi
doc_gatbps_TEXINFOS += doc/texi/mdot.texi
doc_gatbps_TEXINFOS += doc/texi/mdots.texi
doc_gatbps_TEXINFOS += doc/texi/msign.texi
doc_gatbps_TEXINFOS += doc/texi/nequ.texi
doc_gatbps_TEXINFOS += doc/texi/prm.texi
doc_gatbps_TEXINFOS += doc/texi/rarrow.texi
doc_gatbps_TEXINFOS += doc/texi/rcei.texi
doc_gatbps_TEXINFOS += doc/texi/rflo.texi
doc_gatbps_TEXINFOS += doc/texi/sbs.texi
doc_gatbps_TEXINFOS += doc/texi/sps.texi

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
  '-o' 'doc/gatbps.xml' \
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
