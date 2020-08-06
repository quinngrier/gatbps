changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.ac.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl

[

#-----------------------------------------------------------------------
# GATBPS: Program checks
#-----------------------------------------------------------------------

]

m4_define([GATBPS_PROG], [
  AC_CHECK_PROGS([$1], [[$2 $3]], [[$2]])
  AC_ARG_VAR([$1], [$2 command])
  AC_DEFINE_UNQUOTED([[$1]], [["$$1"]], [$2 command])
  AM_CONDITIONAL([HAVE_$1], [[command -v "$$1" >/dev/null]])
])

GATBPS_PROG([ASCIIDOCTOR], [asciidoctor])

[

#-----------------------------------------------------------------------

]

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
