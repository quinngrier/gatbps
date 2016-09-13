AC_INIT(
  [[GATBPS]],
  m4_esyscmd_s([
    'sh' '-' 'build-aux/VERSION.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([VERSION.sh failed])]),
  [[quinn.grier@gmail.com]],
  [[gatbps]],
  [[https://www.quinngrier.com/gatbps]])[

]GATBPS_DEFINE_VERSION(
  [AC_],
  [PACKAGE_VERSION])[

]GATBPS_DEFINE_DATE(
  [AC_],
  [PACKAGE_DATE],
  m4_esyscmd_s([
    'sh' '-' 'build-aux/DATE.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([DATE.sh failed])]))[

]m4_include([build-aux/CC0-1.0-AC-COPYRIGHT.ac])[

]AC_CONFIG_AUX_DIR([build-aux])[
]AC_CONFIG_MACRO_DIR([m4])[
]AC_CONFIG_MACRO_DIRS([m4])[
]AC_CONFIG_SRCDIR([doc/gatbps.texi])[

]AM_INIT_AUTOMAKE([
  -Wall
  foreign
  nostdinc
  subdir-objects
  tar-ustar
])

DEFINE_ALL

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
  [{
    case "${enable_awk}" in
      'yes')
        awk_default="${AWK_SH}"
      ;;
      'no')
        awk_default='auto'
      ;;
      *)
        awk_default="${enable_awk}"
      ;;
    esac
  :;}],
  [{
    awk_default='auto'
  :;}])
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
  [{
    case "${enable_sed}" in
      'yes')
        sed_default="${SED_SH}"
      ;;
      'no')
        sed_default='auto'
      ;;
      *)
        sed_default="${enable_sed}"
      ;;
    esac
  :;}],
  [{
    sed_default='auto'
  :;}])
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
  [{
    case "${enable_texi2any}" in
      'yes')
        case "${TEXI2ANY}" in
          ?*)
            texi2any_default="${TEXI2ANY}"
          ;;
          *)
            texi2any_default='auto'
          ;;
        esac
      ;;
      'no')
        texi2any_default='auto'
      ;;
      *)
        texi2any_default="${enable_texi2any}"
      ;;
    esac
  :;}],
  [{
    texi2any_default='auto'
  :;}])
AC_MSG_RESULT([${texi2any_default}])

AWK_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  '--awk='"${AWK_SH}" \
  '--sed='"${SED_SH}" \
  '--' \
  "${awk_default}"
`
case "${?}" in
  '0')
    :
  ;;
  *)
    AC_MSG_ERROR([sh-form.sh failed], [1])
  ;;
esac
AC_SUBST([AWK_DEFAULT_SH])
AM_SUBST_NOTMAKE([AWK_DEFAULT_SH])

SED_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  '--awk='"${AWK_SH}" \
  '--sed='"${SED_SH}" \
  '--' \
  "${sed_default}"
`
case "${?}" in
  '0')
    :
  ;;
  *)
    AC_MSG_ERROR([sh-form.sh failed], [1])
  ;;
esac
AC_SUBST([SED_DEFAULT_SH])
AM_SUBST_NOTMAKE([SED_DEFAULT_SH])

TEXI2ANY_DEFAULT_SH=`sh "${srcdir}/build-aux/sh-form.sh" \
  '--awk='"${AWK_SH}" \
  '--sed='"${SED_SH}" \
  '--' \
  "${texi2any_default}"
`
case "${?}" in
  '0')
    :
  ;;
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

AC_SUBST([TEXI2DVIFLAGS])

[

]dnl begin_targets
[

]GATBPS_CONFIG_FILE(
  [doc/texi/AWKDEFAULTTEXI.texi],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/PACKAGEDATE.texi],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/PACKAGEVERSION.texi],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/SEDDEFAULTTEXI.texi],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/TEXIANYDEFAULTTEXI.texi],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [src/tools/AWK_DEFAULT_SH.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/AWK_DEFAULT_TROFF.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE_TROFF.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_VERSION.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/SED_DEFAULT_SH.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/SED_DEFAULT_TROFF.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/SHEBANG_LINE.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/TEXI2ANY_DEFAULT_SH.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/TEXI2ANY_DEFAULT_TROFF.m4])[

]GATBPS_CP(
  [bin/gatbps],
  [src/gatbps],
  [executable])[

]GATBPS_CP(
  [gh-pages/$(html_dist_dst)],
  [$(html_dist_dst)],
  [regular])[

]GATBPS_M4(
  [doc/man/gatbps.1],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-AC-COPYRIGHT.ac],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-AM-COPYRIGHT.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-appendix.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-commit.txt],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-copying.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0-file.txt],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/CC0-1.0.txt],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/DATE.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_ENABLE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_ENABLE_BOOL.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_WITH.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_WITH_BOOL.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CACHE_CHECK.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_BASIC.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_CFLAG.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_COMPILE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_HEADER.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_LIB.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_LINK.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_RUN.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_SHEBANG_LINE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_SOFT_INCLUDE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_VARS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CONFIG_FILE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CONFIG_FILE_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CONFIG_FILE_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CP.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CP_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CP_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_AT.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_CLASSPATH.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_DATE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_DOCKER_BUILD_FLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_HARD_INCLUDE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_JARFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_JAVACFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_JAVADOCFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_VERSION.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_enable_SHEBANG_LINES.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_javadir.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DOCKER.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DOCKER_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DOCKER_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_ARCHIVE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_ARCHIVE_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_ARCHIVE_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_CLONE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_CLONE_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_CLONE_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_JAVA.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_JAVA_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_JAVA_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_M4.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_M4_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_M4_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_ERROR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_FAILURE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_NOTICE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_WARN.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_AWK.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_DOCKER.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_DOXYGEN.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_GATBPS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_GIT.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_GREP.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_GZIP.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_JAR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_JAVAC.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_JAVADOC.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_JDEPS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_M4.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_MAKEINFO.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_MKDIR_P.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_OPENSSL.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_SED.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_TAR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_TEXI2ANY.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_WGET.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_XZ.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_TAR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_TAR_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_TAR_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_V_PAD.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_WGET.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_WGET_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_WGET_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_XZ.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_XZ_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_XZ_SUBST.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/INPUT_FILTER.sh.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/Makefile.am.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/PACKAGEDATE.texi.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/PACKAGEVERSION.texi.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/PACKAGE_STRING.df.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/PACKAGE_VERSION.df.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/TEST_EXIT.h],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/VERSION.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/VERSION_LTCUR.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/awk-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/bdots.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/bothcontents.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/configure.ac.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/contents.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/cp.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/docbook-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/docbook.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/docker.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/doxygen-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/doxygen.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/dslash.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/dvi-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/echo.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_fatal.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_notice.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gequ.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/git.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gzip.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/html-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/indent.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/ipez.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/java-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/java.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/javadoc-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/javadoc.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lcei.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lequ.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lflo.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/m4.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/math.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/mdot.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/mdots.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/msign.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/mtvskipbot.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/mtvskiptop.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/nequ.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/pdf-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/plaintext-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/plaintext.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/prm.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/ps-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rcei.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rflo.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rules_code.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/sbs.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/sh-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/shortcontents.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/sps.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/tar.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/texi-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/texinfo.css],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/troff-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/wget.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/xml-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/xml.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/xz.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/gatbps],
  [mostlyclean])[

]dnl end_targets
[

]GATBPS_CONFIG_FILE_SUBST[
]GATBPS_CP_SUBST[
]GATBPS_M4_SUBST[

]AC_CONFIG_FILES([Makefile])[

]AC_OUTPUT[

]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
