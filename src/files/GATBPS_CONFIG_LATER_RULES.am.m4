changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CONFIG_LATER_RULES.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/rule_substitution_comment_plural.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: GATBPS_CONFIG_LATER_RULES.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_CONFIG_LATER_SCRIPT_BOT = ' \
      } else { \
        line = line "{@}" line_parts[i + 1]; \
        replaced_previous_line_part = 0; \
      } \
    } \
    print line; \
  } \
'

GATBPS_CONFIG_LATER_SCRIPT_TOP = ' \
  { \
    line = $$0; \
    line_parts_count = split(line, line_parts, /\{@\}/); \
    for (i = 0; i != line_parts_count; ++i) { \
      if (i == 0) { \
        line = line_parts[i + 1]; \
        replaced_previous_line_part = 0; \
      } else if (replaced_previous_line_part) { \
        line = line line_parts[i + 1]; \
        replaced_previous_line_part = 0; \
      } else if (i == line_parts_count - 1) { \
        line = line "{@}" line_parts[i + 1]; \
        replaced_previous_line_part = 0; \
'

GATBPS_CONFIG_LATER_SCRIPT = $(GATBPS_CONFIG_LATER_SCRIPT_TOP)$(GATBPS_CONFIG_LATER_SCRIPT_MID)$(GATBPS_CONFIG_LATER_SCRIPT_BOT)

GATBPS_V_CONFIG_LATER = $(GATBPS_V_CONFIG_LATER_@AM_V@)

GATBPS_V_CONFIG_LATER_ = $(GATBPS_V_CONFIG_LATER_@AM_DEFAULT_V@)

GATBPS_V_CONFIG_LATER_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'SUBST_IM'$(GATBPS_V_PAD_RIGHT_8) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_CONFIG_LATER_1 =

## end_variables

@GATBPS_CONFIG_LATER_RULES@

|%}rule_substitution_comment_plural{%|

clean-local:
distclean-local:
maintainer-clean-local:
mostlyclean-local:

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
