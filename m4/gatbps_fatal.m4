dnl
dnl This file was generated by GATBPS 0.1.0-5446+g27bf3c2b, which was
dnl released on 2020-08-06. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: gatbps_fatal.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20200806
AC_DEFUN([gatbps_fatal_check_macros], [dnl
m4_ifndef(
  [gatbps_notice],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[gatbps_notice ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[did you forget ]dnl
[gatbps_notice.m4?]dnl
)[]dnl
])[]dnl
m4_ifndef(
  [gatbps_notice_check_macros],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[gatbps_notice_check_macros ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[this means that there is a bug in GATBPS]dnl
)[]dnl
])[]dnl
gatbps_notice_check_macros[]dnl
]m4_define(
  [gatbps_check_macros],
  m4_ifndef(
    [gatbps_check_macros],
    [[[# gatbps_check_macros]dnl
]],
    [m4_defn([gatbps_check_macros])])dnl
[gatbps_fatal_check_macros[]dnl
]))[]dnl
AC_DEFUN([gatbps_fatal], [dnl
gatbps_fatal_check_macros[]dnl
m4_if(
  m4_eval([$# <= 1]),
  [1],
  [m4_fatal(dnl
m4_normalize(m4_bpatsubst([[$1]], [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2]))[]dnl
m4_bregexp([[$1]], [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])[]dnl
)],
  [gatbps_notice([error: $1])[]gatbps_fatal(m4_shift($@))])[]dnl
])[]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
