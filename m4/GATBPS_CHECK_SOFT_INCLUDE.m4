dnl
dnl This file was generated by GATBPS 0.0.0-3931-ge14e310, which was
dnl released on 2016-09-04. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_CHECK_SOFT_INCLUDE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CHECK_SOFT_INCLUDE], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_SOFT_INCLUDE macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_SOFT_INCLUDE_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_SOFT_INCLUDE has already been called
  ])],
  [m4_define([GATBPS_CHECK_SOFT_INCLUDE_HAS_BEEN_CALLED])])[]dnl
m4_case(
  [$#],
  [0], [],
  [gatbps_fatal([
    GATBPS_CHECK_SOFT_INCLUDE requires exactly 0 arguments
  ])])[]dnl
[

]GATBPS_CACHE_CHECK(
  [the soft makefile include syntax],
  [SOFT_INCLUDE],
  [[{

    gatbps_cv_SOFT_INCLUDE='#'

    case "$][{gatbps_cv_SOFT_INCLUDE}" in
      '#')

        'cat' >'conftest1.mk' <<'EOF'
-include conftest2.mk
1:
	'exit' '0'
EOF
        case "$][{?}" in
          '0')
          ;;
          *)
            ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
          ;;
        esac

        'rm' '-f' 'conftest2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]AC_MSG_ERROR(
[[rm failed]]dnl
, [[1]])[
          ;;
        esac

        'make' '-f' 'conftest1.mk' >'/dev/null' 2>&1
        case "$][{?}" in
          '0')

            'cat' >'conftest1.mk' <<'EOF'
-include conftest2.mk
1:
	'exit' '1'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
              ;;
            esac

            'cat' >'conftest2.mk' <<'EOF'
2:
	'exit' '0'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
              ;;
            esac

            'make' '-f' 'conftest1.mk' >'/dev/null' 2>&1
            case "$][{?}" in
              '0')
                gatbps_cv_SOFT_INCLUDE='-include'
              ;;
            esac

          ;;
        esac

      ;;
    esac

    case "$][{gatbps_cv_SOFT_INCLUDE}" in
      '#')

        'cat' >'conftest1.mk' <<'EOF'
sinclude conftest2.mk
1:
	'exit' '0'
EOF
        case "$][{?}" in
          '0')
          ;;
          *)
            ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
          ;;
        esac

        'rm' '-f' 'conftest2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]AC_MSG_ERROR(
[[rm failed]]dnl
, [[1]])[
          ;;
        esac

        'make' '-f' 'conftest1.mk' >'/dev/null' 2>&1
        case "$][{?}" in
          '0')

            'cat' >'conftest1.mk' <<'EOF'
sinclude conftest2.mk
1:
	'exit' '1'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
              ;;
            esac

            'cat' >'conftest2.mk' <<'EOF'
2:
	'exit' '0'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]AC_MSG_ERROR(
[[cat failed]]dnl
, [[1]])[
              ;;
            esac

            'make' '-f' 'conftest1.mk' >'/dev/null' 2>&1
            case "$][{?}" in
              '0')
                gatbps_cv_SOFT_INCLUDE='sinclude'
              ;;
            esac

          ;;
        esac

      ;;
    esac

    'readonly' 'gatbps_cv_SOFT_INCLUDE'

    'rm' '-f' 'conftest1.mk'
    'rm' '-f' 'conftest2.mk'

  :;}]])[

case "$][{SOFT_INCLUDE+x}" in
  ?*)
    ]AC_MSG_ERROR(
[[\$][{SOFT_INCLUDE} is already set]]dnl
, [[1]])[
  ;;
esac
SOFT_INCLUDE="$][{gatbps_cv_SOFT_INCLUDE}"
'readonly' 'SOFT_INCLUDE'

]AC_SUBST([SOFT_INCLUDE])[
]AM_SUBST_NOTMAKE([SOFT_INCLUDE])[

case "$][{GATBPS_CHECK_SOFT_INCLUDE_have+x}" in
  ?*)
    ]AC_MSG_ERROR(
[[\$][{GATBPS_CHECK_SOFT_INCLUDE_have} is already set]]dnl
, [[1]])[
  ;;
esac
case "$][{SOFT_INCLUDE}" in
  '#')
    GATBPS_CHECK_SOFT_INCLUDE_have='0'
  ;;
  *)
    GATBPS_CHECK_SOFT_INCLUDE_have='1'
  ;;
esac
'readonly' 'GATBPS_CHECK_SOFT_INCLUDE_have'

]GATBPS_CHECK_VARS(
  [
    soft makefile include support
  ],
  [HAVE_SOFT_INCLUDE],
  [
    GATBPS_CHECK_SOFT_INCLUDE_have
  ])[

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
