CLEANFILES =
CLEANFILES += gatbps
CLEANFILES += gatbps.1

EXTRA_DIST =
EXTRA_DIST += $(srcdir)/DATE
EXTRA_DIST += $(srcdir)/DATE.sh
EXTRA_DIST += $(srcdir)/VERSION
EXTRA_DIST += $(srcdir)/VERSION.sh
EXTRA_DIST += $(srcdir)/gatbps.1.in
EXTRA_DIST += $(srcdir)/gatbps.in

bin_SCRIPTS =
bin_SCRIPTS += gatbps

do_subst = ( sed \
  -e 's|[@]PACKAGE_DATE@|$(PACKAGE_DATE)|g' \
  -e 's|[@]PACKAGE_STRING@|$(PACKAGE_STRING)|g' \
  -e 's|[@]PACKAGE_VERSION@|$(PACKAGE_VERSION)|g' \
  )

gatbps: Makefile $(srcdir)/gatbps.in
	$(do_subst) <$(srcdir)/gatbps.in >gatbps
	chmod +x gatbps

gatbps.1: Makefile $(srcdir)/gatbps.1.in
	$(do_subst) <$(srcdir)/gatbps.1.in >gatbps.1

##
## The authors of this file have waived all copyright and
## related or neighboring rights to the extent permitted by
## law as described by the CC0 1.0 Universal Public Domain
## Dedication. You should have received a copy of the full
## dedication along with this file, typically as a file
## named <CC0-1.0.txt>. If not, it may be available at
## <https://creativecommons.org/publicdomain/zero/1.0/>.
##
