dnl
dnl This file was generated by GATBPS 0.2.0-alpha.171+g12ad8a7, which was
dnl released on 2024-12-12. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: gatbps_notice.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20241212
AC_DEFUN([gatbps_notice_check_macros], [dnl
]m4_define(
  [gatbps_check_macros],
  m4_ifndef(
    [gatbps_check_macros],
    [[[# gatbps_check_macros]dnl
]],
    [m4_defn([gatbps_check_macros])])dnl
[gatbps_notice_check_macros[]dnl
]))[]dnl
AC_DEFUN([gatbps_notice], [dnl
gatbps_notice_check_macros[]dnl
m4_if(
  m4_eval([$# <= 1]),
  [1],
  [m4_errprintn(
m4_location[: ]dnl
m4_normalize(m4_bpatsubst([[$1]], [\[--VERBATIM--\]\(.\|
\)*\(.\)], [\2]))[]dnl
m4_bregexp([[$1]], [\(\[\)--VERBATIM--\]\(\(.\|
\)*\)], [\1\2])[]dnl
)],
  [gatbps_notice([$1])[]gatbps_notice(m4_shift($@))])[]dnl
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
