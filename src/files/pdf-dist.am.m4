changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/pdf-dist.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: pdf-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(pdf_dist_dst): $(pdf_dist_dep)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|pdf_dist_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|pdf_dist_dep|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MAKE|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|pdf_dist_src|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|srcdir|%}){%||%}dnl
{%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(pdf_dist_src) \
;
	$(GATBPS_V_CP)$(GATBPS_V_NOP)
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(pdf_dist_src); then \
    d='.'; \
  else \
    d=$(srcdir); \
    if 'test' '-f' "$${d}"'/'$(pdf_dist_src); then \
      ':'; \
    else \
      $(SHELL) \
        '-' \
        $(srcdir)'/build-aux/echo.sh' \
        'error: missing prerequisite:' \
        '"'$(pdf_dist_src)'"' \
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
    "$${d}"'/'$(pdf_dist_src) \
    './'$(pdf_dist_dst) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-pdf-dist
.PHONY: clean-pdf-dist-main
.PHONY: pdf-dist
.PHONY: pdf-dist-main

clean-pdf-dist: clean-pdf-dist-main

clean-pdf-dist-main:
	-{ \
  x=''; \
  for y in $(pdf_dist_dst); do \
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
        './'$(pdf_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

maintainer-clean-local: clean-pdf-dist

pdf-dist: pdf-dist-main

pdf-dist-main: $(pdf_dist_dst)

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
