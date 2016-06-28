changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_PROG_JAVADOC.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_PROG_JAVADOC], [{

#
# This block is the expansion of the GATBPS_PROG_JAVADOC macro.
#

m4_ifdef(
  [GATBPS_PROG_JAVADOC_HAS_BEEN_CALLED],
  [m4_fatal([GATBPS_PROG_JAVADOC must be called at most once])],
  [m4_define([GATBPS_PROG_JAVADOC_HAS_BEEN_CALLED])])

m4_case(
  [$#],
  [0], [],
  [m4_fatal([GATBPS_PROG_JAVADOC requires exactly 0 arguments])])

AC_CHECK_PROGS([JAVADOC], [javadoc])

AC_ARG_VAR(
  [JAVADOC],
  [Javadoc generator command (always evaluated)])

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
