dnl
dnl This file was generated by GATBPS 0.2.0-alpha.91+ga52a09f, which was
dnl released on 2024-03-10. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_PROG_TEXI2ANY.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20240310
AC_DEFUN([GATBPS_PROG_TEXI2ANY_check_macros], [dnl
m4_ifndef(
  [gatbps_fatal],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[gatbps_fatal ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[did you forget ]dnl
[gatbps_fatal.m4?]dnl
)[]dnl
])[]dnl
m4_ifndef(
  [gatbps_fatal_check_macros],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[gatbps_fatal_check_macros ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[this means that there is a bug in GATBPS]dnl
)[]dnl
])[]dnl
gatbps_fatal_check_macros[]dnl
]m4_define(
  [gatbps_check_macros],
  m4_ifndef(
    [gatbps_check_macros],
    [[[# gatbps_check_macros]dnl
]],
    [m4_defn([gatbps_check_macros])])dnl
[GATBPS_PROG_TEXI2ANY_check_macros[]dnl
]))[]dnl
AC_DEFUN([GATBPS_PROG_TEXI2ANY], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_PROG_TEXI2ANY macro.
#]dnl
m4_ifdef(
  [GATBPS_PROG_TEXI2ANY_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_PROG_TEXI2ANY has already been called
  ])],
  [m4_define([GATBPS_PROG_TEXI2ANY_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_PROG_TEXI2ANY requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_CHECK_PROGS(
  [TEXI2ANY],
  [texi2any makeinfo])[

]AC_ARG_VAR(
  [TEXI2ANY],
  [
    the command to use to run texi2any
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
