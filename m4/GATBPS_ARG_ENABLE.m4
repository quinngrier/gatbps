dnl
dnl This file was generated by GATBPS 0.1.0-5384+g2e2a4f04, which was
dnl released on 2019-12-25. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_ARG_ENABLE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20191225
AC_DEFUN([GATBPS_ARG_ENABLE], [[{

]m4_pushdef(
  [gatbps_x],
  enable_[]m4_bpatsubst([$1], [[^0-9A-Z_a-z]], [_]))[]dnl
[

]AC_ARG_ENABLE(
  [[$1]],
  [[$2]],
  [{
    ]gatbps_x[_was_given='yes'
  :;}],
  [{
    ]gatbps_x[_was_given='no'
    ]gatbps_x[='$3'
  :;}])[

]m4_popdef([gatbps_x])[

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
