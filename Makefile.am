EXTRA_DIST =
EXTRA_DIST += DATE
EXTRA_DIST += DATE.sh
EXTRA_DIST += VERSION
EXTRA_DIST += VERSION.sh

MOSTLYCLEANFILES =
MOSTLYCLEANFILES += gatbps.1
MOSTLYCLEANFILES += gatbps.info

bin_SCRIPTS =
bin_SCRIPTS += gatbps

gatbps.1: gatbps
	./gatbps --man >gatbps.1

gatbps_TEXINFOS =
gatbps_TEXINFOS += CC0-1.0-appendix.texi
gatbps_TEXINFOS += CC0-1.0-copying.texi
gatbps_TEXINFOS += bdots.texi
gatbps_TEXINFOS += mdot.texi
gatbps_TEXINFOS += mdots.texi
gatbps_TEXINFOS += msign.texi

info_TEXINFOS =
info_TEXINFOS += gatbps.texi

man_MANS =
man_MANS += gatbps.1

do_subst = ( sed \
  -e 's|[@]PACKAGE_DATE@|$(PACKAGE_DATE)|g' \
  -e 's|[@]PACKAGE_STRING@|$(PACKAGE_STRING)|g' \
  -e 's|[@]PACKAGE_VERSION@|$(PACKAGE_VERSION)|g' \
  )

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
