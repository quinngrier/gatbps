changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_MSG_WARN.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_MSG_WARN.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_MSG_WARN], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_MSG_WARN macro.
#]dnl
m4_ifndef(
  [GATBPS_MSG_NOTICE],
  [gatbps_fatal([
    GATBPS_MSG_NOTICE is not defined
  ], [
    this probably means that you forgot to add GATBPS_MSG_NOTICE.m4 to
    your Autoconf macros
  ])])[]dnl
[

]m4_if(
  m4_eval([$# <= 1]),
  [1],
  [AC_MSG_WARN([[]dnl
m4_normalize(m4_bpatsubst([[$1]], [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2]))[]dnl
m4_bregexp([[$1]], [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])])],
  [GATBPS_MSG_NOTICE([WARNING: $1])[

]GATBPS_MSG_WARN(m4_shift($@))])[

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
