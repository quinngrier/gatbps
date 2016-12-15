changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CHECK_EXEEXT.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/check_macros_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_EXEEXT.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CHECK_EXEEXT_check_macros], [dnl|%}dnl
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
[GATBPS_CHECK_EXEEXT_check_macros[]dnl
]))[]dnl
AC_DEFUN([GATBPS_CHECK_EXEEXT], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_EXEEXT macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_EXEEXT_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_EXEEXT has already been called
  ])],
  [m4_define([GATBPS_CHECK_EXEEXT_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CHECK_EXEEXT requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_REQUIRE([AC_PROG_CC])[

]AC_DEFINE_UNQUOTED(
  [[CEXEEXT]],
  [["${EXEEXT}"]],
  [
    Define to a character string literal that contains the suffix that
    the C compiler adds to executable files. For example, on Unix-like
    systems this should usually be "", and on Windows systems this
    should usually be ".exe".
  ])[

case "$][{EXEEXT_LATER+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{EXEEXT_LATER} is already set
    ])[
  ;;
esac
EXEEXT_LATER=`
  'sed' '
    s/@/{@}AT{@}/g
  ' <<EOF2
$][{EXEEXT}
EOF2
`
case "$][{?}" in
  '0')
  ;;
  *)
    ]GATBPS_MSG_ERROR([
      sed failed
    ])[
  ;;
esac
'readonly' 'EXEEXT_LATER'

]AC_SUBST([EXEEXT_LATER])[

]AM_SUBST_NOTMAKE([EXEEXT_LATER])[

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
