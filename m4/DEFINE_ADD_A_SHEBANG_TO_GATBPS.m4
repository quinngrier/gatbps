AC_DEFUN([DEFINE_ADD_A_SHEBANG_TO_GATBPS], [{

#
# This block is the expansion of the DEFINE_ADD_A_SHEBANG_TO_GATBPS
# macro.
#
m4_ifdef(
  [DEFINE_ADD_A_SHEBANG_TO_GATBPS_HAS_BEEN_CALLED],
  [m4_fatal([DEFINE_ADD_A_SHEBANG_TO_GATBPS must be called at most once])],
  [m4_define([DEFINE_ADD_A_SHEBANG_TO_GATBPS_HAS_BEEN_CALLED])])dnl
m4_case(
  [$#],
  [0], [],
  [m4_fatal([DEFINE_ADD_A_SHEBANG_TO_GATBPS requires exactly 0 arguments])])dnl

GATBPS_ARG_ENABLE_BOOL(
  [permission to add a shebang to gatbps],
  [ADD_A_SHEBANG_TO_GATBPS],
  [shebang],
  [yes],
  [add a shebang to gatbps],
  [do not add a shebang to gatbps])

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
