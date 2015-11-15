AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_SRCDIR([gatbps.texi])

AM_INIT_AUTOMAKE([-Wall -Werror info-in-builddir])

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

AC_ARG_VAR([SED], [the preferred sed executable])
AC_PROG_SED
AM_SUBST_NOTMAKE([SED])

AC_ARG_VAR([TEXI2ANY], [the preferred texi2any executable])
AC_CHECK_PROGS([TEXI2ANY], [texi2any makeinfo])
AM_SUBST_NOTMAKE([TEXI2ANY])

awk_default="${AWK}"
AC_ARG_ENABLE(
  [awk-auto],
  [AS_HELP_STRING([--enable-awk-auto], [use --awk=auto])],
  [
    case "${enableval}" in
    #(
      'yes')
        awk_default='auto'
      ;;
    #(
      'no')
        awk_default="${AWK}"
      ;;
    #(
      *)
        AC_MSG_ERROR([invalid --enable-awk-auto value], [1])
      ;;
    esac
  ]
)

sed_default="${SED}"
AC_ARG_ENABLE(
  [sed-auto],
  [AS_HELP_STRING([--enable-sed-auto], [use --sed=auto])],
  [
    case "${enableval}" in
    #(
      'yes')
        sed_default='auto'
      ;;
    #(
      'no')
        sed_default="${SED}"
      ;;
    #(
      *)
        AC_MSG_ERROR([invalid --enable-sed-auto value], [1])
      ;;
    esac
  ]
)

texi2any_default="${TEXI2ANY}"
AC_ARG_ENABLE(
  [texi2any-auto],
  [AS_HELP_STRING([--enable-texi2any-auto], [use --texi2any=auto])],
  [
    case "${enableval}" in
    #(
      'yes')
        texi2any_default='auto'
      ;;
    #(
      'no')
        texi2any_default="${TEXI2ANY}"
      ;;
    #(
      *)
        AC_MSG_ERROR([invalid --enable-texi2any-auto value], [1])
      ;;
    esac
  ]
)
case "${texi2any_default}" in
#(
  ?*)
    :
  ;;
#(
  *)
    AC_MSG_WARN([falling back to --enable-texi2any-auto])
    texi2any_default='auto'
  ;;
esac

AWK_DEFAULT_SH=`sh "${srcdir}/sh-form.sh" <<EOF
${awk_default}
EOF
`
case "${?}" in
#(
  '0')
    :
  ;;
#(
  *)
    AC_MSG_ERROR([sh-form.sh failed], [1])
  ;;
esac
AC_SUBST([AWK_DEFAULT_SH])
AM_SUBST_NOTMAKE([AWK_DEFAULT_SH])

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
