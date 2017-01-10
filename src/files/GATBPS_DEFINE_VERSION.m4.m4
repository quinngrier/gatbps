changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DEFINE_VERSION.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/check_macros_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DEFINE_VERSION.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_DEFINE_VERSION_check_macros], [dnl|%}dnl
check_macros_code(
  {%|GATBPS_MSG_ERROR|%},
  {%|gatbps_fatal|%},
  {%||%}){%||%}dnl
{%|]m4_define(
  [gatbps_check_macros],
  m4_ifndef(
    [gatbps_check_macros],
    [[[# gatbps_check_macros]dnl
]],
    [m4_defn([gatbps_check_macros])])dnl
[GATBPS_DEFINE_VERSION_check_macros[]dnl
]))[]dnl
AC_DEFUN([GATBPS_DEFINE_VERSION], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_VERSION macro for]dnl
m4_if(
  m4_eval(m4_len([ ($1)$2.])[ > 39]),
  [1],
  [[
#]])[ ($1)$2.
#]dnl
GATBPS_DEFINE_VERSION_check_macros[]dnl
m4_if(
  m4_eval([$# < 2 || $# > 3]),
  [1],
  [gatbps_fatal([
    GATBPS_DEFINE_VERSION requires 2 to 3 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [gatbps_fatal([
    invalid first argument to GATBPS_DEFINE_VERSION:
  [--VERBATIM--] "$1"], [
    the first argument must be an M4 macro name, that is, it must match
    the following regular expression: ^[A-Z_a-z][0-9A-Z_a-z]*$
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [gatbps_fatal([
    invalid second argument to GATBPS_DEFINE_VERSION:
  [--VERBATIM--] "$2"], [
    the second argument must be simultaneously a shell variable name and
    a trailing substring of an M4 macro name, that is, it must match the
    following regular expression: ^[A-Z_a-z][0-9A-Z_a-z]*$
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_ifdef(
    [$1$2],
    [gatbps_fatal([
      $1$2 is already defined
    ])])],
  [m4_ifndef(
    [$1$2],
    [gatbps_fatal([
      $1$2 is not defined
    ])])])[]dnl
m4_ifdef(
  [$1$2_MAJOR],
  [gatbps_fatal([
    $1$2_MAJOR is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_MINOR],
  [gatbps_fatal([
    $1$2_MINOR is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_PATCH],
  [gatbps_fatal([
    $1$2_PATCH is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_DOCKER],
  [gatbps_fatal([
    $1$2_DOCKER is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_DOCKER_TEXI],
  [gatbps_fatal([
    $1$2_DOCKER_TEXI is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_GIT],
  [gatbps_fatal([
    $1$2_GIT is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_GIT_TEXI],
  [gatbps_fatal([
    $1$2_GIT_TEXI is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_LIBTOOL_A],
  [gatbps_fatal([
    $1$2_LIBTOOL_A is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_LIBTOOL_R],
  [gatbps_fatal([
    $1$2_LIBTOOL_R is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_RPM_R],
  [gatbps_fatal([
    $1$2_RPM_R is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_RPM_V],
  [gatbps_fatal([
    $1$2_RPM_V is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_RPM_VR],
  [gatbps_fatal([
    $1$2_RPM_VR is already defined
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_define(
    [$1$2],
    [[$3]])])[]dnl
m4_define(
  [$1$2_MAJOR],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_MINOR],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_PATCH],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+[^0-9]+[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+[^0-9]+0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_DOCKER],
  m4_dquote(m4_bpatsubst(m4_dquote($1$2), [\+.*\(.\)], [\1])))[]dnl
m4_define(
  [$1$2_DOCKER_TEXI],
  m4_dquote(m4_bpatsubst(m4_dquote($1$2_DOCKER), [\.], [.@:])))[]dnl
m4_define(
  [$1$2_GIT],
  m4_dquote(
    m4_if(
      m4_bregexp($1$2, [-]),
      [-1],
      [[v]$1$2],
      [[u]m4_bpatsubst(m4_dquote($1$2), [\+], [-])])))[]dnl
m4_define(
  [$1$2_GIT_TEXI],
  m4_dquote(m4_bpatsubst(m4_dquote($1$2_GIT), [\.], [.@:])))[]dnl
m4_define(
  [$1$2_LIBTOOL_A],
  m4_dquote($1$2_MINOR))[]dnl
m4_define(
  [$1$2_LIBTOOL_R],
  m4_dquote($1$2_PATCH))[]dnl
m4_define(
  [$1$2_RPM_R],
  m4_dquote(
    m4_if(
      m4_bregexp($1$2, [-]),
      [-1],
      [[1]],
      [m4_bpatsubsts(
        m4_dquote($1$2),
        [[0-9].*-],
        [0.],
        [\+],
        [.])])))[]dnl
m4_define(
  [$1$2_RPM_V],
  m4_dquote($1$2_MAJOR[.]$1$2_MINOR[.]$1$2_PATCH))[]dnl
m4_define(
  [$1$2_RPM_VR],
  m4_dquote($1$2_RPM_V[-]$1$2_RPM_R))[]dnl
[

]AC_DEFINE(
  [[$2_DOCKER]],
  m4_dquote(["]$1$2_DOCKER["]),
  [
    Define to a character string literal that contains the Docker
    version number of $2. If $2 does not contain a "-" character, then
    this should be $2. Otherwise, this should be the text up to but not
    including the "+" character. For example, if $2 were "0.1.0", then
    this should be "0.1.0", and if $2 were "0.1.0-4927+g88a52bb", then
    this should be "0.1.0-4927".
  ])[

]AC_DEFINE(
  [[$2_DOCKER_TEXI]],
  m4_dquote(["]$1$2_DOCKER_TEXI["]),
  [
    Define to the same character string literal as $2_DOCKER but with
    each "." character replaced with the string ".@:".
  ])[

]AC_DEFINE(
  [[$2_GIT]],
  m4_dquote(["]$1$2_GIT["]),
  [
  ])[

]AC_DEFINE(
  [[$2_GIT_TEXI]],
  m4_dquote(["]$1$2_GIT_TEXI["]),
  [
    Define to the same character string literal as $2_GIT but with each
    "." character replaced with the string ".@:".
  ])[

]AC_DEFINE(
  [[$2_RPM_R]],
  m4_dquote(["]$1$2_RPM_R["]),
  [
    Define to a character string literal that contains the RPM release
    number of $2. If $2 does not contain a "-" character, then this
    should be "1". Otherwise, this should be "0." followed by the text
    after the "-" character, and the "+" character should be changed to
    a "." character. For example, if $2 were "0.1.0", then this should
    be "1", and if $2 were "0.1.0-4927+g88a52bb", then this should be
    "0.4927.g88a52bb".
  ])[

]AC_DEFINE(
  [[$2_RPM_V]],
  m4_dquote(["]$1$2_RPM_V["]),
  [
    Define to a character string literal that contains the RPM version
    number of $2. If $2 does not contain a "-" character, then this
    should be the same as $2. Otherwise, this should be the text up to
    but not including the "-" character. For example, if $2 were "0.1.0"
    or "0.1.0-4927+g88a52bb", then this should be "0.1.0".
  ])[

]AC_DEFINE(
  [[$2_RPM_VR]],
  m4_dquote(["]$1$2_RPM_VR["]),
  [
    Define to a character string literal that contains $2_RPM_V followed
    by a "-" character followed by $2_RPM_R. For example, if $2_RPM_V
    were "0.1.0" and $2_RPM_R were "0.4927.g88a52bb", then this should
    be "0.1.0-0.4927.g88a52bb".
  ])[

case "$][{$2_DOCKER+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_DOCKER} is already set
    ])[
  ;;
esac

case "$][{$2_DOCKER_TEXI+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_DOCKER_TEXI} is already set
    ])[
  ;;
esac

case "$][{$2_GIT+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_GIT} is already set
    ])[
  ;;
esac

case "$][{$2_GIT_TEXI+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_GIT_TEXI} is already set
    ])[
  ;;
esac

case "$][{$2_RPM_R+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_RPM_R} is already set
    ])[
  ;;
esac

case "$][{$2_RPM_V+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_RPM_V} is already set
    ])[
  ;;
esac

case "$][{$2_RPM_VR+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_RPM_VR} is already set
    ])[
  ;;
esac

$2_DOCKER=']$1$2_DOCKER['
$2_DOCKER_TEXI=']$1$2_DOCKER_TEXI['
$2_GIT=']$1$2_GIT['
$2_GIT_TEXI=']$1$2_GIT_TEXI['
$2_RPM_R=']$1$2_RPM_R['
$2_RPM_V=']$1$2_RPM_V['
$2_RPM_VR=']$1$2_RPM_VR['

'readonly' '$2_DOCKER'
'readonly' '$2_DOCKER_TEXI'
'readonly' '$2_GIT'
'readonly' '$2_GIT_TEXI'
'readonly' '$2_RPM_R'
'readonly' '$2_RPM_V'
'readonly' '$2_RPM_VR'

]AC_SUBST([$2_DOCKER])[
]AC_SUBST([$2_DOCKER_TEXI])[
]AC_SUBST([$2_GIT])[
]AC_SUBST([$2_GIT_TEXI])[
]AC_SUBST([$2_RPM_R])[
]AC_SUBST([$2_RPM_V])[
]AC_SUBST([$2_RPM_VR])[

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
