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

GATBPS_AM_DFV_INPUT_SCRIPT = '{ \
  if ($$0 ~ /+=/) { \
    sub(/+=[	 ]*/, "+= VPATH:"); \
    sub(/^[^+]*/, "INPUT "); \
    print $$0; \
  } \
}'

SUFFIXES += .am_dfv_INPUT
SUFFIXES += .df
SUFFIXES += .dfv

## end_variables

## begin_rules

.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-main

.am_dfv_INPUT.dfv:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  $(AWK) \
    $(GATBPS_AM_DFV_INPUT_SCRIPT) \
    <$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.dfv.df:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  $(SED) \
    's/VPATH://' \
    <$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

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
