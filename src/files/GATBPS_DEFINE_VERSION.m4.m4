changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DEFINE_VERSION.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DEFINE_VERSION.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_DEFINE_VERSION], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_VERSION macro for]dnl
m4_if(
  m4_eval(m4_len([ ($1)$2.])[ > 39]),
  [1],
  [[
#]])[ ($1)$2.
#]dnl
m4_if(
  m4_eval([$# < 2 || $# > 3]),
  [1],
  [gatbps_fatal([
    GATBPS_DEFINE_VERSION requires 2 to 3 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [gatbps_fatal([
    GATBPS_DEFINE_VERSION requires its first argument to match the
    following regular expression: ^[A-Z_a-z][0-9A-Z_a-z]*$
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [gatbps_fatal([
    GATBPS_DEFINE_VERSION requires its second argument to match the
    following regular expression: ^[A-Z_a-z][0-9A-Z_a-z]*$
  ])])[]dnl
m4_if(
  [$#],
  [2],
  [m4_ifndef(
    [$1$2],
    [gatbps_fatal([
      $1$2 is not defined
    ])])])[]dnl
m4_if(
  [$#],
  [3],
  [m4_ifdef(
    [$1$2],
    [gatbps_fatal([
      $1$2 is already defined
    ])])])[]dnl
m4_ifdef(
  [$1$2_MAJOR],
  [gatbps_fatal([
    $1$2_MAJOR is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_MINOR],
  [gatbps_fatal([
    $1$2_MINOR is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_PATCH],
  [gatbps_fatal([
    $1$2_PATCH is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_LTREV],
  [gatbps_fatal([
    $1$2_LTREV is already defined
  ])])[]dnl
m4_ifdef(
  [$1$2_LTAGE],
  [gatbps_fatal([
    $1$2_LTAGE is already defined
  ])])[]dnl
m4_if(
  [$#],
  [3],
  [m4_define(
    [$1$2],
    [[$3]])])[]dnl
m4_define(
  [$1$2_MAJOR],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_MINOR],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_PATCH],
  m4_if(
    m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+[^0-9]+[0-9]+]),
    [-1],
    [[[]]],
    [m4_bregexp($1$2, [^[^0-9]*[0-9]+[^0-9]+[0-9]+[^0-9]+0*\([0-9]+\)], [[[\1]]])]))[]dnl
m4_define(
  [$1$2_LTREV],
  m4_dquote($1$2_PATCH))[]dnl
m4_define(
  [$1$2_LTAGE],
  m4_dquote($1$2_MINOR))[]dnl
[

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
