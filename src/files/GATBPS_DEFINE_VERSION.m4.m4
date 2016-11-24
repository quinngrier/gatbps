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
    [[[# gatbps_check_macros]]],
    [m4_defn([gatbps_check_macros])])[]dnl
[[]GATBPS_DEFINE_VERSION_check_macros]dnl
))[]dnl
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
    an M4 macro name, that is, it must match the following regular
    expression: ^[A-Z_a-z][0-9A-Z_a-z]*$
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
  [$1$2_LIBTOOL_R],
  [gatbps_fatal([
    $1$2_LIBTOOL_R is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_LIBTOOL_A],
  [gatbps_fatal([
    $1$2_LIBTOOL_A is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_RPM_V],
  [gatbps_fatal([
    $1$2_RPM_V is already defined
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
  [$1$2_LIBTOOL_R],
  m4_dquote($1$2_PATCH))[]dnl
m4_define(
  [$1$2_LIBTOOL_A],
  m4_dquote($1$2_MINOR))[]dnl
m4_define(
  [$1$2_RPM_V],
  m4_dquote($1$2_MAJOR[.]$1$2_MINOR[.]$1$2_PATCH))[]dnl
[

]AC_DEFINE(
  [[$2_RPM_V]],
  m4_dquote(["]$1$2_RPM_V["]),
  [
    Define to a character string literal that contains the RPM version
    number of $2. This is the initial X.Y.Z portion of $2. For example,
    if $2 were "1.2.3" or "1.2.3-foo", then $2_RPM should be "1.2.3".
  ])[

case "$][{$2_RPM_V+x}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{$2_RPM_V} is already set
    ])[
  ;;
esac

$2_RPM_V=']$1$2_RPM_V['

'readonly' '$2_RPM_V'

]AC_SUBST([$2_RPM_V])[

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
