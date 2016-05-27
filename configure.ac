AC_INIT(
  [GATBPS],
  m4_esyscmd_s([
    'sh' 'build-aux/VERSION.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([VERSION.sh failed])]),
  [quinn.grier@gmail.com],
  [gatbps],
  [http://gatbps.quinngrier.com])

GATBPS_DEFINE_DATE(
  [AC_],
  [PACKAGE_DATE],
  m4_esyscmd_s([
    'sh' 'build-aux/DATE.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([DATE.sh failed])]))

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_SRCDIR([doc/gatbps.texi])

AM_INIT_AUTOMAKE([
  -Wall
  foreign
  nostdinc
  subdir-objects
  tar-ustar
])

m4_include([build-aux/CC0-1.0-AC-COPYRIGHT.ac])
m4_include([build-aux/VERSION.ac])

AC_PROG_MKDIR_P

AC_SYS_INTERPRETER
case "${interpval}" in
#(
  'no')
    AC_MSG_WARN([gatbps may not work properly])
  ;;
esac

AC_PROG_AWK
AC_ARG_VAR([AWK], [AWK interpreter command])

AC_CHECK_PROGS([M4], [gm4 m4])
AC_ARG_VAR([M4], [M4 preprocessor command])

case "${M4}" in
#(
  ?*)
    ':'
  ;;
#(
  *)
    AC_MSG_ERROR([an M4 preprocessor is required], [1])
  ;;
esac

AC_ARG_VAR([MAKEINFO], [the command name for makeinfo])

AC_PROG_SED
AC_ARG_VAR([SED], [sed interpreter command])

AC_CHECK_PROGS([TEXI2ANY], [texi2any makeinfo])
AC_ARG_VAR([TEXI2ANY], [the command name for texi2any])

AC_MSG_CHECKING([which --awk value to use by default])
AC_ARG_ENABLE(
  [awk],
  [
AS_HELP_STRING(
  [--enable-awk omitted],
  [same as --enable-awk=no])
AS_HELP_STRING(
  [--enable-awk],
  [same as --enable-awk=yes])
AS_HELP_STRING(
  [--disable-awk],
  [same as --enable-awk=no])
AS_HELP_STRING(
  [--enable-awk=yes],
  [use --awk=V by default where V is
   the best choice for this particular system])
AS_HELP_STRING(
  [--enable-awk=no],
  [use --awk=auto by default])
AS_HELP_STRING(
  [--enable-awk=V],
  [use --awk=V by default])],
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
AC_MSG_RESULT([${awk_default}])

AC_MSG_CHECKING([which --sed value to use by default])
AC_ARG_ENABLE(
  [sed],
  [
AS_HELP_STRING(
  [--enable-sed omitted],
  [same as --enable-sed=no])
AS_HELP_STRING(
  [--enable-sed],
  [same as --enable-sed=yes])
AS_HELP_STRING(
  [--disable-sed],
  [same as --enable-sed=no])
AS_HELP_STRING(
  [--enable-sed=yes],
  [use --sed=V by default where V is
   the best choice for this particular system])
AS_HELP_STRING(
  [--enable-sed=no],
  [use --sed=auto by default])
AS_HELP_STRING(
  [--enable-sed=V],
  [use --sed=V by default])],
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
AC_MSG_RESULT([${sed_default}])

AC_MSG_CHECKING([which --texi2any value to use by default])
AC_ARG_ENABLE(
  [texi2any],
  [
AS_HELP_STRING(
  [--enable-texi2any omitted],
  [same as --enable-texi2any=no])
AS_HELP_STRING(
  [--enable-texi2any],
  [same as --enable-texi2any=yes])
AS_HELP_STRING(
  [--disable-texi2any],
  [same as --enable-texi2any=no])
AS_HELP_STRING(
  [--enable-texi2any=yes],
  [use --texi2any=V by default where V is
   the best choice for this particular system])
AS_HELP_STRING(
  [--enable-texi2any=no],
  [use --texi2any=auto by default])
AS_HELP_STRING(
  [--enable-texi2any=V],
  [use --texi2any=V by default])],
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
AC_MSG_RESULT([${texi2any_default}])

AWK_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
  '--' \
  "${awk_default}"
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

SED_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
  '--' \
  "${sed_default}"
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

TEXI2ANY_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  "--awk=${AWK}" \
  "--sed=${SED}" \
  '--' \
  "${texi2any_default}"
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

AWK_DEFAULT_TEXI="${awk_default}"
AC_SUBST([AWK_DEFAULT_TEXI])
AM_SUBST_NOTMAKE([AWK_DEFAULT_TEXI])

SED_DEFAULT_TEXI="${sed_default}"
AC_SUBST([SED_DEFAULT_TEXI])
AM_SUBST_NOTMAKE([SED_DEFAULT_TEXI])

TEXI2ANY_DEFAULT_TEXI="${texi2any_default}"
AC_SUBST([TEXI2ANY_DEFAULT_TEXI])
AM_SUBST_NOTMAKE([TEXI2ANY_DEFAULT_TEXI])

AWK_DEFAULT_TROFF="${awk_default}"
AC_SUBST([AWK_DEFAULT_TROFF])
AM_SUBST_NOTMAKE([AWK_DEFAULT_TROFF])

SED_DEFAULT_TROFF="${sed_default}"
AC_SUBST([SED_DEFAULT_TROFF])
AM_SUBST_NOTMAKE([SED_DEFAULT_TROFF])

TEXI2ANY_DEFAULT_TROFF="${texi2any_default}"
AC_SUBST([TEXI2ANY_DEFAULT_TROFF])
AM_SUBST_NOTMAKE([TEXI2ANY_DEFAULT_TROFF])

AT='@'
AC_SUBST([AT])

AC_SUBST([TEXI2DVIFLAGS])

GATBPS_CONFIG_FILE([doc/texi/AWKDEFAULTTEXI.texi])
GATBPS_CONFIG_FILE([doc/texi/PACKAGEDATE.texi])
GATBPS_CONFIG_FILE([doc/texi/PACKAGEVERSION.texi])
GATBPS_CONFIG_FILE([doc/texi/SEDDEFAULTTEXI.texi])
GATBPS_CONFIG_FILE([doc/texi/TEXIANYDEFAULTTEXI.texi])
GATBPS_CONFIG_FILE([src/gatbps.m4])
GATBPS_CONFIG_FILE([src/tools/AWK_DEFAULT_TROFF.m4])
GATBPS_CONFIG_FILE([src/tools/PACKAGE_DATE.m4])
GATBPS_CONFIG_FILE([src/tools/PACKAGE_DATE_TROFF.m4])
GATBPS_CONFIG_FILE([src/tools/PACKAGE_VERSION.m4])
GATBPS_CONFIG_FILE([src/tools/SED_DEFAULT_TROFF.m4])
GATBPS_CONFIG_FILE([src/tools/TEXI2ANY_DEFAULT_TROFF.m4])

GATBPS_CONFIG_FILE_SUBST

AC_CONFIG_FILES([Makefile])

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
