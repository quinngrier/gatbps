changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/java-dist.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: java-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(java_dist_dst): $(java_dist_dep)
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|java_dist_dst|%}){%|
	$(AM_V_at)|%}dnl
contains_at_least_one_word(
  {%|java_dist_dep|%}){%|
	$(AM_V_at)|%}dnl
contains_at_least_one_word(
  {%|MAKE|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|java_dist_src|%}){%|
	$(AM_V_at)|%}dnl
contains_at_least_one_word(
  {%|MKDIR_P|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|srcdir|%}){%|
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(java_dist_src) \
;
	$(GATBPS_V_CP)':'
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(java_dist_src); then \
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
    "$${d}"'/'$(java_dist_src) \
    './'$(java_dist_dst) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}

.PHONY: clean-java-dist
.PHONY: clean-java-dist-main
.PHONY: java-dist
.PHONY: java-dist-main

clean-java-dist: clean-java-dist-main

clean-java-dist-main:
	-{ \
  x=''; \
  for y in $(java_dist_dst); do \
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
        './'$(java_dist_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

java-dist: java-dist-main

java-dist-main: $(java_dist_dst)

maintainer-clean-local: clean-java-dist

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
