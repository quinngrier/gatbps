changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_GIT_CLONE.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_GIT_CLONE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_GIT_CLONE], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_GIT_CLONE macro.
#]dnl
m4_case(
  [$#],
  [2], [],
  [3], [],
  [gatbps_fatal([
    GATBPS_GIT_CLONE requires exactly 2 or 3 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_GIT_CLONE requires its first argument to contain at least one
    character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_GIT_CLONE requires its second argument to contain at least
    one character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_GIT_CLONE requires its third argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
[

GATBPS_GIT_CLONE_RULES="$][{GATBPS_GIT_CLONE_RULES}"'

]target_sh[:
	$][(AM@&t@_V_at)|%}dnl
contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%|
	$][(GATBPS_V_GIT_CLONE): make: $][@
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']target_sh['\''.tmp'\'' \
;
	$][(AM@&t@_V_at)$][(GIT) \
  '\''clone'\'' \
  '\''--'\'' \
  ]source_sh[ \
  ]target_sh['\''.tmp'\'' \
;
	$][(AM@&t@_V_at)'\''mv'\'' \
  '\''./'\'']target_sh['\''.tmp'\'' \
  '\''./'\'']target_sh[ \
;
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]target_sh[

clean-]target_sh[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']target_sh[ \
;

]m4_if([$3], [], [[clean]], [[$3]])[-local: clean-]target_sh[

'
]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([target_sh])[]dnl
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