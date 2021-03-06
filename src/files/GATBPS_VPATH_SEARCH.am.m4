changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_VPATH_SEARCH.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: GATBPS_VPATH_SEARCH.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_VPATH_SEARCH_BOT = \
  ; then \
    GATBPS_VPATH_SEARCH_d='.'; \
  else \
    GATBPS_VPATH_SEARCH_d=$(srcdir); \
    case "$${GATBPS_VPATH_SEARCH_d}" in \
      '/'*) \
      ;; \
      *) \
        GATBPS_VPATH_SEARCH_d='./'"$${GATBPS_VPATH_SEARCH_d}"; \
      ;; \
    esac; \
  fi

GATBPS_VPATH_SEARCH_RESULT = "$${GATBPS_VPATH_SEARCH_d}"

GATBPS_VPATH_SEARCH_TOP = \
  if 'test' '-r'

## end_variables

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
