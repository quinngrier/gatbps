dnl
dnl This file was generated by GATBPS 0.0.0-4568-gca8c275, which was
dnl released on 2016-10-10. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_CHECK_SHEBANG_LINE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20161010
AC_DEFUN([GATBPS_CHECK_SHEBANG_LINE], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_SHEBANG_LINE macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_SHEBANG_LINE_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_SHEBANG_LINE has already been called
  ])],
  [m4_define([GATBPS_CHECK_SHEBANG_LINE_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# < 0 || $# > 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CHECK_SHEBANG_LINE requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_REQUIRE([AC_SYS_INTERPRETER])[
]AC_REQUIRE([GATBPS_DEFINE_enable_SHEBANG_LINES])[

]GATBPS_CHECK_VARS(
  [
    shebang line support
  ],
  [HAVE_SHEBANG_LINE],
  [
    interpval
  ])[

case "$][{SHEBANG_LINE+x}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{SHEBANG_LINE} is already set
    ], [
      GATBPS_CHECK_SHEBANG_LINE reserves this variable for all use
    ])[
  ;;
esac
case "$][{cross_compiling}" in
  'no')
    case "$][{enable_SHEBANG_LINES}" in
      '1')
        case "$][{HAVE_SHEBANG_LINE}" in
          '1')
            SHEBANG_LINE=''
          ;;
          '0')
            SHEBANG_LINE='# shebang line disabled: '
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              invalid \$][{HAVE_SHEBANG_LINE} value:
            [--VERBATIM--] "$][{HAVE_SHEBANG_LINE}"], [
              this probably means that there is a bug in GATBPS
            ])[
          ;;
        esac
      ;;
      '0')
        SHEBANG_LINE='# shebang line disabled: '
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{enable_SHEBANG_LINES} value:
        [--VERBATIM--] "$][{enable_SHEBANG_LINES}"], [
          this probably means that there is a bug in GATBPS
        ])[
      ;;
    esac
  ;;
  *)
    case "$][{enable_SHEBANG_LINES}" in
      '1')
        SHEBANG_LINE=''
      ;;
      '0')
        SHEBANG_LINE='# shebang line disabled: '
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{enable_SHEBANG_LINES} value:
        [--VERBATIM--] "$][{enable_SHEBANG_LINES}"], [
          this probably means that there is a bug in GATBPS
        ])[
      ;;
    esac
  ;;
esac
'readonly' 'SHEBANG_LINE'

]AC_SUBST([SHEBANG_LINE])[
]AM_SUBST_NOTMAKE([SHEBANG_LINE])[

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
