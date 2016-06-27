changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: docbook-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(docbook_dist_dst): $(docbook_dist_dep)
	$(MAKE) $(AM_MAKEFLAGS) $(docbook_dist_src)
	$(MKDIR_P) './'$(@D)
	cp $(docbook_dist_src) $(docbook_dist_dst)

.PHONY: clean-$(docbook_dist_dst)

clean-$(docbook_dist_dst):
	-'rm' '-f' './'$(docbook_dist_dst)

maintainer-clean-local: clean-$(docbook_dist_dst)

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
