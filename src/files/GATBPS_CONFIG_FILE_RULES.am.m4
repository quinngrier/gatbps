changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CONFIG_FILE_RULES.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/rule_substitution_comment_plural.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: GATBPS_CONFIG_FILE_RULES.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_CONFIG_FILE = $(GATBPS_V_CONFIG_FILE_@AM_V@)

GATBPS_V_CONFIG_FILE_ = $(GATBPS_V_CONFIG_FILE_@AM_DEFAULT_V@)

GATBPS_V_CONFIG_FILE_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/gatbps-echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'SUBST_IN'$(GATBPS_V_PAD_RIGHT_8) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_CONFIG_FILE_1 =

## end_variables

@GATBPS_CONFIG_FILE_RULES@

|%}rule_substitution_comment_plural{%|

distclean-local:
maintainer-clean-local:

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
