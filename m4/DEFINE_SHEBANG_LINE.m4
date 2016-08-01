AC_DEFUN([DEFINE_SHEBANG_LINE], [[{

#
# The block that contains this comment is the expansion of the
# DEFINE_SHEBANG_LINE macro.
#]dnl
m4_ifdef(
  [DEFINE_SHEBANG_LINE_HAS_BEEN_CALLED],
  [gatbps_fatal([
    DEFINE_SHEBANG_LINE has already been called
  ])],
  [m4_define([DEFINE_SHEBANG_LINE_HAS_BEEN_CALLED])])[]dnl
m4_case(
  [$#],
  [0], [],
  [m4_fatal([DEFINE_SHEBANG_LINE requires exactly 0 arguments])])[]dnl

AC_REQUIRE([DEFINE_HAVE_SHEBANG_SUPPORT])
AC_REQUIRE([DEFINE_enable_SHEBANG_LINE])

SHEBANG_LINE_1='#!/bin/sh -

'
SHEBANG_LINE_0=''
case "${cross_compiling}" in
  'yes')
    case "${enable_SHEBANG_LINE}" in
      '1')
        SHEBANG_LINE="${SHEBANG_LINE_1}"
      ;;
      '0')
        SHEBANG_LINE="${SHEBANG_LINE_0}"
      ;;
      *)
        AC_MSG_ERROR(
          [invalid \${enable_SHEBANG_LINE} value: ${enable_SHEBANG_LINE}]
          [1])
      ;;
    esac
  ;;
  'no')
    case "${enable_SHEBANG_LINE}" in
      '1')
        case "${HAVE_SHEBANG_SUPPORT}" in
          '1')
            SHEBANG_LINE="${SHEBANG_LINE_1}"
          ;;
          '0')
            SHEBANG_LINE="${SHEBANG_LINE_0}"
          ;;
          *)
            AC_MSG_ERROR(
              [invalid \${HAVE_SHEBANG_SUPPORT} value: ${HAVE_SHEBANG_SUPPORT}]
              [1])
          ;;
        esac
      ;;
      '0')
        SHEBANG_LINE="${SHEBANG_LINE_0}"
      ;;
      *)
        AC_MSG_ERROR(
          [invalid \${enable_SHEBANG_LINE} value: ${enable_SHEBANG_LINE}]
          [1])
      ;;
    esac
  ;;
  *)
    AC_MSG_ERROR(
      [invalid \${cross_compiling} value: ${cross_compiling}]
      [1])
  ;;
esac
AC_SUBST([SHEBANG_LINE])
AM_SUBST_NOTMAKE([SHEBANG_LINE])

:;}])[]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
