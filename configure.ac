AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_SRCDIR([doc/gatbps.texi])

AM_INIT_AUTOMAKE([-Wall foreign info-in-builddir subdir-objects])

m4_include([CC0-1.0-AC-COPYRIGHT.ac])
m4_include([DATE.ac])

AC_SYS_INTERPRETER
case "${interpval}" in
#(
  'no')
    AC_MSG_WARN([gatbps may not work properly])
  ;;
esac

AC_ARG_VAR([AWK], [the command name for awk])
AC_PROG_AWK

AC_ARG_VAR([MAKEINFO], [the command name for makeinfo])

AC_ARG_VAR([SED], [the command name for sed])
AC_PROG_SED

AC_ARG_VAR([TEXI2ANY], [the command name for texi2any])
AC_CHECK_PROGS([TEXI2ANY], [texi2any makeinfo])

AC_ARG_ENABLE(
  [awk],
  [
AS_HELP_STRING([--disable-awk],
               [equivalent to --enable-awk=no (default)])
AS_HELP_STRING([--enable-awk],
               [equivalent to --enable-awk=yes])
AS_HELP_STRING([--enable-awk=no],
               [make gatbps default to --awk=auto])
AS_HELP_STRING([--enable-awk=yes],
               [make gatbps default to --awk=V where V is the best choice for this particular system])
AS_HELP_STRING([--enable-awk=V],
               [make gatbps default to --awk=V])],
  [
    case "${enable_awk}" in
    #(
      'no')
        awk_default='auto'
      ;;
    #(
      'yes')
        awk_default="${AWK}"
      ;;
    #(
      *)
        awk_default="${enable_awk}"
      ;;
    esac
  ],
  [
    awk_default='auto'
  ]
)

AC_ARG_ENABLE(
  [sed],
  [
AS_HELP_STRING([--disable-sed],
               [equivalent to --enable-sed=no (default)])
AS_HELP_STRING([--enable-sed],
               [equivalent to --enable-sed=yes])
AS_HELP_STRING([--enable-sed=no],
               [make gatbps default to --sed=auto])
AS_HELP_STRING([--enable-sed=yes],
               [make gatbps default to --sed=V where V is the best choice for this particular system])
AS_HELP_STRING([--enable-sed=V],
               [make gatbps default to --sed=V])],
  [
    case "${enable_sed}" in
    #(
      'no')
        sed_default='auto'
      ;;
    #(
      'yes')
        sed_default="${SED}"
      ;;
    #(
      *)
        sed_default="${enable_sed}"
      ;;
    esac
  ],
  [
    sed_default='auto'
  ]
)

AC_ARG_ENABLE(
  [texi2any],
  [
AS_HELP_STRING([--disable-texi2any],
               [equivalent to --enable-texi2any=no (default)])
AS_HELP_STRING([--enable-texi2any],
               [equivalent to --enable-texi2any=yes])
AS_HELP_STRING([--enable-texi2any=no],
               [make gatbps default to --texi2any=auto])
AS_HELP_STRING([--enable-texi2any=yes],
               [make gatbps default to --texi2any=V where V is the best choice for this particular system])
AS_HELP_STRING([--enable-texi2any=V],
               [make gatbps default to --texi2any=V])],
  [
    case "${enable_texi2any}" in
    #(
      'no')
        texi2any_default='auto'
      ;;
    #(
      'yes')
        case "${TEXI2ANY}" in
        #(
          ?*)
            texi2any_default="${TEXI2ANY}"
          ;;
        #(
          *)
            texi2any_default='auto'
          ;;
        esac
      ;;
    #(
      *)
        texi2any_default="${enable_texi2any}"
      ;;
    esac
  ],
  [
    texi2any_default='auto'
  ]
)

AWK_DEFAULT_SH=`sh "${srcdir}/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
<<EOF
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

SED_DEFAULT_SH=`sh "${srcdir}/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
<<EOF
${sed_default}
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
AC_SUBST([SED_DEFAULT_SH])
AM_SUBST_NOTMAKE([SED_DEFAULT_SH])

TEXI2ANY_DEFAULT_SH=`sh "${srcdir}/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
<<EOF
${texi2any_default}
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
AC_SUBST([TEXI2ANY_DEFAULT_SH])
AM_SUBST_NOTMAKE([TEXI2ANY_DEFAULT_SH])

#
# Make a version of @AWK@ that's safer to use as a troff macro argument.
#

AWK_DEFAULT_TROFF=`sed '
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

AWK_DEFAULT_TROFF=`tr '
' ' ' <<EOF
${AWK_DEFAULT_TROFF}
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

AC_SUBST([AWK_DEFAULT_TROFF])

AT='@'
AC_SUBST([AT])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([doc/texi/DATE.texi])
AC_CONFIG_FILES([doc/texi/VERSION.txi])
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
