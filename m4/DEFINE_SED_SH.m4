AC_DEFUN([DEFINE_SED_SH], [[{

#
# The block that contains this comment is the expansion of the
# DEFINE_SED_SH macro.
#]dnl
m4_ifdef(
  [DEFINE_SED_SH_HAS_BEEN_CALLED],
  [m4_fatal([DEFINE_SED_SH has already been called])],
  [m4_define([DEFINE_SED_SH_HAS_BEEN_CALLED])])dnl
m4_case(
  [$#],
  [0], [],
  [m4_fatal([DEFINE_SED_SH requires exactly 0 arguments])])dnl

AC_REQUIRE([DEFINE_SED])

SED_SH=`'sh' \
  '-' \
  "${srcdir}"'/build-aux/sh-form.sh' \
  '--' \
  ${SED} \
;`
case "${?}" in
#(
  '0')
    ':'
  ;;
#(
  *)
    AC_MSG_ERROR([sh-form.sh failed], [1])
  ;;
esac

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
