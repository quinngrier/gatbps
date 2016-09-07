changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_TAR_SUBST.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_TAR_SUBST.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_TAR_SUBST], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_TAR_SUBST macro.
#]dnl
m4_ifdef(
  [GATBPS_TAR_SUBST_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_TAR_SUBST has already been called
  ])],
  [m4_define([GATBPS_TAR_SUBST_HAS_BEEN_CALLED])])[]dnl
m4_case(
  [$#],
  [0], [],
  [gatbps_fatal([
    GATBPS_TAR_SUBST requires exactly 0 arguments
  ])])[]dnl
[

]AC_SUBST([GATBPS_TAR_RULES])[
]AM_SUBST_NOTMAKE([GATBPS_TAR_RULES])[

:;}]])[]dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl