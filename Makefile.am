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
MOSTLYCLEANFILES += gatbps.info
MOSTLYCLEANFILES += gatbps.txt
MOSTLYCLEANFILES += gatbps.xml

TEXI2DVI = texi2dvi $(AM_TEXI2DVIFLAGS) $(TEXI2DVIFLAGS)

bin_SCRIPTS =
bin_SCRIPTS += gatbps

gatbps_TEXINFOS =
gatbps_TEXINFOS += Building-and-Installation.texi
gatbps_TEXINFOS += CC0-1.0-appendix.texi
gatbps_TEXINFOS += CC0-1.0-copying.texi
gatbps_TEXINFOS += Copyright-Information.texi
gatbps_TEXINFOS += DATE.texi
gatbps_TEXINFOS += Introduction.texi
gatbps_TEXINFOS += Invoking-gatbps.texi
gatbps_TEXINFOS += Invoking-sh-form-sh.texi
gatbps_TEXINFOS += Mathematical-Notation-in-Texinfo.texi
gatbps_TEXINFOS += Special-File-Reference.texi
gatbps_TEXINFOS += VERSION.txi
gatbps_TEXINFOS += bdots.texi
gatbps_TEXINFOS += bothcontents.texi
gatbps_TEXINFOS += dslash.texi
gatbps_TEXINFOS += gatbps-Asynchronous-Events.texi
gatbps_TEXINFOS += gatbps-Consequences-of-Errors.texi
gatbps_TEXINFOS += gatbps-Description.texi
gatbps_TEXINFOS += gatbps-Environment-Variables.texi
gatbps_TEXINFOS += gatbps-Exit-Status.texi
gatbps_TEXINFOS += gatbps-Input-Files.texi
gatbps_TEXINFOS += gatbps-Operands.texi
gatbps_TEXINFOS += gatbps-Options.texi
gatbps_TEXINFOS += gatbps-Output-Files.texi
gatbps_TEXINFOS += gatbps-Standard-Error.texi
gatbps_TEXINFOS += gatbps-Standard-Input.texi
gatbps_TEXINFOS += gatbps-Standard-Output.texi
gatbps_TEXINFOS += gatbps-Synopsis.texi
gatbps_TEXINFOS += gequ.texi
gatbps_TEXINFOS += ipez.texi
gatbps_TEXINFOS += lcei.texi
gatbps_TEXINFOS += lequ.texi
gatbps_TEXINFOS += lflo.texi
gatbps_TEXINFOS += math.texi
gatbps_TEXINFOS += mdot.texi
gatbps_TEXINFOS += mdots.texi
gatbps_TEXINFOS += msign.texi
gatbps_TEXINFOS += nequ.texi
gatbps_TEXINFOS += prm.texi
gatbps_TEXINFOS += rarrow.texi
gatbps_TEXINFOS += rcei.texi
gatbps_TEXINFOS += rflo.texi
gatbps_TEXINFOS += sbs.texi
gatbps_TEXINFOS += sps.texi

info_TEXINFOS =
info_TEXINFOS += gatbps.texi

man_MANS =
man_MANS += gatbps.1

txtdir = $(docdir)

.PHONY: docbook
.PHONY: txt

docbook: gatbps.xml

gatbps.1: gatbps
	./gatbps --man >gatbps.1

gatbps.txt: $(gatbps_TEXINFOS)
gatbps.txt: gatbps.texi
	$(AM_V_MAKEINFO)$(MAKEINFO) \
  $(AM_MAKEINFOFLAGS) \
  $(MAKEINFOFLAGS) \
  '--plaintext' \
  '-I' '$(srcdir)' \
  '-o' '$@AT@' \
  '$(srcdir)/gatbps.texi'

gatbps.xml: $(gatbps_TEXINFOS)
gatbps.xml: gatbps.texi
	$(AM_V_MAKEINFO)$(MAKEINFO) \
  $(AM_MAKEINFOFLAGS) \
  $(MAKEINFOFLAGS) \
  '--docbook' \
  '-I' '$(srcdir)' \
  '-o' '$@AT@' \
  '$(srcdir)/gatbps.texi'

txt: gatbps.txt

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
