changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/xml-dist.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: xml-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(xml_dist_dst): $(xml_dist_dep)
	$(GATBPS_V_CP)':'
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|xml_dist_dst|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|xml_dist_src|%}){%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(xml_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(xml_dist_src); then \
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
    "$${d}"'/'$(xml_dist_src) \
    './'$(xml_dist_dst) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}

.PHONY: clean-xml-dist
.PHONY: clean-xml-dist-main
.PHONY: xml-dist
.PHONY: xml-dist-main

clean-xml-dist: clean-xml-dist-main

clean-xml-dist-main:
	-{ \
  x=''; \
  for y in $(xml_dist_dst); do \
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
        './'$(xml_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

maintainer-clean-local: clean-xml-dist

xml-dist: xml-dist-main

xml-dist-main: $(xml_dist_dst)

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
