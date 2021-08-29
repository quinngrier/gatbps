changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_ARG_ENABLE_BOOL.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_ARG_ENABLE_BOOL.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_ARG_ENABLE_BOOL], [[{

]m4_pushdef(
  [gatbps_x],
  [enable_]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))[]dnl
[

]GATBPS_ARG_ENABLE(
  [$3],
  [
]AS_HELP_STRING(
  [--enable-$3 omitted],
  [same as --enable-$3=$4])[
]AS_HELP_STRING(
  [--enable-$3],
  [same as --enable-$3=yes])[
]AS_HELP_STRING(
  [--disable-$3],
  [same as --enable-$3=no])[
]AS_HELP_STRING(
  [--enable-$3=yes],
  [$5])[
]AS_HELP_STRING(
  [--enable-$3=no],
  [$6]),
  [$4])

case "$[]{gatbps_x}" in
  'yes')
  ;;
  'no')
  ;;
  *)
    AC_MSG_ERROR([invalid --enable-$3 value: $[]{]gatbps_x[}], [1])
  ;;
esac

GATBPS_CHECK_EXPR([$1], [$2], gatbps_x)

[

case $$2_was_cached in
  yes)
    printf 'note: --enable-$3=%s was given but overridden by the cache\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
  ;;
  no)
    case $]gatbps_x[_was_given in
      yes)
        printf 'note: --enable-$3=%s was given\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
      ;;
      no)
        printf 'note: --enable-$3=%s was implied\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
      ;;
    esac
  ;;
esac

]

m4_popdef([gatbps_x])

:;}])[]dnl
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
