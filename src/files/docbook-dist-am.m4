changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/docbook-dist-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: docbook-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(docbook_dist_dst): $(docbook_dist_dep)
	$(GATBPS_V_CP)':'
	$(AM_V_at){ \
  x=''; \
  for y in $(docbook_dist_dst); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'echo' \
          '$$(docbook_dist_dst)' \
          'contains multiple words' \
        ; \
        'exit' '1'; \
      ;; \
    esac; \
  done; \
  case "$${x}" in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'echo' \
    '$$(docbook_dist_dst)' \
    'is not set' \
  ; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  x=''; \
  for y in $(docbook_dist_src); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'echo' \
          '$$(docbook_dist_src)' \
          'contains multiple words' \
        ; \
        'exit' '1'; \
      ;; \
    esac; \
  done; \
  case "$${x}" in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'echo' \
    '$$(docbook_dist_src)' \
    'is not set' \
  ; \
  'exit' '1'; \
:;}
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(docbook_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(docbook_dist_src); then \
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
    "$${d}"'/'$(docbook_dist_src) \
    './'$(docbook_dist_dst) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-docbook-dist
.PHONY: clean-docbook-dist-main
.PHONY: docbook-dist
.PHONY: docbook-dist-main

clean-docbook-dist: clean-docbook-dist-main

clean-docbook-dist-main:
	-{ \
  x=''; \
  for y in $(docbook_dist_dst); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'break'; \
      ;; \
    esac; \
  done; \
  case "$${x}" in \
    ??*) \
      ':'; \
    ;; \
    ?*) \
      'rm' \
        '-f' \
        './'$(docbook_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

docbook-dist: docbook-dist-main

docbook-dist-main: $(docbook_dist_dst)

maintainer-clean-local: clean-docbook-dist

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
