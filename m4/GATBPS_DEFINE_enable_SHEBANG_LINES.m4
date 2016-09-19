dnl
dnl This file was generated by GATBPS 0.0.0-4168-g68ff3cb, which was
dnl released on 2016-09-19. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_DEFINE_enable_SHEBANG_LINES.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_DEFINE_enable_SHEBANG_LINES], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_enable_SHEBANG_LINES macro.
#]dnl
m4_ifdef(
  [GATBPS_DEFINE_enable_SHEBANG_LINES_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_DEFINE_enable_SHEBANG_LINES has already been called
  ])],
  [m4_define([GATBPS_DEFINE_enable_SHEBANG_LINES_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# < 0 || $# > 0]),
  [1],
  [gatbps_fatal([
    GATBPS_DEFINE_enable_SHEBANG_LINES requires exactly 0 arguments
  ])])[]dnl
[

]GATBPS_ARG_ENABLE_BOOL(
  [
    permission to enable shebang lines in executable scripts
  ],
  [enable_SHEBANG_LINES],
  [shebang-lines],
  [yes],
  [
    enable shebang lines in executable scripts if $][{cross_compiling}
    is not "no" or if shebang lines are supported on the build machine
  ],
  [
    disable shebang lines in executable scripts
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
