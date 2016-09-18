changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_M4.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_M4.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_M4], [[{

#
# The block that contains this comment is an expansion of the GATBPS_M4
# macro.
#]dnl
m4_if(
  m4_eval([$# < 1 || $# > 2]),
  [1],
  [gatbps_fatal([
    GATBPS_M4 requires 1 to 2 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_M4 requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_eval([$# >= 2]),
  [1],
  [m4_case(
    [$2],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_M4 requires its second argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
[

]AC_REQUIRE([GATBPS_CHECK_SOFT_INCLUDE])[

]GATBPS_CP([$1], [$1.m4out])[

GATBPS_M4_RULES="$][{GATBPS_M4_RULES}"'

]target_sh[.m4out: ]target_sh[.m4out.d

]target_sh[.m4out.d:

.PHONY: clean-]target_sh[.m4out

clean-]target_sh[.m4out:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']target_sh['\''.m4out'\'' \
  '\''./'\'']target_sh['\''.m4out.d'\'' \
;

]m4_if([$2], [], [[mostlyclean]], [[$2]])[-local: clean-]target_sh[.m4out

'"$][{SOFT_INCLUDE}"' ]target_sh[.m4out.d

'
]dnl
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
