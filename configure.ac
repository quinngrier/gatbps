AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_SRCDIR([gatbps.texi])

m4_include([CC0-1.0-AC-COPYRIGHT.ac])
m4_include([DATE.ac])

AC_SYS_INTERPRETER
case "${interpval}" in
#(
  'no')
    AC_MSG_WARN([gatbps may not work properly])
  ;;
esac

AC_ARG_VAR([AWK], [the preferred awk executable])
AC_PROG_AWK
AM_SUBST_NOTMAKE([AWK])

awk_default="${AWK}"
AC_ARG_ENABLE([awk-auto],
  [AS_HELP_STRING([--enable-awk-auto],
    [default to --awk=auto (default is no)])],
  [
    case "${enableval}" in
    #(
      'yes')
        awk_default='auto'
      ;;
    esac
  ]
)

AC_ARG_VAR([SED], [the preferred sed executable])
AC_PROG_SED
AM_SUBST_NOTMAKE([SED])

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
${awk_default}
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

AWK_DEFAULT_SH=`sh sh-form.sh <<EOF
${awk_default}
EOF
`
case "${?}" in
#(
  0)
    :
  ;;
#(
  *)
    AC_MSG_ERROR([sh-form.sh failed], [1])
  ;;
esac
AC_SUBST([AWK_DEFAULT_SH])

AM_INIT_AUTOMAKE([-Wall -Werror info-in-builddir])

AC_SUBST([AT], ['@'])
AC_CONFIG_FILES([Makefile])
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
