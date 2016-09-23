dnl
dnl This file was generated by GATBPS 0.0.0-4254-g101d4c5, which was
dnl released on 2016-09-23. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_MSG_ERROR.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20160923
AC_DEFUN([GATBPS_MSG_ERROR], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_MSG_ERROR macro.
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
  [AC_MSG_ERROR([[]dnl
m4_normalize(m4_bpatsubst([[$1]], [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2]))[]dnl
m4_bregexp([[$1]], [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])[]dnl
], [[1]])],
  [GATBPS_MSG_NOTICE([error: $1])[

]GATBPS_MSG_ERROR(m4_shift($@))])[

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
