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

GATBPS_AM_DFV_INPUT_TO_DFV_SCRIPT = ' \
  { \
    if ($$0 ~ /+=/) { \
      sub(/+=[	 ]*/, "+= VPATH:"); \
      sub(/^[^+]*/, "INPUT "); \
      print $$0; \
    } \
  } \
'

GATBPS_DFV_TO_DF_SCRIPT = ' \
  { \
    if ($$0 ~ /VPATH:/) { \
      n = split($$0, x, /VPATH:/); \
      for (i = 2; i != n; ++i) { \
        x[2] = x[2] "VPATH:" x[i + 1]; \
      } \
      y = x[2]; \
      gsub(/'\''/, "'\''\\'\'''\''", y); \
      if (system("'\''test'\'' '\''-r'\'' '\''" y "'\''") == 0) { \
        print x[1] x[2]; \
      } else { \
        print x[1] "$$(srcdir)/" x[2]; \
      } \
    } \
  } \
'

GATBPS_V_DOXYGEN = $(GATBPS_V_DOXYGEN_@AM_V@)

GATBPS_V_DOXYGEN_ = $(GATBPS_V_DOXYGEN_@AM_DEFAULT_V@)

GATBPS_V_DOXYGEN_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'DOXYGEN'$(GATBPS_V_PAD_RIGHT_7) \
  $@ \
|| 'exit' '1';

GATBPS_V_DOXYGEN_1 =

SUFFIXES += .am_dfv_INPUT
SUFFIXES += .df
SUFFIXES += .dfv

## end_variables

## begin_rules

$(doxygen_dst): $(doxygen_dep)
$(doxygen_dst): $(doxygen_src)
	$(GATBPS_V_DOXYGEN)$(GATBPS_RECIPE_MARKER_TOP)
	rm -f $(doxygen_dfv_df)
	$(MAKE) $(doxygen_dfv_df)
	srcdir=$(srcdir) $(DOXYGEN) $(doxygen_src)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: $(doxygen_dst)
.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-main

.am_dfv_INPUT.dfv:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  $(AWK) \
    $(GATBPS_AM_DFV_INPUT_TO_DFV_SCRIPT) \
    <$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.dfv.df:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  $(AWK) \
    $(GATBPS_DFV_TO_DF_SCRIPT) \
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
