changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_GIT_CLONE.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_GIT_CLONE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_GIT_CLONE], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_GIT_CLONE macro for]dnl
m4_if(
  m4_eval(m4_len([ $1.])[ > 44]),
  [1],
  [[
#]])[ $1.
#]dnl
m4_if(
  m4_eval([$# < 2 || $# > 3]),
  [1],
  [gatbps_fatal([
    GATBPS_GIT_CLONE requires 2 to 3 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument to GATBPS_GIT_CLONE:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_GIT_CLONE requires its second argument to contain at least
    one character that is not a space, tab, or newline character
  ])])[]dnl
m4_case(
  [$3],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid third argument to GATBPS_GIT_CLONE:
  [--VERBATIM--] "$3"], [
    the third argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [output_directory],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$3],
    [],
    [[[clean]]],
    [[[$3]]]))[]dnl
[

GATBPS_GIT_CLONE_RULES="$][{GATBPS_GIT_CLONE_RULES}"'

]output_directory[:
	$][(AM@&t@_V_at)|%}contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$][(GATBPS_V_GIT_CLONE)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_directory['\''.tmp'\'' \
;
	$][(AM@&t@_V_at)$][(GIT) \
  '\''clone'\'' \
  '\''--'\'' \
  ]source_sh[ \
  ]output_directory['\''.tmp'\'' \
;
	$][(AM@&t@_V_at)'\''mv'\'' \
  '\''./'\'']output_directory['\''.tmp'\'' \
  '\''./'\'']output_directory[ \
;
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]output_directory[

clean-]output_directory[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_directory[ \
;

]clean_target[-local: clean-]output_directory[

'
]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([output_directory])[]dnl
[
:;}]])[]dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
