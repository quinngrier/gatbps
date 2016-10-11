changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/javadoc-dist.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: javadoc-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(javadoc_dist_dst): $(javadoc_dist_dep)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadoc_dist_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|javadoc_dist_dep|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MAKE|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadoc_dist_src|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|srcdir|%}){%||%}dnl
{%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(javadoc_dist_src) \
;
	$(GATBPS_V_CP)$(GATBPS_RECIPE_MARKER_TOP)
	@$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at)'rm' \
  '-f' \
  '-r' \
  './'$(javadoc_dist_dst) \
;
	$(AM_V_at){ \
  if 'test' '-d' $(javadoc_dist_src); then \
    d='.'; \
  else \
    d=$(srcdir); \
    if 'test' '-d' "$${d}"'/'$(javadoc_dist_src); then \
      ':'; \
    else \
      'sh' \
        '-' \
        $(srcdir)'/build-aux/echo.sh' \
        'error: missing prerequisite:' \
        '"'$(javadoc_dist_src)'"' \
        >&2 \
      ; \
      'exit' '1'; \
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
    '-R' \
    "$${d}"'/'$(javadoc_dist_src) \
    './'$(javadoc_dist_dst) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-javadoc-dist
.PHONY: clean-javadoc-dist-main
.PHONY: javadoc-dist
.PHONY: javadoc-dist-main

clean-javadoc-dist: clean-javadoc-dist-main

clean-javadoc-dist-main:
	-{ \
  x=''; \
  for y in $(javadoc_dist_dst); do \
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
        '-r' \
        './'$(javadoc_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

javadoc-dist: javadoc-dist-main

javadoc-dist-main: $(javadoc_dist_dst)

maintainer-clean-local: clean-javadoc-dist

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
