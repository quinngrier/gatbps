changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_ARG_WITH_ENUM.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_ARG_WITH_ENUM.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_ARG_WITH_ENUM_foo1], [dnl
m4_if(
  m4_eval([$# >= 2]),
  [1],
  [[
  '$1')
  ;;]])[]dnl
m4_if(
  m4_eval([$# >= 4]),
  [1],
  [GATBPS_ARG_WITH_ENUM_foo1(m4_shift2($@))])[]dnl
])[]dnl
AC_DEFUN([GATBPS_ARG_WITH_ENUM_foo2], [dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [[
]AS_HELP_STRING([$1=$2], [$3])])[]dnl
m4_if(
  m4_eval([$# >= 5]),
  [1],
  [GATBPS_ARG_WITH_ENUM_foo2([$1], m4_shift3($@))])[]dnl
])[]dnl
AC_DEFUN([GATBPS_ARG_WITH_ENUM], [[{

]m4_pushdef(
  [gatbps_x],
  [with_]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))[]dnl
[

]GATBPS_ARG_WITH(
  [$3],
  [dnl
]AS_HELP_STRING([--with-$3 omitted], [same as --with-$3=$4])[
]AS_HELP_STRING([--with-$3], [same as --with-$3=yes])[
]AS_HELP_STRING([--without-$3], [same as --with-$3=no])[]dnl
GATBPS_ARG_WITH_ENUM_foo2([--with-$3], $5),
  [$4])[

case "$][{]gatbps_x[}" in]dnl
GATBPS_ARG_WITH_ENUM_foo1($5)[
  *)
    ]AC_MSG_ERROR([invalid --with-$3 value: $[]{]gatbps_x[}], [1])[
  ;;
esac

]GATBPS_CACHE_CHECK(
  [$1],
  [$2],
  [[{
    gatbps_cv_$2="$][{]gatbps_x[}"
  :;}]])[

case "$][{$2_was_cached}" in
  'yes')
    ]AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was ignored])[
  ;;
  'no')
    case "$][{]gatbps_x[_was_given}" in
      'yes')
        ]AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was given])[
      ;;
      'no')
        ]AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was implied])[
      ;;
    esac
  ;;
esac

case "$][{]gatbps_cv_$2[}" in]dnl
GATBPS_ARG_WITH_ENUM_foo1($5)[
  *)
    ]AC_MSG_ERROR([invalid gatbps_cv_$2 value: $[]{]gatbps_cv_$2[}], [1])[
  ;;
esac

]m4_popdef([gatbps_x])[

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
