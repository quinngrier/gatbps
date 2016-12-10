changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CHECK_CLASSPATH_SEPARATOR.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_CLASSPATH_SEPARATOR.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CHECK_CLASSPATH_SEPARATOR], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_CLASSPATH_SEPARATOR macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_CLASSPATH_SEPARATOR_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_CLASSPATH_SEPARATOR has already been called
  ])],
  [m4_define([GATBPS_CHECK_CLASSPATH_SEPARATOR_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CHECK_CLASSPATH_SEPARATOR requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_REQUIRE([GATBPS_PROG_JAVAC])[

]GATBPS_CACHE_CHECK(
  [the Java class path separator],
  [CLASSPATH_SEPARATOR],
  [[{

    gatbps_cv_CLASSPATH_SEPARATOR=''\'':'\'''

    'readonly' 'gatbps_cv_CLASSPATH_SEPARATOR'

  :;}]])[

case "$][{CLASSPATH_SEPARATOR+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{CLASSPATH_SEPARATOR} is already set
    ])[
  ;;
esac
CLASSPATH_SEPARATOR="$][{gatbps_cv_CLASSPATH_SEPARATOR}"
'readonly' 'CLASSPATH_SEPARATOR'

case "$][{CLASSPATH_SEPARATOR_LATER+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{CLASSPATH_SEPARATOR_LATER} is already set
    ])[
  ;;
esac
CLASSPATH_SEPARATOR_LATER="$][{CLASSPATH_SEPARATOR}"
'readonly' 'CLASSPATH_SEPARATOR_LATER'

]AC_SUBST([CLASSPATH_SEPARATOR])[
]AC_SUBST([CLASSPATH_SEPARATOR_LATER])[

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
