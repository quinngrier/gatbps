changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/ps-dist-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: ps-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(ps_dist_dst): $(ps_dist_dep)
	$(GATBPS_V_CP)':'
	$(AM_V_at){ \
  x=''; \
  for y in $(ps_dist_dst); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'echo' \
          '$$(ps_dist_dst)' \
          'contains multiple words' \
          >&2 \
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
    '$$(ps_dist_dst)' \
    'is not set' \
    >&2 \
  ; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  x=''; \
  for y in $(ps_dist_src); do \
    x="$${x}"'x'; \
    case "$${x}" in \
      ??*) \
        'echo' \
          '$$(ps_dist_src)' \
          'contains multiple words' \
          >&2 \
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
    '$$(ps_dist_src)' \
    'is not set' \
    >&2 \
  ; \
  'exit' '1'; \
:;}
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(ps_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(ps_dist_src); then \
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
    "$${d}"'/'$(ps_dist_src) \
    './'$(ps_dist_dst) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-ps-dist
.PHONY: clean-ps-dist-main
.PHONY: ps-dist
.PHONY: ps-dist-main

clean-ps-dist: clean-ps-dist-main

clean-ps-dist-main:
	-{ \
  x=''; \
  for y in $(ps_dist_dst); do \
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
        './'$(ps_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

maintainer-clean-local: clean-ps-dist

ps-dist: ps-dist-main

ps-dist-main: $(ps_dist_dst)

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
