dnl
dnl This file was generated by GATBPS 0.1.0-5586+g5fe16b4e, which was
dnl released on 2021-04-10. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_CONFIG_LATER_SUBST.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20210410
AC_DEFUN([GATBPS_CONFIG_LATER_SUBST], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CONFIG_LATER_SUBST macro.
#]dnl
m4_ifdef(
  [GATBPS_CONFIG_LATER_SUBST_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_SUBST has already been called
  ])],
  [m4_define([GATBPS_CONFIG_LATER_SUBST_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_SUBST requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_SUBST([GATBPS_CONFIG_LATER_RULES])[
]AM_SUBST_NOTMAKE([GATBPS_CONFIG_LATER_RULES])[

]AC_SUBST([GATBPS_CONFIG_LATER_SCRIPT_MID])[

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
