changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DEFINE_DATE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_DEFINE_DATE], [{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_DATE macro for ($1)$2.
#
m4_case(
  [$#],
  [3], [],
  [m4_fatal([GATBPS_DEFINE_DATE requires exactly 3 arguments])])dnl
m4_if(
  m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [m4_fatal([GATBPS_DEFINE_DATE requires its first argument to be an identifier])])dnl
m4_if(
  m4_bregexp([$2], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [m4_fatal([GATBPS_DEFINE_DATE requires its second argument to be an identifier])])dnl
m4_ifdef(
  [$1$2],
  [m4_fatal([$1$2 is already defined])])dnl
m4_ifdef(
  [$1$2_YEAR],
  [m4_fatal([$1$2_YEAR is already defined])])dnl
m4_ifdef(
  [$1$2_MONTH],
  [m4_fatal([$1$2_MONTH is already defined])])dnl
m4_ifdef(
  [$1$2_DAY],
  [m4_fatal([$1$2_DAY is already defined])])dnl
m4_ifdef(
  [$1$2_YEAR_MOD_10000],
  [m4_fatal([$1$2_YEAR_MOD_10000 is already defined])])dnl
m4_ifdef(
  [$1$2_IS_LEAP_YEAR],
  [m4_fatal([$1$2_IS_LEAP_YEAR is already defined])])dnl
m4_ifdef(
  [$1$2_TROFF],
  [m4_fatal([$1$2_TROFF is already defined])])dnl
m4_ifdef(
  [$1$2_MONTH_NAME],
  [m4_fatal([$1$2_MONTH_NAME is already defined])])dnl
m4_ifdef(
  [$1$2_MONTH_ABBR],
  [m4_fatal([$1$2_MONTH_ABBR is already defined])])dnl
m4_ifdef(
  [$1$2_YEAR_ZPAD],
  [m4_fatal([$1$2_YEAR_ZPAD is already defined])])dnl
m4_ifdef(
  [$1$2_MONTH_ZPAD],
  [m4_fatal([$1$2_MONTH_ZPAD is already defined])])dnl
m4_ifdef(
  [$1$2_DAY_ZPAD],
  [m4_fatal([$1$2_DAY_ZPAD is already defined])])dnl
m4_define(
  [$1$2],
  [$3])dnl
m4_if(
  m4_bregexp($1$2, [^\+?[0-9]+-[0-9][0-9]-[0-9][0-9]$]),
  [-1],
  [m4_fatal([GATBPS_DEFINE_DATE requires its third argument to be a date])])dnl
m4_define(
  [$1$2_YEAR],
  m4_bregexp($1$2, [\+?0*\([^-]+\)], [\1]))dnl
m4_define(
  [$1$2_MONTH],
  m4_bregexp($1$2, [[^-]*-0?\([^-]*\)], [\1]))dnl
m4_define(
  [$1$2_DAY],
  m4_bregexp($1$2, [.*-0?\(.*\)], [\1]))dnl
m4_define(
  [$1$2_YEAR_MOD_10000],
  m4_bregexp($1$2_YEAR, [..?.?.?$], [\&]))dnl
m4_define(
  [$1$2_IS_LEAP_YEAR],
  m4_eval(
    ($1$2_YEAR_MOD_10000 % 4 == 0 &&
     $1$2_YEAR_MOD_10000 % 100 != 0) ||
    ($1$2_YEAR_MOD_10000 % 400 == 0)
  ))dnl
m4_if(
  m4_eval(
    ($1$2_DAY >= 1) &&
    (($1$2_MONTH ==  1 && $1$2_DAY <= 31) ||
     ($1$2_MONTH ==  2 && $1$2_DAY <= 28 + $1$2_IS_LEAP_YEAR) ||
     ($1$2_MONTH ==  3 && $1$2_DAY <= 31) ||
     ($1$2_MONTH ==  4 && $1$2_DAY <= 30) ||
     ($1$2_MONTH ==  5 && $1$2_DAY <= 31) ||
     ($1$2_MONTH ==  6 && $1$2_DAY <= 30) ||
     ($1$2_MONTH ==  7 && $1$2_DAY <= 31) ||
     ($1$2_MONTH ==  8 && $1$2_DAY <= 31) ||
     ($1$2_MONTH ==  9 && $1$2_DAY <= 30) ||
     ($1$2_MONTH == 10 && $1$2_DAY <= 31) ||
     ($1$2_MONTH == 11 && $1$2_DAY <= 30) ||
     ($1$2_MONTH == 12 && $1$2_DAY <= 31))
  ),
  [0],
  [m4_fatal([GATBPS_DEFINE_DATE requires its third argument to be a date])])dnl
m4_define(
  [$1$2_TROFF],
  m4_bpatsubst($1$2, [-], [\\-]))dnl
m4_define(
  [$1$2_MONTH_NAME],
  m4_if(
    $1$2_MONTH,  [1], [January],
    $1$2_MONTH,  [2], [February],
    $1$2_MONTH,  [3], [March],
    $1$2_MONTH,  [4], [April],
    $1$2_MONTH,  [5], [May],
    $1$2_MONTH,  [6], [June],
    $1$2_MONTH,  [7], [July],
    $1$2_MONTH,  [8], [August],
    $1$2_MONTH,  [9], [September],
    $1$2_MONTH, [10], [October],
    $1$2_MONTH, [11], [November],
    $1$2_MONTH, [12], [December]))dnl
m4_define(
  [$1$2_MONTH_ABBR],
  m4_substr($1$2_MONTH_NAME, [0], [3]))dnl
m4_define(
  [$1$2_YEAR_ZPAD],
  m4_if(
    m4_eval(m4_len($1$2_YEAR) > 3),
    [1],
    $1$2_YEAR,
    m4_bregexp([000]$1$2_YEAR, [....$], [\&])))dnl
m4_define(
  [$1$2_MONTH_ZPAD],
  m4_bpatsubst($1$2_MONTH, [^.$], [0\&]))dnl
m4_define(
  [$1$2_DAY_ZPAD],
  m4_bpatsubst($1$2_DAY, [^.$], [0\&]))dnl

AC_DEFINE(
  [$2],
  "$1$2",
  [Define to a character string literal that
   contains the specified date in YYYY-MM-DD form.
   The year may be preceded by a + character and may
   have any number of digits, including leading zeros.])

AC_DEFINE(
  [$2_YEAR],
  $1$2_YEAR,
  [Define to the year of $2 as an
   unsuffixed decimal integer constant.])

AC_DEFINE(
  [$2_MONTH],
  $1$2_MONTH,
  [Define to the month of $2 as an
   unsuffixed decimal integer constant.])

AC_DEFINE(
  [$2_DAY],
  $1$2_DAY,
  [Define to the day of $2 as an
   unsuffixed decimal integer constant.])

AC_DEFINE(
  [$2_IS_LEAP_YEAR],
  $1$2_IS_LEAP_YEAR,
  [Define to 1 if $2_YEAR is a leap year, or 0 if not.])

AC_DEFINE(
  [$2_TROFF],
  "m4_bpatsubst($1$2_TROFF, [\\], [\\\\])",
  [Define to the same thing as $2 but with
   each - character preceded by a \ character.])

AC_DEFINE(
  [$2_MONTH_NAME],
  "$1$2_MONTH_NAME",
  [Define to a character string literal that
   contains the capitalized full month name of $2.])

AC_DEFINE(
  [$2_MONTH_ABBR],
  "$1$2_MONTH_ABBR",
  [Define to the same thing as $2_MONTH_NAME
   but limited to three characters in length.])

AC_DEFINE(
  [$2_YEAR_ZPAD],
  "$1$2_YEAR_ZPAD",
  [Define to a character string literal
   that contains $2_YEAR preceded by as
   many zeros as necessary to ensure that
   it is at least four characters in length.])

AC_DEFINE(
  [$2_MONTH_ZPAD],
  "$1$2_MONTH_ZPAD",
  [Define to a character string literal
   that contains the MM component of $2.])

AC_DEFINE(
  [$2_DAY_ZPAD],
  "$1$2_DAY_ZPAD",
  [Define to a character string literal
   that contains the DD component of $2.])

$2='$1$2'
AC_SUBST([$2])

$2_YEAR='$1$2_YEAR'
AC_SUBST([$2_YEAR])

$2_MONTH='$1$2_MONTH'
AC_SUBST([$2_MONTH])

$2_DAY='$1$2_DAY'
AC_SUBST([$2_DAY])

$2_IS_LEAP_YEAR='$1$2_IS_LEAP_YEAR'
AC_SUBST([$2_IS_LEAP_YEAR])

$2_TROFF='$1$2_TROFF'
AC_SUBST([$2_TROFF])

$2_MONTH_NAME='$1$2_MONTH_NAME'
AC_SUBST([$2_MONTH_NAME])

$2_MONTH_ABBR='$1$2_MONTH_ABBR'
AC_SUBST([$2_MONTH_ABBR])

$2_YEAR_ZPAD='$1$2_YEAR_ZPAD'
AC_SUBST([$2_YEAR_ZPAD])

$2_MONTH_ZPAD='$1$2_MONTH_ZPAD'
AC_SUBST([$2_MONTH_ZPAD])

$2_DAY_ZPAD='$1$2_DAY_ZPAD'
AC_SUBST([$2_DAY_ZPAD])

:;}])dnl
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
