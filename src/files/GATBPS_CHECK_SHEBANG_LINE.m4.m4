changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CHECK_SHEBANG_LINE.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_SHEBANG_LINE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
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
m4_case(
  [$#],
  [0], [],
  [gatbps_fatal([
    GATBPS_CHECK_SHEBANG_LINE requires exactly 0 arguments
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

case "$][{SHEBANG_LINE_0+x}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{SHEBANG_LINE_0} is already set
    ])[
  ;;
esac
SHEBANG_LINE_0='# shebang line disabled: '
'readonly' 'SHEBANG_LINE_0'

case "$][{SHEBANG_LINE+x}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{SHEBANG_LINE} is already set
    ])[
  ;;
esac
case "$][{cross_compiling}" in
  'yes')
    case "$][{enable_SHEBANG_LINES}" in
      '1')
        SHEBANG_LINE=''
      ;;
      '0')
        SHEBANG_LINE="$][{SHEBANG_LINE_0}"
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{enable_SHEBANG_LINES} value:
          $][{enable_SHEBANG_LINES}
        ])[
      ;;
    esac
  ;;
  'no')
    case "$][{enable_SHEBANG_LINES}" in
      '1')
        case "$][{HAVE_SHEBANG_LINE}" in
          '1')
            SHEBANG_LINE=''
          ;;
          '0')
            SHEBANG_LINE="$][{SHEBANG_LINE_0}"
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              invalid \$][{HAVE_SHEBANG_LINE} value:
              $][{HAVE_SHEBANG_LINE}
            ])[
          ;;
        esac
      ;;
      '0')
        SHEBANG_LINE="$][{SHEBANG_LINE_0}"
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{enable_SHEBANG_LINES} value:
          $][{enable_SHEBANG_LINES}
        ])[
      ;;
    esac
  ;;
  *)
    ]GATBPS_MSG_ERROR([
      invalid \$][{cross_compiling} value: $][{cross_compiling}
    ])[
  ;;
esac
'readonly' 'SHEBANG_LINE'

]AC_SUBST([SHEBANG_LINE])[
]AM_SUBST_NOTMAKE([SHEBANG_LINE])[

:;}]])[]dnl
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
