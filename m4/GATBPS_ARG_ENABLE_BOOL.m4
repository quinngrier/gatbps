dnl
dnl This file was generated by GATBPS 0.0.0-3105-gb192b82, which was
dnl released on 2016-07-06. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_ARG_ENABLE_BOOL.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_ARG_ENABLE_BOOL], [{

m4_pushdef(
  [gatbps_enable_var],
  enable_[]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))

AC_ARG_ENABLE(
  [$3],
  [
AS_HELP_STRING([--enable-$3 omitted], [same as --enable-$3=$4])
AS_HELP_STRING([--enable-$3], [same as --enable-$3=yes])
AS_HELP_STRING([--disable-$3], [same as --enable-$3=no])
AS_HELP_STRING([--enable-$3=yes], [$5])
AS_HELP_STRING([--enable-$3=no], [$6])],
  [{ ':'
    ]gatbps_enable_var[_was_given='yes'
  }],
  [{ ':'
    ]gatbps_enable_var[_was_given='no'
    ]gatbps_enable_var[='$4'
  }])

case "$[]{gatbps_enable_var}" in
#(
  'yes')
    ':'
  ;;
#(
  'no')
    ':'
  ;;
#(
  *)
    AC_MSG_ERROR([invalid --enable-$3 value: $[]{]gatbps_enable_var[}], [1])
  ;;
esac

GATBPS_CHECK_VARS([$1], [$2], gatbps_enable_var)

case "$[]{$2_was_cached}" in
#(
  'yes')
    AC_MSG_NOTICE([note: --enable-$3=$[]{]gatbps_enable_var[} was ignored])
  ;;
#(
  'no')
    case "$[]{gatbps_enable_var[]_was_given}" in
    #(
      'yes')
        AC_MSG_NOTICE([note: --enable-$3=$[]{]gatbps_enable_var[} was given])
      ;;
    #(
      'no')
        AC_MSG_NOTICE([note: --enable-$3=$[]{]gatbps_enable_var[} was implied])
      ;;
    esac
  ;;
esac

m4_popdef([gatbps_enable_var])

:;}])dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
