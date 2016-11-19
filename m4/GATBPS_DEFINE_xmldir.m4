dnl
dnl This file was generated by GATBPS 0.0.0-4870-g35fc5da, which was
dnl released on 2016-11-19. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
dnl
dnl Special file: GATBPS_DEFINE_xmldir.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial 20161119
AC_DEFUN([GATBPS_DEFINE_xmldir], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_DEFINE_xmldir macro.
#]dnl
m4_ifdef(
  [GATBPS_DEFINE_xmldir_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_DEFINE_xmldir has already been called
  ])],
  [m4_define([GATBPS_DEFINE_xmldir_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# < 0 || $# > 0]),
  [1],
  [gatbps_fatal([
    GATBPS_DEFINE_xmldir requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

case "$][{xmldir+x}" in
  ?*)
    case "$][{xmldir}" in
      *'/')
        ]GATBPS_MSG_ERROR([
          invalid \$][{xmldir} value:
        [--VERBATIM--] "$][{xmldir}"], [
          \$][{xmldir} must not end with "/"
        ])[
      ;;
      '/'*)
      ;;
      '${'*)
      ;;
      *)
        ]GATBPS_MSG_ERROR([
          invalid \$][{xmldir} value:
        [--VERBATIM--] "$][{xmldir}"], [
          \$][{xmldir} must begin with "/" or "\${"
        ])[
      ;;
    esac
  ;;
  *)
    xmldir='$][{docdir}'
  ;;
esac
'readonly' 'xmldir'

]AC_ARG_VAR(
  [xmldir],
  [
    the directory to which to install intermediate XML documentation
    files (default: xmldir='$][{docdir}')
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
