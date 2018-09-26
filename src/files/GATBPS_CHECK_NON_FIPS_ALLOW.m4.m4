changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CHECK_NON_FIPS_ALLOW.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_NON_FIPS_ALLOW.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CHECK_NON_FIPS_ALLOW], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_NON_FIPS_ALLOW macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_NON_FIPS_ALLOW_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_NON_FIPS_ALLOW has already been called
  ])],
  [m4_define([GATBPS_CHECK_NON_FIPS_ALLOW_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CHECK_NON_FIPS_ALLOW requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_REQUIRE([GATBPS_PROG_OPENSSL])[

]GATBPS_CHECK_BASIC(
  [openssl -non-fips-allow support],
  [HAVE_NON_FIPS_ALLOW],
  [[{
    case "$][{OPENSSL+is_set}" in
      ?*)
        "$][{OPENSSL}" \
          'dgst' \
          '-md5' \
          '-non-fips-allow' \
          0<'/dev/null' \
          1>'/dev/null' \
        ;
        case "$][{?}" in
          '0')
            gatbps_cv_HAVE_NON_FIPS_ALLOW='yes';
          ;;
          *)
            gatbps_cv_HAVE_NON_FIPS_ALLOW='no';
          ;;
        esac;
      ;;
      *)
        gatbps_cv_HAVE_NON_FIPS_ALLOW='no';
      ;;
    esac;
    'readonly' 'gatbps_cv_HAVE_NON_FIPS_ALLOW';
  :;}]])[

case "$][{HAVE_NON_FIPS_ALLOW}" in
  '1')
    NON_FIPS_ALLOW='-non-fips-allow';
  *)
    NON_FIPS_ALLOW='';
  ;;
esac;
'readonly' 'NON_FIPS_ALLOW';
]AC_SUBST([NON_FIPS_ALLOW])[

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
