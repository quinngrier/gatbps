dnl
dnl This file was generated by GATBPS 0.0.0-3479-g21e9d83, which was
dnl released on 2016-08-05. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: gatbps_fatal.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([gatbps_fatal], [[]dnl
m4_case(
  [$#],
  [1], [],
  [m4_fatal([gatbps_fatal requires exactly 1 argument])])[]dnl
m4_fatal(m4_normalize([$1]))[]dnl
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
