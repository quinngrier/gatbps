dnl---------------------------------------------------------------------

AC_INIT(
  [[GATBPS]],
  m4_esyscmd_s([
    sh build-aux/gatbps-gen-version.sh
  ])m4_if(m4_sysval, 0, [], [
    m4_fatal([gatbps-gen-version.sh failed.])
  ]),
  [[quinn@quinngrier.com]],
  [[gatbps]],
  [[https://www.quinngrier.com/gatbps]])

dnl---------------------------------------------------------------------

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_SRCDIR([doc/gatbps.texi])

dnl---------------------------------------------------------------------

m4_include([build-aux/gatbps.ac])

dnl---------------------------------------------------------------------
dnl Program checks
dnl---------------------------------------------------------------------

GATBPS_PROG_AWK
GATBPS_PROG_MKDIR_P
GATBPS_PROG_SED

dnl---------------------------------------------------------------------

[

]gatbps_check_macros[ || 'exit' "${?}"

]GATBPS_DEFINE_VERSION(
  [AC_],
  [PACKAGE_VERSION])[

]GATBPS_DEFINE_DATE(
  [AC_],
  [PACKAGE_DATE],
  m4_esyscmd_s([
    sh build-aux/gatbps-gen-date.sh
  ])m4_if(m4_sysval, [0], [], [m4_fatal([gatbps-gen-date.sh failed])]))[

]m4_include([build-aux/CC0-1.0-AC-COPYRIGHT.ac])[

]AM_INIT_AUTOMAKE([
  -Wall
  foreign
  nostdinc
  subdir-objects
  tar-ustar
])[

]DEFINE_ALL[

]dnl begin_includes
[

]m4_include([bin/gatbps.ac])[
]m4_include([src/gatbps.sh.ac])[

]dnl end_includes
[

]

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

AWK_DEFAULT_SH=`sh "$srcdir"/build-aux/gatbps-echo.sh -q -- \
  "${awk_default}"
` || exit
AC_SUBST([AWK_DEFAULT_SH])
AM_SUBST_NOTMAKE([AWK_DEFAULT_SH])

SED_DEFAULT_SH=`sh "$srcdir"/build-aux/gatbps-echo.sh -q -- \
  "${sed_default}"
` || exit
AC_SUBST([SED_DEFAULT_SH])
AM_SUBST_NOTMAKE([SED_DEFAULT_SH])

TEXI2ANY_DEFAULT_SH=`sh "$srcdir"/build-aux/gatbps-echo.sh -q -- \
  "${texi2any_default}"
` || exit
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

[

]dnl begin_targets
[

]GATBPS_CONFIG_FILE(
  [doc/texi/AWKDEFAULTTEXI.texi],
  [doc/texi/AWKDEFAULTTEXI.texi.in],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/PACKAGEDATE.texi],
  [doc/texi/PACKAGEDATE.texi.in],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/PACKAGEVERSION.texi],
  [doc/texi/PACKAGEVERSION.texi.in],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/SEDDEFAULTTEXI.texi],
  [doc/texi/SEDDEFAULTTEXI.texi.in],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [doc/texi/TEXIANYDEFAULTTEXI.texi],
  [doc/texi/TEXIANYDEFAULTTEXI.texi.in],
  [maintainer-clean])[

]GATBPS_CONFIG_FILE(
  [src/tools/AWK_DEFAULT_SH.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/AWK_DEFAULT_TROFF.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE_DAY_ZPAD.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE_MONTH_ZPAD.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE_TROFF.m4])[

]GATBPS_CONFIG_FILE(
  [src/tools/PACKAGE_DATE_YEAR.m4])[

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
  [gh-pages/$(html_dist_dst)],
  [$(html_dist_dst)],
  [file],
  [mostlyclean],
  [
  ])[

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
  [src/files/gatbps-gen-date.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_ENABLE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_ENABLE_BOOL.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_ARG_ENABLE_ENUM.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CACHE_CHECK.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_CFLAG.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_CLASSPATH_SEPARATOR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_CXXFLAG.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_EXEEXT.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_HEADER.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_LIB.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CHECK_SHEBANG_LINE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_CONFIG_LATER_VAR.m4],
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
  [src/files/GATBPS_DEFINE_EXE_CFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_EXE_CXXFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_EXE_LDFLAGS.m4],
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
  [src/files/GATBPS_DEFINE_LIB_CFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_LIB_CXXFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_LIB_LDFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_TEXI2DVIFLAGS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_VERSION.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_docbookdir.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_enable_SHEBANG_LINES.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_javadir.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_javadocdir.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_plaintextdir.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_DEFINE_xmldir.m4],
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
  [src/files/GATBPS_GIT_BUNDLE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_BUNDLE_RULES.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_GIT_BUNDLE_SUBST.m4],
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
  [src/files/GATBPS_MSG_FAILURE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_NOTICE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_MSG_WARN.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_AR.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_CC.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_CXX.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_DOXYGEN.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_GATBPS.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_MAKEINFO.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_RANLIB.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_TEXI2ANY.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_PROG_TEXI2DVI_EXE.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/GATBPS_VPATH_SEARCH.am],
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
  [src/files/INPUT_FILTER.sh.in],
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
  [src/files/TestExit.java],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps-gen-version.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps-gen-libtool-c.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/awk-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/barrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/bdarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/bdots.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/bothcontents.texi],
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
  [src/files/dprm.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/dslash.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/dvi-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps-echo.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/format.ac.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/format.am.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/format.c.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/format.java.vim],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps.ac],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_check_macros_code.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_fatal.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_notice.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gatbps_rule_word_error.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gen-configure.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/gequ.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/git.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/html-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/indent.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/insertascii.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/insertmathjax.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/ipez.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/java-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/java-test-wrapper.c],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/java-test-wrapper.sh.im.in],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/javadoc-dist.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/javadoc.am],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/larrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lbarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lbdarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lcei.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/ldarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lequ.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lflo.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/llarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lldarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lrarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/lrdarrow.texi],
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
  [src/files/qprm.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rcei.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rdarrow.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rflo.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/rules_code.m4],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/save-artifacts.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/sbs.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/shortcontents.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/sps.texi],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/texi-form.sh],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/texinfo.css],
  [mostlyclean])[

]GATBPS_M4(
  [src/files/tprm.texi],
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

]dnl end_targets
[

]GATBPS_CP_SUBST[

]AC_CONFIG_FILES([Makefile])[

]AC_OUTPUT[

]
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
