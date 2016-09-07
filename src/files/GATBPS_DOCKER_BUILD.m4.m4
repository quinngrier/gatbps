changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DOCKER_BUILD.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DOCKER_BUILD.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_DOCKER_BUILD], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_DOCKER_BUILD macro.
#]dnl
m4_case(
  [$#],
  [4], [],
  [5], [],
  [6], [],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD requires exactly 4, 5, or 6 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD requires its first argument to contain at least
    one character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_bregexp([$3], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD requires its second argument to contain at least
    one character that is not a space, tab, or newline
  ])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$3]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [prereq_sh],
  m4_bpatsubst([[[$6]]], ['], ['\\'']))[]dnl
[

GATBPS_DOCKER_BUILD_RULES="$][{GATBPS_DOCKER_BUILD_RULES}"'

]target_sh[: ]m4_if([$6], [], [source_sh], [prereq_sh])[
	$][(GATBPS_V_DOCKER_BUILD): make: $][@]dnl
m4_if([$6], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]source_sh[ \
;]])[
	$][(AM@&t@_V_at){ \
  ( \
    '\''cd'\'' \
      '\''./'\'']$2[ \
    || '\''exit'\'' "$][$][{?}"; \
    $][(DOCKER) \
      '\''build'\'' \
      '\''--tag'\'' \
      ]$4[ \
      '\''.'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;) || '\''exit'\'' "$][$][{?}"; \
  '\''exit'\'' '\''0'\''; \
:;}
	$][(AM@&t@_V_at): done: $][@

'
]dnl
m4_popdef([prereq_sh])[]dnl
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
