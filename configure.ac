AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

m4_include([CC0-1.0-AC-COPYRIGHT.ac])
m4_include([DATE.ac])

AC_CONFIG_AUX_DIR([.])

AC_CONFIG_SRCDIR([gatbps.in])

dnl
dnl It's questionable whether shebangs not working would be a problem
dnl for a portable shell script, but we might as well print a warning.
dnl Such a system would probably be pretty precarious.
dnl

AC_SYS_INTERPRETER
AS_CASE(["${interpval}"], [no],
        [AC_MSG_WARN([the gatbps script may not work properly])])

AC_ARG_VAR([AWK], [the preferred awk implementation])
AC_PROG_AWK

#
# Make a version of @AWK@ that's safer to use as a troff macro argument.
#

AWK_TROFF=`sed '
s/"/""/g
s/\\\\/\\\\\\\\/g
s/-/\\\\-/g
1s/^/"\\\\fB/
$s/$/\\\\fR"/
' <<EOF
${AWK}
EOF
`
case "${?}" in
#(
  0)
    :
  ;;
#(
  *)
    AC_MSG_ERROR([sed failed], [1])
  ;;
esac

AWK_TROFF=`tr '
' ' ' <<EOF
${AWK_TROFF}
EOF
`
case "${?}" in
#(
  0)
    :
  ;;
#(
  *)
    AC_MSG_ERROR([tr failed], [1])
  ;;
esac

AC_SUBST([AWK_TROFF])

#
# Make a version of @AWK@ that's safer to use as the right side of a
# shell variable assignment.
#

AWK_SHELL=`sed "
s/'/'\\\\\\\\''/g
1s/^/'/
\\$s/\\$/'/
" <<EOF
${AWK}
EOF
`
case "${?}" in
#(
  0)
    :
  ;;
#(
  *)
    AC_MSG_ERROR([sed failed], [1])
  ;;
esac

AC_SUBST([AWK_SHELL])

AM_INIT_AUTOMAKE([-Wall -Werror info-in-builddir])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([gatbps.1])
AC_CONFIG_FILES([gatbps], [chmod +x gatbps])

AC_OUTPUT

dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
