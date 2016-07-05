changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: pdf-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(pdf_dist_dst): $(pdf_dist_dep)
	$(AM_V_at){ \
  if $(AM_V_P); then \
    ':'; \
  else \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/echo.sh' \
      '  CP      ' \
      $@ \
    ; \
  fi; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) $(pdf_dist_src)
	$(AM_V_at)$(MKDIR_P) './'$(@D)
	$(AM_V_at)'cp' './'$(pdf_dist_src) './'$(pdf_dist_dst)

.PHONY: clean-$(pdf_dist_dst)

clean-$(pdf_dist_dst):
	-'rm' '-f' './'$(pdf_dist_dst)

maintainer-clean-local: clean-$(pdf_dist_dst)

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
