changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DEFINE_javadocdir.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DEFINE_javadocdir.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_DEFINE_javadocdir], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_javadocdir macro.
#]dnl
m4_ifdef(
  [GATBPS_DEFINE_javadocdir_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_DEFINE_javadocdir has already been called
  ])],
  [m4_define([GATBPS_DEFINE_javadocdir_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# < 0 || $# > 0]),
  [1],
  [gatbps_fatal([
    GATBPS_DEFINE_javadocdir requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

case "$][{javadocdir+x}" in
  ?*)
    case "$][{javadocdir}" in
      *'/')
        ]GATBPS_MSG_ERROR([
          invalid \$][{javadocdir} value:
        [--VERBATIM--] "$][{javadocdir}"], [
          \$][{javadocdir} must not end with "/"
        ])[
      ;;
      '/'*)
      ;;
      '${'*)
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{javadocdir} value:
        [--VERBATIM--] "$][{javadocdir}"], [
          \$][{javadocdir} must begin with "/" or "\${"
        ])[
      ;;
    esac
  ;;
  *)
    javadocdir='$][{docdir}'
  ;;
esac
'readonly' 'javadocdir'

]AC_ARG_VAR(
  [javadocdir],
  [
    the directory to which to install Javadoc documentation files
    (default: javadocdir='$][{docdir}')
  ])[

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