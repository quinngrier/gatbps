changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/javadoc-dist-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
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
	$(GATBPS_V_CP)':' \
	$(AM_V_at){ \
  case ''$(javadoc_dist_dst) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  case ''$(javadoc_dist_src) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(javadoc_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
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
    case "$${d}" in \
      '-'*) \
        d='./'"$${d}"; \
      ;; \
    esac; \
  fi; \
  'cp' \
    '-R' \
    "$${d}"'/'$(javadoc_dist_src) \
    './'$(javadoc_dist_dst) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-javadoc-dist
.PHONY: clean-javadoc-dist-main
.PHONY: javadoc-dist
.PHONY: javadoc-dist-main

clean-javadoc-dist: clean-javadoc-dist-main

clean-javadoc-dist-main:
	-{ \
  case ''$(javadoc_dist_dst) in \
    ?*) \
      'rm' '-f' '-r' './'$(javadoc_dist_dst); \
    ;; \
  esac; \
  'exit' '0'; \
:;}

javadoc-dist: javadoc-dist-main

javadoc-dist-main: $(javadoc_dist_dst)

maintainer-clean-local: clean-javadoc-dist

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
