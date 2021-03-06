changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CHECK_BASIC.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_BASIC.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CHECK_BASIC], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_BASIC macro for]dnl
m4_if(
  m4_eval(m4_len([ (gatbps_cv_)$2.])[ > 42]),
  [1],
  [[
#]])[ (gatbps_cv_)$2.
#]dnl
m4_pushdef(
  [noun_phrase],
  m4_bpatsubst([[[$1]]], [\[--DETAILS--\]\(.\|
\)*\(..\)], [\2]))[]dnl
m4_pushdef(
  [macro_description],
  m4_dquote([Define to 1 if you have ]dnl
m4_bpatsubst(m4_dquote(noun_phrase), [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2])[]dnl
m4_bregexp(m4_dquote(noun_phrase), [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])[]dnl
[, or 0 if not.]dnl
m4_bregexp([[$1]], [\(\[\)--DETAILS--\]\(\(.\|
\)*\)], [ \1\2])[]dnl
))[]dnl
[

]GATBPS_CACHE_CHECK(
  [for ]m4_bpatsubst([[$1]], [\[--DETAILS--\]\(.\|
\)*\(.\)], [\2]),
  [$2],
  [{

    gatbps_list=''
    {m4_foreach_w(
      [gatbps_var],
      [$4],
      [
      {
        case "$[]{gatbps_var}" in
          'yes'|'no'|'1'|'0')
          ;;
          *)
            AC_MSG_RESULT([])
            AC_MSG_ERROR(
              [invalid \$[]{gatbps_var} value: $[]{gatbps_var}],
              [1])
          ;;
        esac
        case "$[]{gatbps_list}" in
          ?*)
            gatbps_list="$[]{gatbps_list}"'
  gatbps_var='"$[]{gatbps_var}"
          ;;
          *)
            gatbps_list='  gatbps_var='"$[]{gatbps_var}"
          ;;
        esac
      :;}])
    :;}

    case "$[]{gatbps_list}" in
      *'=no'*|*'=0'*)
        gatbps_cv_$2='no'
      ;;
      *)
        $3
      ;;
    esac

  :;}])

#
# The above AC_CACHE_CHECK code should have set the cache variable to
# 'yes' or 'no', but this may not be the case, as some of the code is
# provided by the caller of GATBPS_CHECK_BASIC and might be buggy. The
# user may also accidentally set the cache variable to an invalid value
# when editing the cache file. The following code helps to detect these
# kinds of problems.
#

case "$[]{gatbps_cv_$2}" in
  'yes'|'no')
  ;;
  *)
    AC_MSG_ERROR(
      [invalid \$[]{gatbps_cv_$2} value: $[]{gatbps_cv_$2}],
      [1])
  ;;
esac

case "$[]{GATBPS_CHECK_VERBOSE}" in
  ?*)
    case "$[]{$2_was_cached}" in
      'no')
        case "$[]{gatbps_list}" in
          ?*)
            AC_MSG_NOTICE([the values of the prerequisites for the above check were:
$[]{gatbps_list}])
          ;;
          *)
            AC_MSG_NOTICE([the above check has no prerequisites])
          ;;
        esac
      ;;
    esac
  ;;
esac

case "$[]{gatbps_cv_$2}" in
  'yes')
    AC_DEFINE([[$2]], [[1]], macro_description)
  ;;
  'no')
    AC_DEFINE([[$2]], [[0]], macro_description)
  ;;
esac

case "$[]{gatbps_cv_$2}" in
  'yes')
    $2='1'
  ;;
  'no')
    $2='0'
  ;;
esac
AC_SUBST([$2])

AM_CONDITIONAL([$2], [( ':'
  case "$[]{gatbps_cv_$2}" in
    'yes')
      'exit' '0'
    ;;
    'no')
      exit 1
    ;;
  esac
)])[

]dnl
m4_popdef([macro_description])[]dnl
m4_popdef([noun_phrase])[]dnl
[:;}]])[]dnl
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
