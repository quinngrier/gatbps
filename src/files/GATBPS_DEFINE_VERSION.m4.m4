changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/rules_code.m4|%})dnl
rules_code({%|src/files/GATBPS_DEFINE_VERSION.m4|%})dnl
rules_code({%|src/tools/rules_code|%})dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DEFINE_VERSION.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_DEFINE_VERSION], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_VERSION macro for ]m4_if(
  m4_eval(m4_len([($1)$2.])[ > 38]),
  [1],
  [[
# ]])[($1)$2.
#]dnl
m4_case(
  [$#],
  [2], [],
  [3], [],
  [m4_fatal(dnl
[GATBPS_DEFINE_VERSION requires exactly 2 or 3 arguments]dnl
)])dnl
m4_if(
  m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [m4_fatal(dnl
[GATBPS_DEFINE_VERSION requires its first argument to match the ]dnl
[following regular expression: ^[A-Z_a-z][0-9A-Z_a-z]*$]dnl
)])dnl
[

:;}]])dnl
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
