changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/dvi-dist-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: dvi-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(dvi_dist_dst): $(dvi_dist_dep)
	$(GATBPS_V_CP)':'
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|dvi_dist_dst|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|dvi_dist_src|%}){%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(dvi_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(dvi_dist_src); then \
    d='.'; \
  else \
    d=$(srcdir); \
    case "$${d}" in \
      '-'*) \
        d='./'"$${d}"; \
      ;; \
    esac; \
  fi; \
  'cp' \
    "$${d}"'/'$(dvi_dist_src) \
    './'$(dvi_dist_dst) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-dvi-dist
.PHONY: clean-dvi-dist-main
.PHONY: dvi-dist
.PHONY: dvi-dist-main

clean-dvi-dist: clean-dvi-dist-main

clean-dvi-dist-main:
	-{ \
  x=''; \
  for y in $(dvi_dist_dst); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'exit' '0'; \
      ;; \
    esac; \
  done; \
  case "$${x}" in \
    ?*) \
      'rm' \
        '-f' \
        './'$(dvi_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

dvi-dist: dvi-dist-main

dvi-dist-main: $(dvi_dist_dst)

maintainer-clean-local: clean-dvi-dist

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
