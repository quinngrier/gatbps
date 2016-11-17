dnl
dnl This file was generated by GATBPS 0.0.0-4861-gc1d2cf1, which was
dnl released on 2016-11-17. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_CACHE_CHECK.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20161117
AC_DEFUN([GATBPS_CACHE_CHECK], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CACHE_CHECK macro for]dnl
m4_if(
  m4_eval(m4_len([ (gatbps_cv_)$2.])[ > 42]),
  [1],
  [[
#]])[ (gatbps_cv_)$2.
#

#
# The following variable starts off as 'yes' and is updated to 'no' in
# the AC_CACHE_CHECK code below, which runs when the cache variable is
# not cached. In other words, there are two possible outcomes:
#
#    1. If the cache variable is cached, then the AC_CACHE_CHECK code
#       below is skipped, the cache variable is set from the cache by
#       AC_CACHE_CHECK, and the following variable stays set to 'yes'.
#
#    2. If the cache variable is not cached, then the AC_CACHE_CHECK
#       code below runs, which updates the following variable to 'no'
#       and runs the code to set the cache variable.
#

$2_was_cached='yes'

#
# The rest of the code in this block is the expansion of AC_CACHE_CHECK.
#

]AC_CACHE_CHECK(
  m4_dquote(
m4_normalize(m4_bpatsubst([[$1]], [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2]))[]dnl
m4_bregexp([[$1]], [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])[]dnl
),
  [gatbps_cv_$2],
  [[{

    #
    # The block that contains this comment is the AC_CACHE_CHECK code
    # for]]m4_if(
      m4_eval(m4_len([ (gatbps_cv_)$2.])[ > 63]),
      [1],
      [[[
    #]]])[[ (gatbps_cv_)$2.
    #

    $2_was_cached='no'

    case "$][{gatbps_cv_$2+x}" in
      ?*)
        ]AC_MSG_ERROR(
[[\$][{gatbps_cv_$2} is already set]]dnl
, [[1]])[
      ;;
    esac

    #
    # The rest of the code in this block is the third argument that was
    # given to GATBPS_CACHE_CHECK.
    #

    ]$3[

  :;}]])[

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
