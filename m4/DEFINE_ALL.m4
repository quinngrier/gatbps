AC_DEFUN([DEFINE_ALL], [{

#
# The block that contains this comment is the expansion of the
# DEFINE_ALL macro.
#
m4_ifdef(
  [DEFINE_ALL_HAS_BEEN_CALLED],
  [m4_fatal([DEFINE_ALL must be called at most once])],
  [m4_define([DEFINE_ALL_HAS_BEEN_CALLED])])dnl
m4_case(
  [$#],
  [0], [],
  [m4_fatal([DEFINE_ALL requires exactly 0 arguments])])dnl

AC_REQUIRE([DEFINE_HAVE_SHEBANG])
AC_REQUIRE([DEFINE_enable_SHEBANG])

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
