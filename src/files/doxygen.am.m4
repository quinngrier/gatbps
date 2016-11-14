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
        raw_line_tail = ""; \
        in_escape = 0; \
        for (i = 1; i != length(line_tail) - 1; ++i) { \
          c = substr(line_tail, i + 1, 1); \
          if (in_escape) { \
            if (c == "\"") { \
              raw_line_tail = raw_line_tail "\""; \
            } else if (c == "\\") { \
              raw_line_tail = raw_line_tail "\\"; \
            } else { \
              raw_line_tail = raw_line_tail "\\" c; \
            } \
            in_escape = 0; \
          } else if (c == "\\") { \
            in_escape = 1; \
          } else { \
            raw_line_tail = raw_line_tail c; \
          } \
        } \
        if (in_escape) { \
          raw_line_tail = raw_line_tail "\\"; \
        } \
        if (raw_line_tail ~ /^\$$\(SHELL\) /) { \
          is_shell_command = 1; \
          raw_path = raw_line_tail; \
          sub(/^\$$\(SHELL\) /, "", raw_path); \
        } else { \
          is_shell_command = 0; \
          raw_path = raw_line_tail; \
        } \
      } else { \
        is_shell_command = 0; \
        raw_path = line_tail; \
      } \
      shell_quoted_path = raw_path; \
      gsub(/'\''/, "'\''\\'\'''\''", shell_quoted_path); \
      test_command = "'\''test'\'' '\''-r'\'' "; \
      test_command = test_command "'\''" shell_quoted_path "'\''"; \
      if (system(test_command) == 0) { \
        path_prefix = ""; \
      } else { \
        path_prefix = "$$(srcdir)/"; \
      } \
      if (is_shell_command) { \
        doxygen_quoted_path = shell_quoted_path; \
      } else { \
        doxygen_quoted_path = raw_path; \
      } \
      gsub(/\\/, "\\\\", doxygen_quoted_path); \
      gsub(/"/, "\\\"", doxygen_quoted_path); \
      $$0 = line_head "\""; \
      if (is_shell_command) { \
        $$0 = $$0 "$$(SHELL) '\''-'\'' '\''"; \
      } \
      $$0 = $$0 path_prefix doxygen_quoted_path; \
      if (is_shell_command) { \
        $$0 = $$0 "'\''"; \
      } \
      $$0 = $$0 "\""; \
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

$(doxygen_dfv) doxygen.dummy-1.main: $(doxygen_dep)
$(doxygen_dfv) doxygen.dummy-1.main: doxygen.FORCE.main

$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_dep)
$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_dfv)
$(doxygen_dst) doxygen.dummy-2.main: $(doxygen_src)
	$(GATBPS_V_DOXYGEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at)'rm' \
  '-f' \
  '-r' \
  './'$(doxygen_dst) \
  './'$(doxygen_dst)'.tmp' \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  ( \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      $(SHELL) \
      >'doxygen-main.tmp' \
    || 'exit' "$${?}"; \
    SHELL_sh=` \
      'cat' 'doxygen-main.tmp' \
    ` || 'exit' "$${?}"; \
    'readonly' 'SHELL_sh'; \
    { \
      SHELL="$${SHELL_sh}" \
      srcdir=$(srcdir) \
      $(DOXYGEN) \
        './'$(doxygen_src) \
      ; \
    } || 'exit' "$${?}"; \
    'mv' \
      './'$(doxygen_dst)'.tmp' \
      './'$(doxygen_dst) \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;); \
  exit_status="$${?}"; \
  'readonly' 'exit_status'; \
  'rm' \
    '-f' \
    'doxygen-main.tmp' \
  ; \
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

$(doxygen_src) doxygen.dummy-3.main: $(doxygen_dep)
$(doxygen_src) doxygen.dummy-3.main: doxygen.FORCE.main

.PHONY: clean-doxygen
.PHONY: clean-doxygen-main
.PHONY: doxygen
.PHONY: doxygen-main
.PHONY: doxygen.FORCE.main

.am_df_INPUT.df:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
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
	$(AM_V_at)$(MKDIR_P) \
  './'$(@D) \
;
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
clean-doxygen: doxygen.FORCE.main

clean-doxygen-main: doxygen.FORCE.main
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
doxygen: doxygen.FORCE.main

doxygen-main: $(doxygen_dst)
doxygen-main: doxygen.FORCE.main

doxygen.FORCE.main:

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
