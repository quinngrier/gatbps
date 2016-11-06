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

GATBPS_AM_DF_INPUT_TO_DF_SCRIPT = ' \
  { \
    if ($$0 ~ /+=/) { \
      sub(/+=[	 ]*/, "+= VPATH_SEARCH:"); \
      sub(/^[^+]*/, "INPUT "); \
      print $$0; \
    } \
  } \
'

GATBPS_DF_TO_DFV_SCRIPT = ' \
  { \
    if ($$0 ~ /VPATH_SEARCH:/) { \
      n = split($$0, x, /VPATH_SEARCH:/); \
      for (i = 2; i != n; ++i) { \
        x[2] = x[2] "VPATH_SEARCH:" x[i + 1]; \
      } \
      y = x[2]; \
      gsub(/'\''/, "'\''\\'\'''\''", y); \
      if (system("'\''test'\'' '\''-r'\'' '\''" y "'\''") == 0) { \
        $$0 = x[1] x[2]; \
      } else { \
        $$0 = x[1] "$$(srcdir)/" x[2]; \
      } \
    } \
    print $$0; \
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
|| 'exit' "$${?}";

GATBPS_V_DOXYGEN_1 =

SUFFIXES += .am_df_INPUT
SUFFIXES += .df
SUFFIXES += .dfv

## end_variables

## begin_rules

$(doxygen_dfv) doxygen.dummy1.main: doxygen-always-make

$(doxygen_dst): $(doxygen_dep)
$(doxygen_dst): $(doxygen_dfv)
$(doxygen_dst): $(doxygen_src)
	$(GATBPS_V_DOXYGEN)$(GATBPS_RECIPE_MARKER_TOP)
	@$(MKDIR_P) './'$(@D)
	srcdir=$(srcdir) $(DOXYGEN) $(doxygen_src)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

$(doxygen_src): doxygen-always-make

.PHONY: clean-doxygen
.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-always-make
.PHONY: doxygen-main

.am_df_INPUT.df:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	@$(MKDIR_P) './'$(@D)
	$(AM_V_at){ \
  $(AWK) \
    $(GATBPS_AM_DF_INPUT_TO_DF_SCRIPT) \
    <$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.df.dfv:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	@$(MKDIR_P) './'$(@D)
	$(AM_V_at){ \
  $(AWK) \
    $(GATBPS_DF_TO_DFV_SCRIPT) \
    <$< \
    >$@ \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

clean-doxygen: clean-doxygen-main

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

clean-local: clean-doxygen

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
