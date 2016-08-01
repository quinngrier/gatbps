AC_DEFUN([DEFINE_enable_SHEBANG_LINE], [[{

#
# The block that contains this comment is the expansion of the
# DEFINE_enable_SHEBANG_LINE macro.
#]dnl
m4_ifdef(
  [DEFINE_enable_SHEBANG_LINE_HAS_BEEN_CALLED],
  [gatbps_fatal([
    DEFINE_enable_SHEBANG_LINE has already been called
  ])],
  [m4_define([DEFINE_enable_SHEBANG_LINE_HAS_BEEN_CALLED])])[]dnl
m4_case(
  [$#],
  [0], [],
  [m4_fatal([DEFINE_enable_SHEBANG_LINE requires exactly 0 arguments])])[]dnl
[

]GATBPS_ARG_ENABLE_BOOL(
  [permission to add a shebang line to gatbps],
  [enable_SHEBANG_LINE],
  [shebang-line],
  [yes],
  [
    add a shebang line to gatbps
  ],
  [
    do not add a shebang line to gatbps
  ])[

:;}]])[]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
