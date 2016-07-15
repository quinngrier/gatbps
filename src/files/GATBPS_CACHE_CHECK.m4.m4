changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CACHE_CHECK.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CACHE_CHECK], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CACHE_CHECK macro for ]m4_if(
  m4_eval(m4_len([(gatbps_cv_)$2.])[ > 41]),
  [1],
  [[
# ]])[(gatbps_cv_)$2.
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
  [$1],
  [gatbps_cv_$2],
  [[{

    #
    # The block that contains this comment is the AC_CACHE_CHECK code
    # for ]]m4_if(
      m4_eval(m4_len([(gatbps_cv_)$2.])[ > 62]),
      [1],
      [[[
    # ]]])[[(gatbps_cv_)$2.
    #

    $2_was_cached='no'

    #
    # The rest of the code in this block is the third argument that was
    # given to GATBPS_CACHE_CHECK.
    #

    ]$3[

  :;}]])[

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
