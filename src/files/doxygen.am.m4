changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/doxygen.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: doxygen.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

SUFFIXES += .am_dfv_INPUT
SUFFIXES += .dfv

## end_variables

## begin_rules

.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-main

.am_dfv_INPUT.dfv:
	$(AM_V_GEN)':'
	$(AM_V_at){ \
  if 'test' '-f' $<; then \
    d='.'; \
  else \
    d=$(srcdir); \
  fi; \
  $(SED) \
    '/[^+]=/d;s/+=[	 ]*/&VPATH:/;/+=/s/^[^+]*/INPUT /' \
    <"$${d}"'/'$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}

clean-doxygen-main:
	-{ \
  case ''$(doxygen_dst) in \
    ?*) \
      'rm' \
        '-f' \
        '-r' \
        './'$(doxygen_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

doxygen: doxygen-main

doxygen-main: $(doxygen_dst)

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
