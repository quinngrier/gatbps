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
      n = split($$0, line_parts, /VPATH_SEARCH:/); \
      line_head = line_parts[1]; \
      line_tail = line_parts[2]; \
      for (i = 2; i != n; ++i) { \
        line_tail = line_tail "VPATH_SEARCH:" line_parts[i + 1]; \
      } \
      if (line_tail ~ /^".*"$$/) { \
        raw_path = ""; \
        in_escape = 0; \
        for (i = 1; i != length(line_tail) - 1; ++i) { \
          c = substr(line_tail, i + 1, 1); \
          if (in_escape) { \
            if (c == "\"") { \
              raw_path = raw_path "\""; \
            } else if (c == "\\") { \
              raw_path = raw_path "\\"; \
            } else { \
              raw_path = raw_path "\\" c; \
            } \
            in_escape = 0; \
          } else if (c == "\\") { \
            in_escape = 1; \
          } else { \
            raw_path = raw_path c; \
          } \
        } \
        if (in_escape) { \
          raw_path = raw_path "\\"; \
        } \
      } \
      y = raw_path; \
      gsub(/'\''/, "'\''\\'\'''\''", y); \
      gsub(/\\/, "\\\\", raw_path); \
      gsub(/"/, "\\\"", raw_path); \
      if (system("'\''test'\'' '\''-r'\'' '\''" y "'\''") == 0) { \
        $$0 = line_head "\"" raw_path "\""; \
      } else { \
        $$0 = line_head "\"$$(srcdir)/" raw_path "\""; \
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

$(doxygen_dfv) doxygen.dummy-1.main: doxygen.force.main

$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_dep)
$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_dfv)
$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_src)
	$(GATBPS_V_DOXYGEN)$(GATBPS_RECIPE_MARKER_TOP)
	@'rm' \
  '-f' \
  '-r' \
  './'$(doxygen_dst) \
  './'$(doxygen_dst)'.tmp' \
;
	@$(MKDIR_P) './'$(@D)
	$(AM_V_at){ \
  ( \
    srcdir=$(srcdir) \
    $(DOXYGEN) \
      './'$(doxygen_src) \
    || 'exit' "$${?}"; \
    'mv' \
      './'$(doxygen_dst)'.tmp' \
      './'$(doxygen_dst) \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;); \
  exit_status="$${?}"; \
  'readonly' 'exit_status'; \
  case "$${exit_status}" in \
    '0') \
    ;; \
    *) \
      'rm' \
        '-f' \
        '-r' \
        './'$(doxygen_dst) \
        './'$(doxygen_dst)'.tmp' \
      ; \
    ;; \
  esac; \
  'exit' "$${exit_status}"; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

$(doxygen_src) doxygen.dummy-3.main: doxygen.force.main

.PHONY: clean-doxygen
.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-main
.PHONY: doxygen.force.main

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
