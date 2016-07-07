changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_ARG_WITH_BOOL.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_ARG_WITH_BOOL], [{

m4_pushdef(
  [gatbps_x],
  with_[]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))

AC_ARG_WITH(
  [$3],
  [
AS_HELP_STRING([--with-$3 omitted], [same as --with-$3=$4])
AS_HELP_STRING([--with-$3], [same as --with-$3=yes])
AS_HELP_STRING([--without-$3], [same as --with-$3=no])
AS_HELP_STRING([--with-$3=yes], [$5])
AS_HELP_STRING([--with-$3=no], [$6])],
  [{ ':'
    ]gatbps_x[_was_given='yes'
  }],
  [{ ':'
    ]gatbps_x[_was_given='no'
    ]gatbps_x[='$4'
  }])

case "$[]{gatbps_x}" in
#(
  'yes'|'no')
    ':'
  ;;
#(
  *)
    AC_MSG_ERROR([invalid --with-$3 value: $[]{]gatbps_x[}], [1])
  ;;
esac

GATBPS_CHECK_VARS([$1], [$2], gatbps_x)

case "$[]{$2_was_cached}" in
#(
  'yes')
    AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was ignored])
  ;;
#(
  'no')
    case "$[]{gatbps_x[]_was_given}" in
    #(
      'yes')
        AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was given])
      ;;
    #(
      'no')
        AC_MSG_NOTICE([note: --with-$3=$[]{]gatbps_x[} was implied])
      ;;
    esac
  ;;
esac

m4_popdef([gatbps_x])

:;}])dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
