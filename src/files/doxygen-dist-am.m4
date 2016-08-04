changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/doxygen-dist-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: doxygen-dist.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(doxygen_dist_dst): $(doxygen_dist_dep)
	$(GATBPS_V_CP)$(MAKE) \
  $(AM_MAKEFLAGS) \
  $(doxygen_dist_src) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  case ''$(doxygen_dist_dst) in \
    ?*) \
      'rm' '-f' '-r' './'$(doxygen_dist_dst); \
      'exit' "$${?}"; \
    ;; \
  esac; \
:;}
	$(AM_V_at){ \
  if \
    'test' '-f' $(doxygen_dist_src) || \
    'test' '-d' $(doxygen_dist_src) \
  ; then \
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
    "$${d}"'/'$(doxygen_dist_src) \
    './'$(doxygen_dist_dst) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-doxygen-dist
.PHONY: clean-doxygen-dist-main
.PHONY: doxygen-dist-main

clean-doxygen-dist: clean-doxygen-dist-main

clean-doxygen-dist-main:
	-{ \
  case ''$(doxygen_dist_dst) in \
    ?*) \
      'rm' '-f' '-r' './'$(doxygen_dist_dst); \
    ;; \
  esac; \
  'exit' '0'; \
:;}

doxygen-dist-main: $(doxygen_dist_dst)

maintainer-clean-local: clean-doxygen-dist

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
