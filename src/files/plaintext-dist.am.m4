changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/plaintext-dist.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: plaintext-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(plaintext_dist_dst): $(plaintext_dist_dep)
	$(AM_V_at)$(GATBPS_RECIPE_STARTING)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_dist_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|plaintext_dist_dep|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MAKE|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_dist_src|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|srcdir|%}){%||%}dnl
{%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(plaintext_dist_src) \
;
	$(GATBPS_V_CP)$(GATBPS_V_NOP)
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(plaintext_dist_src); then \
    d='.'; \
  else \
    d=$(srcdir); \
    if 'test' '-f' "$${d}"'/'$(plaintext_dist_src); then \
      ':'; \
    else \
      $(SHELL) \
        '-' \
        $(srcdir)'/build-aux/gatbps-echo.sh' \
        'error: missing prerequisite:' \
        '"'$(plaintext_dist_src)'"' \
        1>&2 \
      ; \
      exit 1; \
    fi; \
    case "$${d}" in \
      '/'*) \
      ;; \
      *) \
        d='./'"$${d}"; \
      ;; \
    esac; \
  fi; \
  'cp' \
    "$${d}"'/'$(plaintext_dist_src) \
    './'$(plaintext_dist_dst) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-plaintext-dist
.PHONY: clean-plaintext-dist-main
.PHONY: plaintext-dist
.PHONY: plaintext-dist-main

clean-plaintext-dist: clean-plaintext-dist-main

clean-plaintext-dist-main:
	-{ \
  x=''; \
  for y in $(plaintext_dist_dst); do \
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
        './'$(plaintext_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

maintainer-clean-local: clean-plaintext-dist

plaintext-dist: plaintext-dist-main

plaintext-dist-main: $(plaintext_dist_dst)

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
