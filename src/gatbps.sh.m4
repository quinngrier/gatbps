changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/gatbps.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/AWK_DEFAULT_SH.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
include({%|src/tools/SED_DEFAULT_SH.m4|%}){%||%}dnl
include({%|src/tools/SHEBANG_LINE.m4|%}){%||%}dnl
include({%|src/tools/TEXI2ANY_DEFAULT_SH.m4|%}){%||%}dnl
include({%|src/tools/declare_detect_options.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/generation_code.m4|%}){%||%}dnl
include({%|src/tools/help_code.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
SHEBANG_LINE{%|#! /bin/sh -

|%}sh_prelude{%|

|%}declare_detect_options{%|

#
# The style_stdout and style_stderr variables hold the current settings
# for the --style-stdout and --style-stderr options. Each starts off as
# 'never' and is updated (to 'always', 'auto', or 'never') each time an
# appropriate option is found.
#

style_stdout='never'
style_stderr='never'

#
# The isatty1 and isatty2 variables indicate whether standard output and
# standard error are associated with terminals. Each starts off with the
# value 'unknown' and is lazily set to 'yes' or 'no' using the following
# code just before each point where the value is needed.
#
# For the isatty1 variable:
#
#       case "${isatty1}" in
#       #(
#         'unknown')
#           if 'test' '-t' '1'; then
#             isatty1='yes'
#           else
#             isatty1='no'
#           fi
#         ;;
#       esac
#
# For the isatty2 variable:
#
#       case "${isatty2}" in
#       #(
#         'unknown')
#           if 'test' '-t' '2'; then
#             isatty2='yes'
#           else
#             isatty2='no'
#           fi
#         ;;
#       esac
#

isatty1='unknown'
isatty2='unknown'

#
# The following two groups of variables hold ANSI escape sequences for
# bold, underline, and color styling of text written to standard output
# and standard error. Each variable starts off empty so that styling is
# disabled by default. Then, when appropriate, each group is set to the
# appropriate values using the following code.
#
# For standard output:
#
#       fR1='[22m[24m[39m' # stdout style: none
#       fB1='[24m[39m[1m'  # stdout style: bold
#       fI1='[22m[39m[4m'  # stdout style: underline
#       fr1='[22m[24m[31m' # stdout style: red
#       fg1='[22m[24m[32m' # stdout style: green
#       fy1='[22m[24m[33m' # stdout style: yellow
#       fb1='[22m[24m[34m' # stdout style: blue
#       fm1='[22m[24m[35m' # stdout style: magenta
#       fc1='[22m[24m[36m' # stdout style: cyan
#
# For standard error:
#
#       fR2='[22m[24m[39m' # stderr style: none
#       fB2='[24m[39m[1m'  # stderr style: bold
#       fI2='[22m[39m[4m'  # stderr style: underline
#       fr2='[22m[24m[31m' # stderr style: red
#       fg2='[22m[24m[32m' # stderr style: green
#       fy2='[22m[24m[33m' # stderr style: yellow
#       fb2='[22m[24m[34m' # stderr style: blue
#       fm2='[22m[24m[35m' # stderr style: magenta
#       fc2='[22m[24m[36m' # stderr style: cyan
#
# Note that the code contains escape characters, i.e., characters with
# value 0x1B, which do not normally appear in plain text. Text editors
# often have special ways of displaying such characters. In particular,
# some editors may actually interpret the escape sequences or silently
# hide or discard the escape characters.
#
# Although escape sequences offer a wide variety of functionality, the
# variables balance utility and portability. The colors are limited to
# those that should always be legible and accurate, and the styles are
# mutually exclusive. In particular, mixing bold and color is tempting
# but may produce inconsistent results across different systems.
#

fR1='' # stdout style: none
fB1='' # stdout style: bold
fI1='' # stdout style: underline
fr1='' # stdout style: red
fg1='' # stdout style: green
fy1='' # stdout style: yellow
fb1='' # stdout style: blue
fm1='' # stdout style: magenta
fc1='' # stdout style: cyan

fR2='' # stderr style: none
fB2='' # stderr style: bold
fI2='' # stderr style: underline
fr2='' # stderr style: red
fg2='' # stderr style: green
fy2='' # stderr style: yellow
fb2='' # stderr style: blue
fm2='' # stderr style: magenta
fc2='' # stderr style: cyan

#
# For each program P of interest, the P_auto variable holds a command
# that runs the best available version of P. The variable starts off
# empty and is lazily set using the following code just before each
# point where the value is needed.
#
# For the awk program:
#
#       case "${awk_auto}" in
#       #(
#         ?*)
#           ':'
#         ;;
#       #(
#         *)
#           awk_auto=''\''awk'\'''
#           for x in \
#             ''\''gawk'\''' \
#             ''\''mawk'\''' \
#             ''\''nawk'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\'''\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>&1 \
#             ; then
#               awk_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the sed program:
#
#       case "${sed_auto}" in
#       #(
#         ?*)
#           ':'
#         ;;
#       #(
#         *)
#           sed_auto=''\''sed'\'''
#           for x in \
#             ''\''gsed'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\'''\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>&1 \
#             ; then
#               sed_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the texi2any program:
#
#       case "${texi2any_auto}" in
#       #(
#         ?*)
#           ':'
#         ;;
#       #(
#         *)
#           texi2any_auto=''\''makeinfo'\'''
#           for x in \
#             ''\''texi2any'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\''--version'\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>&1 \
#             ; then
#               texi2any_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#

awk_auto=''
sed_auto=''
texi2any_auto=''

#
# For each program P of interest, the P variable holds the command that
# will be used to run P. The variable starts off with a value chosen by
# some outside force (such as a configure script) and is updated by the
# P environment variable (in all capital letters) and each instance of
# the --P=V option. If the variable starts off as 'auto', then it is
# immediately updated to the value of the P_auto variable.
#

awk=|%}AWK_DEFAULT_SH{%|
sed=|%}SED_DEFAULT_SH{%|
texi2any=|%}TEXI2ANY_DEFAULT_SH{%|

case "${awk}" in
  'auto')
    case "${awk_auto}" in
      ?*)
      ;;
      *)
        awk_auto=''\''awk'\'''
        for x in \
          ''\''gawk'\''' \
          ''\''mawk'\''' \
          ''\''nawk'\''' \
        ; do
          if 'eval' \
            "${x}"' '\'''\''' \
            0</dev/null \
            1>/dev/null \
            2>&1 \
          ; then
            awk_auto="${x}"
            'break'
          fi
        done
      ;;
    esac
    awk="${awk_auto}"
  ;;
esac

case "${sed}" in
  'auto')
    case "${sed_auto}" in
      ?*)
      ;;
      *)
        sed_auto=''\''sed'\'''
        for x in \
          ''\''gsed'\''' \
        ; do
          if 'eval' \
            "${x}"' '\'''\''' \
            0</dev/null \
            1>/dev/null \
            2>&1 \
          ; then
            sed_auto="${x}"
            'break'
          fi
        done
      ;;
    esac
    sed="${sed_auto}"
  ;;
esac

case "${texi2any}" in
  'auto')
    case "${texi2any_auto}" in
      ?*)
      ;;
      *)
        texi2any_auto=''\''makeinfo'\'''
        for x in \
          ''\''texi2any'\''' \
        ; do
          if 'eval' \
            "${x}"' '\''--version'\''' \
            0</dev/null \
            1>/dev/null \
            2>&1 \
          ; then
            texi2any_auto="${x}"
            'break'
          fi
        done
      ;;
    esac
    texi2any="${texi2any_auto}"
  ;;
esac

#
# The following code translates environment variables to arguments as
# described by the man page for this program.
#

case "${TEXI2ANY+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--texi2any='"${TEXI2ANY}"
      ;;
      *)
        'set' 'dummy' '--texi2any='"${TEXI2ANY}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${STYLE_STDOUT+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style-stdout='"${STYLE_STDOUT}"
      ;;
      *)
        'set' 'dummy' '--style-stdout='"${STYLE_STDOUT}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${STYLE_STDERR+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style-stderr='"${STYLE_STDERR}"
      ;;
      *)
        'set' 'dummy' '--style-stderr='"${STYLE_STDERR}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${STYLE+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style='"${STYLE}"
      ;;
      *)
        'set' 'dummy' '--style='"${STYLE}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${SED+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--sed='"${SED}"
      ;;
      *)
        'set' 'dummy' '--sed='"${SED}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${AWK+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--awk='"${AWK}"
      ;;
      *)
        'set' 'dummy' '--awk='"${AWK}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

#
# The following are the underlying boolean variables that are controlled
# by various options. Each is always set to 'yes' or 'no' and is updated
# each time an appropriate option is found.
#

boundary='no'
dry_run='no'
plain='no'
print0='no'
recursive='no'
unicode='yes'
verbose='no'

unicode_args_yes=''
unicode_args_no='-D insertascii'
unicode_args="${unicode_args_yes}"

exit_status='0'

ferror1='no'

path_args=''

case $# in
  '0')
    'set' 'dummy'
  ;;
  *)
    'set' 'dummy' "${@}"
  ;;
esac

while ':'; do

  'shift'

  case $# in
    '0')
      'break'
    ;;
  esac

  case "${detect_options}" in
    'yes')

      case "${1}" in

        '--')

          detect_options='no'
          'continue'

        ;;

        '--='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '--all')

          shift
          set 'x' '--all=' "${@}"
          'continue'

        ;;

        '--all='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--all=/prefix='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${prefix}" in
            *'/')
            ;;
            ?*)
              prefix="${prefix}/"
            ;;
          esac

          case "${prefix}" in
            '/'*)
            ;;
            *)
              prefix='./'"${prefix}"
            ;;
          esac

          shift

          'set' "${prefix}"'xml.am' "${@}"
          'set' "${prefix}"'xml-dist.am' "${@}"
          'set' "${prefix}"'wget.am' "${@}"
          'set' "${prefix}"'troff-form.sh' "${@}"
          'set' "${prefix}"'tprm.texi' "${@}"
          'set' "${prefix}"'texinfo.css' "${@}"
          'set' "${prefix}"'texi-form.sh' "${@}"
          'set' "${prefix}"'sps.texi' "${@}"
          'set' "${prefix}"'shortcontents.texi' "${@}"
          'set' "${prefix}"'sbs.texi' "${@}"
          'set' "${prefix}"'save-artifacts.sh' "${@}"
          'set' "${prefix}"'rules_code.m4' "${@}"
          'set' "${prefix}"'rflo.texi' "${@}"
          'set' "${prefix}"'rdarrow.texi' "${@}"
          'set' "${prefix}"'rcei.texi' "${@}"
          'set' "${prefix}"'rarrow.texi' "${@}"
          'set' "${prefix}"'qprm.texi' "${@}"
          'set' "${prefix}"'ps-dist.am' "${@}"
          'set' "${prefix}"'prm.texi' "${@}"
          'set' "${prefix}"'plaintext.am' "${@}"
          'set' "${prefix}"'plaintext-dist.am' "${@}"
          'set' "${prefix}"'pdf-dist.am' "${@}"
          'set' "${prefix}"'nequ.texi' "${@}"
          'set' "${prefix}"'mtvskiptop.texi' "${@}"
          'set' "${prefix}"'mtvskipbot.texi' "${@}"
          'set' "${prefix}"'msign.texi' "${@}"
          'set' "${prefix}"'mdots.texi' "${@}"
          'set' "${prefix}"'mdot.texi' "${@}"
          'set' "${prefix}"'math.texi' "${@}"
          'set' "${prefix}"'lrdarrow.texi' "${@}"
          'set' "${prefix}"'lrarrow.texi' "${@}"
          'set' "${prefix}"'lldarrow.texi' "${@}"
          'set' "${prefix}"'llarrow.texi' "${@}"
          'set' "${prefix}"'lflo.texi' "${@}"
          'set' "${prefix}"'lequ.texi' "${@}"
          'set' "${prefix}"'ldarrow.texi' "${@}"
          'set' "${prefix}"'lcei.texi' "${@}"
          'set' "${prefix}"'lbdarrow.texi' "${@}"
          'set' "${prefix}"'lbarrow.texi' "${@}"
          'set' "${prefix}"'larrow.texi' "${@}"
          'set' "${prefix}"'javadoc.am' "${@}"
          'set' "${prefix}"'javadoc-dist.am' "${@}"
          'set' "${prefix}"'java-test-wrapper.sh.im.in' "${@}"
          'set' "${prefix}"'java-test-wrapper.c' "${@}"
          'set' "${prefix}"'java-dist.am' "${@}"
          'set' "${prefix}"'ipez.texi' "${@}"
          'set' "${prefix}"'insertmathjax.texi' "${@}"
          'set' "${prefix}"'insertascii.texi' "${@}"
          'set' "${prefix}"'indent.texi' "${@}"
          'set' "${prefix}"'html-dist.am' "${@}"
          'set' "${prefix}"'git.am' "${@}"
          'set' "${prefix}"'gequ.texi' "${@}"
          'set' "${prefix}"'gen-configure.sh' "${@}"
          'set' "${prefix}"'gatbps_rule_word_error.m4' "${@}"
          'set' "${prefix}"'gatbps_notice.m4' "${@}"
          'set' "${prefix}"'gatbps_fatal.m4' "${@}"
          'set' "${prefix}"'gatbps_check_macros_code.m4' "${@}"
          'set' "${prefix}"'gatbps.am' "${@}"
          'set' "${prefix}"'gatbps.ac' "${@}"
          'set' "${prefix}"'format.java.vim' "${@}"
          'set' "${prefix}"'format.c.vim' "${@}"
          'set' "${prefix}"'format.am.vim' "${@}"
          'set' "${prefix}"'format.ac.vim' "${@}"
          'set' "${prefix}"'gatbps-echo.sh' "${@}"
          'set' "${prefix}"'dvi-dist.am' "${@}"
          'set' "${prefix}"'dslash.texi' "${@}"
          'set' "${prefix}"'dprm.texi' "${@}"
          'set' "${prefix}"'doxygen.am' "${@}"
          'set' "${prefix}"'doxygen-dist.am' "${@}"
          'set' "${prefix}"'docker.am' "${@}"
          'set' "${prefix}"'docbook.am' "${@}"
          'set' "${prefix}"'docbook-dist.am' "${@}"
          'set' "${prefix}"'cp.am' "${@}"
          'set' "${prefix}"'contents.texi' "${@}"
          'set' "${prefix}"'bothcontents.texi' "${@}"
          'set' "${prefix}"'bdots.texi' "${@}"
          'set' "${prefix}"'bdarrow.texi' "${@}"
          'set' "${prefix}"'barrow.texi' "${@}"
          'set' "${prefix}"'awk-form.sh' "${@}"
          'set' "${prefix}"'gatbps-gen-version.sh' "${@}"
          'set' "${prefix}"'TestExit.java' "${@}"
          'set' "${prefix}"'TEST_EXIT.h' "${@}"
          'set' "${prefix}"'PACKAGE_VERSION.df.in' "${@}"
          'set' "${prefix}"'PACKAGE_STRING.df.in' "${@}"
          'set' "${prefix}"'PACKAGEVERSION.texi.in' "${@}"
          'set' "${prefix}"'PACKAGEDATE.texi.in' "${@}"
          'set' "${prefix}"'gatbps-gen-libtool-c.sh' "${@}"
          'set' "${prefix}"'INPUT_FILTER.sh.in' "${@}"
          'set' "${prefix}"'GATBPS_WGET_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_WGET_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_WGET.m4' "${@}"
          'set' "${prefix}"'GATBPS_V_PAD.am' "${@}"
          'set' "${prefix}"'GATBPS_VPATH_SEARCH.am' "${@}"
          'set' "${prefix}"'GATBPS_PROG_TEXI2DVI_EXE.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_TEXI2ANY.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_RANLIB.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_MAKEINFO.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_GATBPS.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_DOXYGEN.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_CXX.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_CURL.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_CC.m4' "${@}"
          'set' "${prefix}"'GATBPS_PROG_AR.m4' "${@}"
          'set' "${prefix}"'GATBPS_MSG_WARN.m4' "${@}"
          'set' "${prefix}"'GATBPS_MSG_NOTICE.m4' "${@}"
          'set' "${prefix}"'GATBPS_MSG_FAILURE.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_CLONE_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_CLONE_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_GIT_CLONE.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_BUNDLE_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_BUNDLE_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_GIT_BUNDLE.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_ARCHIVE_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_GIT_ARCHIVE_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_GIT_ARCHIVE.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_xmldir.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_plaintextdir.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_javadocdir.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_javadir.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_enable_SHEBANG_LINES.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_docbookdir.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_VERSION.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_TEXI2DVIFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_LIB_LDFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_LIB_CXXFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_LIB_CFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_JAVADOCFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_JAVACFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_JARFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_HARD_INCLUDE.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_EXE_LDFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_EXE_CXXFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_EXE_CFLAGS.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_DATE.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_CLASSPATH.m4' "${@}"
          'set' "${prefix}"'GATBPS_DEFINE_AT.m4' "${@}"
          'set' "${prefix}"'GATBPS_CP_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_CP_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_CP.m4' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_LATER_VAR.m4' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_LATER_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_LATER_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_LATER.m4' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_FILE_SUBST.m4' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_FILE_RULES.am' "${@}"
          'set' "${prefix}"'GATBPS_CONFIG_FILE.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_SHEBANG_LINE.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_LINK.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_LIB.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_HEADER.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_EXEEXT.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_CXXFLAG.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_CLASSPATH_SEPARATOR.m4' "${@}"
          'set' "${prefix}"'GATBPS_CHECK_CFLAG.m4' "${@}"
          'set' "${prefix}"'GATBPS_CACHE_CHECK.m4' "${@}"
          'set' "${prefix}"'GATBPS_ARG_WITH_ENUM.m4' "${@}"
          'set' "${prefix}"'GATBPS_ARG_ENABLE_ENUM.m4' "${@}"
          'set' "${prefix}"'GATBPS_ARG_ENABLE_BOOL.m4' "${@}"
          'set' "${prefix}"'GATBPS_ARG_ENABLE.m4' "${@}"
          'set' "${prefix}"'gatbps-gen-date.sh' "${@}"
          'set' "${prefix}"'CC0-1.0.txt' "${@}"
          'set' "${prefix}"'CC0-1.0-file.txt' "${@}"
          'set' "${prefix}"'CC0-1.0-copying.texi' "${@}"
          'set' "${prefix}"'CC0-1.0-commit.txt' "${@}"
          'set' "${prefix}"'CC0-1.0-appendix.texi' "${@}"
          'set' "${prefix}"'CC0-1.0-AM-COPYRIGHT.am' "${@}"
          'set' "${prefix}"'CC0-1.0-AC-COPYRIGHT.ac' "${@}"

          set 'x' "${@}"

          'continue'

        ;;

        '-a')

          shift
          set 'x' '--all' "${@}"
          'continue'

        ;;

        '-a'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' "--all=${x}" "${@}"
          'continue'

        ;;

        '--append-path')

          path_args=''
          'continue'

        ;;

        '--append-path='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--append-path=/-I '\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac

          path_args="${path_args} ${x}"

          'continue'

        ;;

        '-I')

          shift
          set 'x' '--append-path' "${@}"
          'continue'

        ;;

        '-I'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' "--append-path=${x}" "${@}"
          'continue'

        ;;

        '--awk')

          case $# in
            '1')
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--awk${fR2} requires a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--awk=${x}" "${@}"

          'continue'

        ;;

        '--awk='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--awk=/awk='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${awk}" in
            'auto')
              case "${awk_auto}" in
                ?*)
                ;;
                *)
                  awk_auto=''\''awk'\'''
                  for x in \
                    ''\''gawk'\''' \
                    ''\''mawk'\''' \
                    ''\''nawk'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\'''\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>&1 \
                    ; then
                      awk_auto="${x}"
                      'break'
                    fi
                  done
                ;;
              esac
              awk="${awk_auto}"
            ;;
          esac

          'continue'

        ;;

        '--boundary')

          boundary='yes'
          'continue'

        ;;

        '--boundary='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--boundary${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-b')

          shift
          set 'x' '--boundary' "${@}"
          'continue'

        ;;

        '-b'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--boundary' "-${x}" "${@}"
          'continue'

        ;;

        '--dry-run')

          dry_run='yes'
          'continue'

        ;;

        '--dry-run='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--dry-run${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-n')

          shift
          set 'x' '--dry-run' "${@}"
          'continue'

        ;;

        '-n'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--dry-run' "-${x}" "${@}"
          'continue'

        ;;

        '--help')

          cat <<EOF1
Usage: ${fB1}gatbps${fR1} [<${fI1}argument${fR1}>]...

${fB1}gatbps${fR1} generates basic files for software packages. The arguments are
processed one at a time, in order. Each argument is classified either as
an operand or (roughly) as an option. Each operand generates a file, and
each option changes the overall behavior of the program. Each operand is
classified by its file name as either special or plain. There is a fixed
list of special files, and any other file is plain. Each special file is
fixed in content, with examples including copyright texts and scripts to
be used with the build system. Each plain file is generated as the plain
text output of a corresponding Texinfo file, which is useful for writing
files like ${fB1}README${fR1} and ${fB1}INSTALL${fR1}.

Try ${fB1}man gatbps${fR1} or ${fB1}info gatbps${fR1} for more information.
EOF1
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard output
EOF1
              exit 1
            ;;
          esac

          exit '0'

        ;;

        '--help='*)

          case "${1}" in

            '--help=')
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--help${fR2} values must not be empty
EOF1
              exit 1
            ;;

            '--help='*'/')
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--help${fR2} values must not end with slashes
EOF1
              exit 1
            ;;

|%}help_code({%|CC0-1.0-AC-COPYRIGHT.ac|%}){%|

|%}help_code({%|CC0-1.0-AM-COPYRIGHT.am|%}){%|

|%}help_code({%|CC0-1.0-appendix.texi|%}){%|

|%}help_code({%|CC0-1.0-commit.txt|%}){%|

|%}help_code({%|CC0-1.0-copying.texi|%}){%|

|%}help_code({%|CC0-1.0-file.txt|%}){%|

|%}help_code({%|CC0-1.0.txt|%}){%|

|%}help_code({%|gatbps-gen-date.sh|%}){%|

|%}help_code({%|GATBPS_ARG_ENABLE.m4|%}){%|

|%}help_code({%|GATBPS_ARG_ENABLE_BOOL.m4|%}){%|

|%}help_code({%|GATBPS_ARG_ENABLE_ENUM.m4|%}){%|

|%}help_code({%|GATBPS_ARG_WITH_ENUM.m4|%}){%|

|%}help_code({%|GATBPS_CACHE_CHECK.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_CFLAG.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_CLASSPATH_SEPARATOR.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_CXXFLAG.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_EXEEXT.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_HEADER.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_LIB.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_LINK.m4|%}){%|

|%}help_code({%|GATBPS_CHECK_SHEBANG_LINE.m4|%}){%|

|%}help_code({%|GATBPS_CONFIG_FILE.m4|%}){%|

|%}help_code({%|GATBPS_CONFIG_FILE_RULES.am|%}){%|

|%}help_code({%|GATBPS_CONFIG_FILE_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_CONFIG_LATER.m4|%}){%|

|%}help_code({%|GATBPS_CONFIG_LATER_RULES.am|%}){%|

|%}help_code({%|GATBPS_CONFIG_LATER_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_CONFIG_LATER_VAR.m4|%}){%|

|%}help_code({%|GATBPS_CP.m4|%}){%|

|%}help_code({%|GATBPS_CP_RULES.am|%}){%|

|%}help_code({%|GATBPS_CP_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_AT.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_CLASSPATH.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_DATE.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_EXE_CFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_EXE_CXXFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_EXE_LDFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_HARD_INCLUDE.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_JARFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_JAVACFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_JAVADOCFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_LIB_CFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_LIB_CXXFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_LIB_LDFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_TEXI2DVIFLAGS.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_VERSION.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_docbookdir.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_enable_SHEBANG_LINES.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_javadir.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_javadocdir.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_plaintextdir.m4|%}){%|

|%}help_code({%|GATBPS_DEFINE_xmldir.m4|%}){%|

|%}help_code({%|GATBPS_GIT_ARCHIVE.m4|%}){%|

|%}help_code({%|GATBPS_GIT_ARCHIVE_RULES.am|%}){%|

|%}help_code({%|GATBPS_GIT_ARCHIVE_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_GIT_BUNDLE.m4|%}){%|

|%}help_code({%|GATBPS_GIT_BUNDLE_RULES.am|%}){%|

|%}help_code({%|GATBPS_GIT_BUNDLE_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_GIT_CLONE.m4|%}){%|

|%}help_code({%|GATBPS_GIT_CLONE_RULES.am|%}){%|

|%}help_code({%|GATBPS_GIT_CLONE_SUBST.m4|%}){%|

|%}help_code({%|GATBPS_MSG_FAILURE.m4|%}){%|

|%}help_code({%|GATBPS_MSG_NOTICE.m4|%}){%|

|%}help_code({%|GATBPS_MSG_WARN.m4|%}){%|

|%}help_code({%|GATBPS_PROG_AR.m4|%}){%|

|%}help_code({%|GATBPS_PROG_CC.m4|%}){%|

|%}help_code({%|GATBPS_PROG_CURL.m4|%}){%|

|%}help_code({%|GATBPS_PROG_CXX.m4|%}){%|

|%}help_code({%|GATBPS_PROG_DOXYGEN.m4|%}){%|

|%}help_code({%|GATBPS_PROG_GATBPS.m4|%}){%|

|%}help_code({%|GATBPS_PROG_MAKEINFO.m4|%}){%|

|%}help_code({%|GATBPS_PROG_RANLIB.m4|%}){%|

|%}help_code({%|GATBPS_PROG_TEXI2ANY.m4|%}){%|

|%}help_code({%|GATBPS_PROG_TEXI2DVI_EXE.m4|%}){%|

|%}help_code({%|GATBPS_VPATH_SEARCH.am|%}){%|

|%}help_code({%|GATBPS_V_PAD.am|%}){%|

|%}help_code({%|GATBPS_WGET.m4|%}){%|

|%}help_code({%|GATBPS_WGET_RULES.am|%}){%|

|%}help_code({%|GATBPS_WGET_SUBST.m4|%}){%|

|%}help_code({%|INPUT_FILTER.sh.in|%}){%|

|%}help_code({%|PACKAGEDATE.texi.in|%}){%|

|%}help_code({%|PACKAGEVERSION.texi.in|%}){%|

|%}help_code({%|PACKAGE_STRING.df.in|%}){%|

|%}help_code({%|PACKAGE_VERSION.df.in|%}){%|

|%}help_code({%|TEST_EXIT.h|%}){%|

|%}help_code({%|TestExit.java|%}){%|

|%}help_code({%|gatbps-gen-version.sh|%}){%|

|%}help_code({%|gatbps-gen-libtool-c.sh|%}){%|

|%}help_code({%|awk-form.sh|%}){%|

|%}help_code({%|barrow.texi|%}){%|

|%}help_code({%|bdarrow.texi|%}){%|

|%}help_code({%|bdots.texi|%}){%|

|%}help_code({%|bothcontents.texi|%}){%|

|%}help_code({%|contents.texi|%}){%|

|%}help_code({%|cp.am|%}){%|

|%}help_code({%|docbook-dist.am|%}){%|

|%}help_code({%|docbook.am|%}){%|

|%}help_code({%|docker.am|%}){%|

|%}help_code({%|doxygen-dist.am|%}){%|

|%}help_code({%|doxygen.am|%}){%|

|%}help_code({%|dprm.texi|%}){%|

|%}help_code({%|dslash.texi|%}){%|

|%}help_code({%|dvi-dist.am|%}){%|

|%}help_code({%|gatbps-echo.sh|%}){%|

|%}help_code({%|format.ac.vim|%}){%|

|%}help_code({%|format.am.vim|%}){%|

|%}help_code({%|format.c.vim|%}){%|

|%}help_code({%|format.java.vim|%}){%|

|%}help_code({%|gatbps.ac|%}){%|

|%}help_code({%|gatbps.am|%}){%|

|%}help_code({%|gatbps_check_macros_code.m4|%}){%|

|%}help_code({%|gatbps_fatal.m4|%}){%|

|%}help_code({%|gatbps_notice.m4|%}){%|

|%}help_code({%|gatbps_rule_word_error.m4|%}){%|

|%}help_code({%|gen-configure.sh|%}){%|

|%}help_code({%|gequ.texi|%}){%|

|%}help_code({%|git.am|%}){%|

|%}help_code({%|html-dist.am|%}){%|

|%}help_code({%|indent.texi|%}){%|

|%}help_code({%|insertascii.texi|%}){%|

|%}help_code({%|insertmathjax.texi|%}){%|

|%}help_code({%|ipez.texi|%}){%|

|%}help_code({%|java-dist.am|%}){%|

|%}help_code({%|java-test-wrapper.c|%}){%|

|%}help_code({%|java-test-wrapper.sh.im.in|%}){%|

|%}help_code({%|javadoc-dist.am|%}){%|

|%}help_code({%|javadoc.am|%}){%|

|%}help_code({%|larrow.texi|%}){%|

|%}help_code({%|lbarrow.texi|%}){%|

|%}help_code({%|lbdarrow.texi|%}){%|

|%}help_code({%|lcei.texi|%}){%|

|%}help_code({%|ldarrow.texi|%}){%|

|%}help_code({%|lequ.texi|%}){%|

|%}help_code({%|lflo.texi|%}){%|

|%}help_code({%|llarrow.texi|%}){%|

|%}help_code({%|lldarrow.texi|%}){%|

|%}help_code({%|lrarrow.texi|%}){%|

|%}help_code({%|lrdarrow.texi|%}){%|

|%}help_code({%|math.texi|%}){%|

|%}help_code({%|mdot.texi|%}){%|

|%}help_code({%|mdots.texi|%}){%|

|%}help_code({%|msign.texi|%}){%|

|%}help_code({%|mtvskipbot.texi|%}){%|

|%}help_code({%|mtvskiptop.texi|%}){%|

|%}help_code({%|nequ.texi|%}){%|

|%}help_code({%|pdf-dist.am|%}){%|

|%}help_code({%|plaintext-dist.am|%}){%|

|%}help_code({%|plaintext.am|%}){%|

|%}help_code({%|prm.texi|%}){%|

|%}help_code({%|ps-dist.am|%}){%|

|%}help_code({%|qprm.texi|%}){%|

|%}help_code({%|rarrow.texi|%}){%|

|%}help_code({%|rcei.texi|%}){%|

|%}help_code({%|rdarrow.texi|%}){%|

|%}help_code({%|rflo.texi|%}){%|

|%}help_code({%|rules_code.m4|%}){%|

|%}help_code({%|save-artifacts.sh|%}){%|

|%}help_code({%|sbs.texi|%}){%|

|%}help_code({%|shortcontents.texi|%}){%|

|%}help_code({%|sps.texi|%}){%|

|%}help_code({%|texi-form.sh|%}){%|

|%}help_code({%|texinfo.css|%}){%|

|%}help_code({%|tprm.texi|%}){%|

|%}help_code({%|troff-form.sh|%}){%|

|%}help_code({%|wget.am|%}){%|

|%}help_code({%|xml-dist.am|%}){%|

|%}help_code({%|xml.am|%}){%|

            *)
              'eval' "${awk}"' '\''
                {
                  if (sub(/.*\//, "", $0)) {
                    name = $0
                  } else if (NR == 1) {
                    sub(/--help=/, "", $0)
                    name = $0
                  } else {
                    name = name "\n" $0
                  }
                }
                END {
                  printf "Plain file: '\''"${fB1}"'\''%s'\''"${fR1}"'\''\n", name
                  print ""
                  print "A plain file F is created by adding startup and shutdown code to F.texi"
                  print "and calling texi2any --plaintext. If F.top exists, it is prepended to F"
                  print "with a trailing newline and lines beginning with '\''\'\'''\''#'\''\'\'''\'' removed. Otherwise,"
                  print "if F.top.texi exists, it is handled like F.texi and prepended to F with"
                  print "a trailing newline. The same is done for F.bot(.texi), but appending to"
                  print "F with a leading newline."
                  print ""
                  print "Try '\''"${fB1}"'\''man gatbps'\''"${fR1}"'\'' or '\''"${fB1}"'\''info gatbps'\''"${fR1}"'\'' for more information."
                }
              '\''' <<EOF1
${1}
EOF1
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard output
EOF1
                  exit 1
                ;;
              esac
            ;;

          esac

          exit '0'

        ;;

        '--man')

          cat <<'EOF1'
|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`doc/man/gatbps.1.m4'){%||%}dnl
{%|EOF1
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard output
EOF1
              exit 1
            ;;
          esac

          exit '0'

        ;;

        '--man='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--man${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '--no-dry-run')

          dry_run='no'
          'continue'

        ;;

        '--no-dry-run='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-dry-run${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-N')

          shift
          set 'x' '--no-dry-run' "${@}"
          'continue'

        ;;

        '-N'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-dry-run' "-${x}" "${@}"
          'continue'

        ;;

        '--no-plain')

          plain='no'
          'continue'

        ;;

        '--no-plain='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-plain${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-P')

          shift
          set 'x' '--no-plain' "${@}"
          'continue'

        ;;

        '-P'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-plain' "-${x}" "${@}"
          'continue'

        ;;

        '--no-print0')

          print0='no'
          'continue'

        ;;

        '--no-print0='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-print0${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-Z')

          shift
          set 'x' '--no-print0' "${@}"
          'continue'

        ;;

        '-Z'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-print0' "-${x}" "${@}"
          'continue'

        ;;

        '--no-recursive')

          recursive='no'
          'continue'

        ;;

        '--no-recursive='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-recursive${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-R')

          shift
          set 'x' '--no-recursive' "${@}"
          'continue'

        ;;

        '-R'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-recursive' "-${x}" "${@}"
          'continue'

        ;;

        '--no-unicode')

          unicode='no'
          unicode_args="${unicode_args_no}"
          'continue'

        ;;

        '--no-unicode='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-unicode${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-U')

          shift
          set 'x' '--no-unicode' "${@}"
          'continue'

        ;;

        '-U'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-unicode' "-${x}" "${@}"
          'continue'

        ;;

        '--no-verbose')

          verbose='no'
          'continue'

        ;;

        '--no-verbose='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--no-verbose${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-V')

          shift
          set 'x' '--no-verbose' "${@}"
          'continue'

        ;;

        '-V'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--no-verbose' "-${x}" "${@}"
          'continue'

        ;;

        '--plain')

          plain='yes'
          'continue'

        ;;

        '--plain='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--plain${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-p')

          shift
          set 'x' '--plain' "${@}"
          'continue'

        ;;

        '-p'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--plain' "-${x}" "${@}"
          'continue'

        ;;

        '--print0')

          print0='yes'
          'continue'

        ;;

        '--print0='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--print0${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-z')

          shift
          set 'x' '--print0' "${@}"
          'continue'

        ;;

        '-z'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--print0' "-${x}" "${@}"
          'continue'

        ;;

        '--recursive')

          recursive='yes'
          'continue'

        ;;

        '--recursive='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--recursive${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-r')

          shift
          set 'x' '--recursive' "${@}"
          'continue'

        ;;

        '-r'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--recursive' "-${x}" "${@}"
          'continue'

        ;;

        '--sed')

          case $# in
            '1')
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--sed${fR2} requires a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--sed=${x}" "${@}"

          'continue'

        ;;

        '--sed='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--sed=/sed='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${sed}" in
            'auto')
              case "${sed_auto}" in
                ?*)
                ;;
                *)
                  sed_auto=''\''sed'\'''
                  for x in \
                    ''\''gsed'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\'''\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>&1 \
                    ; then
                      sed_auto="${x}"
                      'break'
                    fi
                  done
                ;;
              esac
              sed="${sed_auto}"
            ;;
          esac

          'continue'

        ;;

        '--style'|'--style=always')

          shift
          set 'x' '--style-stderr=always' '--style-stdout=always' "${@}"
          'continue'

        ;;

        '--style=auto')

          shift
          set 'x' '--style-stderr=auto' '--style-stdout=auto' "${@}"
          'continue'

        ;;

        '--style=never')

          shift
          set 'x' '--style-stderr=never' '--style-stdout=never' "${@}"
          'continue'

        ;;

        '--style='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} invalid ${fB2}--style${fR2} value
EOF1
          exit 1

        ;;

        '--style-stderr'|'--style-stderr=always')

          style_stderr='always'

          fR2='[22m[24m[39m' # stderr style: none
          fB2='[24m[39m[1m'  # stderr style: bold
          fI2='[22m[39m[4m'  # stderr style: underline
          fr2='[22m[24m[31m' # stderr style: red
          fg2='[22m[24m[32m' # stderr style: green
          fy2='[22m[24m[33m' # stderr style: yellow
          fb2='[22m[24m[34m' # stderr style: blue
          fm2='[22m[24m[35m' # stderr style: magenta
          fc2='[22m[24m[36m' # stderr style: cyan

          'continue'

        ;;

        '--style-stderr=auto')

          style_stderr='auto'

          case "${isatty2}" in
            'unknown')
              if 'test' '-t' '2'; then
                isatty2='yes'
              else
                isatty2='no'
              fi
            ;;
          esac

          case "${isatty2}" in
            'yes')
              fR2='[22m[24m[39m' # stderr style: none
              fB2='[24m[39m[1m'  # stderr style: bold
              fI2='[22m[39m[4m'  # stderr style: underline
              fr2='[22m[24m[31m' # stderr style: red
              fg2='[22m[24m[32m' # stderr style: green
              fy2='[22m[24m[33m' # stderr style: yellow
              fb2='[22m[24m[34m' # stderr style: blue
              fm2='[22m[24m[35m' # stderr style: magenta
              fc2='[22m[24m[36m' # stderr style: cyan
            ;;
            'no')
              fR2='' # stderr style: none
              fB2='' # stderr style: bold
              fI2='' # stderr style: underline
              fr2='' # stderr style: red
              fg2='' # stderr style: green
              fy2='' # stderr style: yellow
              fb2='' # stderr style: blue
              fm2='' # stderr style: magenta
              fc2='' # stderr style: cyan
            ;;
          esac

          'continue'

        ;;

        '--style-stderr=never')

          style_stderr='never'

          fR2='' # stderr style: none
          fB2='' # stderr style: bold
          fI2='' # stderr style: underline
          fr2='' # stderr style: red
          fg2='' # stderr style: green
          fy2='' # stderr style: yellow
          fb2='' # stderr style: blue
          fm2='' # stderr style: magenta
          fc2='' # stderr style: cyan

          'continue'

        ;;

        '--style-stderr='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} invalid ${fB2}--style-stderr${fR2} value
EOF1
          exit 1

        ;;

        '--style-stdout'|'--style-stdout=always')

          style_stdout='always'

          fR1='[22m[24m[39m' # stdout style: none
          fB1='[24m[39m[1m'  # stdout style: bold
          fI1='[22m[39m[4m'  # stdout style: underline
          fr1='[22m[24m[31m' # stdout style: red
          fg1='[22m[24m[32m' # stdout style: green
          fy1='[22m[24m[33m' # stdout style: yellow
          fb1='[22m[24m[34m' # stdout style: blue
          fm1='[22m[24m[35m' # stdout style: magenta
          fc1='[22m[24m[36m' # stdout style: cyan

          'continue'

        ;;

        '--style-stdout=auto')

          style_stdout='auto'

          case "${isatty1}" in
            'unknown')
              if 'test' '-t' '1'; then
                isatty1='yes'
              else
                isatty1='no'
              fi
            ;;
          esac

          case "${isatty1}" in
            'yes')
              fR1='[22m[24m[39m' # stdout style: none
              fB1='[24m[39m[1m'  # stdout style: bold
              fI1='[22m[39m[4m'  # stdout style: underline
              fr1='[22m[24m[31m' # stdout style: red
              fg1='[22m[24m[32m' # stdout style: green
              fy1='[22m[24m[33m' # stdout style: yellow
              fb1='[22m[24m[34m' # stdout style: blue
              fm1='[22m[24m[35m' # stdout style: magenta
              fc1='[22m[24m[36m' # stdout style: cyan
            ;;
            'no')
              fR1='' # stdout style: none
              fB1='' # stdout style: bold
              fI1='' # stdout style: underline
              fr1='' # stdout style: red
              fg1='' # stdout style: green
              fy1='' # stdout style: yellow
              fb1='' # stdout style: blue
              fm1='' # stdout style: magenta
              fc1='' # stdout style: cyan
            ;;
          esac

          'continue'

        ;;

        '--style-stdout=never')

          style_stdout='never'

          fR1='' # stdout style: none
          fB1='' # stdout style: bold
          fI1='' # stdout style: underline
          fr1='' # stdout style: red
          fg1='' # stdout style: green
          fy1='' # stdout style: yellow
          fb1='' # stdout style: blue
          fm1='' # stdout style: magenta
          fc1='' # stdout style: cyan

          'continue'

        ;;

        '--style-stdout='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} invalid ${fB2}--style-stdout${fR2} value
EOF1
          exit 1

        ;;

        '--texi2any')

          case $# in
            '1')
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--texi2any${fR2} requires a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--texi2any=${x}" "${@}"

          'continue'

        ;;

        '--texi2any='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--texi2any=/texi2any='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${texi2any}" in
            'auto')
              case "${texi2any_auto}" in
                ?*)
                ;;
                *)
                  texi2any_auto=''\''makeinfo'\'''
                  for x in \
                    ''\''texi2any'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\''--version'\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>&1 \
                    ; then
                      texi2any_auto="${x}"
                      'break'
                    fi
                  done
                ;;
              esac
              texi2any="${texi2any_auto}"
            ;;
          esac

          'continue'

        ;;

        '--unicode')

          unicode='yes'
          unicode_args="${unicode_args_yes}"
          'continue'

        ;;

        '--unicode='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--unicode${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-u')

          shift
          set 'x' '--unicode' "${@}"
          'continue'

        ;;

        '-u'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--unicode' "-${x}" "${@}"
          'continue'

        ;;

        '--verbose')

          verbose='yes'
          'continue'

        ;;

        '--verbose='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--verbose${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-v')

          shift
          set 'x' '--verbose' "${@}"
          'continue'

        ;;

        '-v'*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^-./x='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF1
${1}
EOF1
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: a command substitution
EOF1
              exit 1
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--verbose' "-${x}" "${@}"
          'continue'

        ;;

        '--version')

          cat <<EOF1
${fB1}gatbps${fR1} (GATBPS) |%}PACKAGE_VERSION{%|
This version was released on |%}PACKAGE_DATE{%|.
The authors of this program have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. You should have received a copy of the full
dedication along with this program, typically as a file
named <${fB1}CC0-1.0.txt${fR1}>. If not, it may be available at
<${fB1}https://creativecommons.org/publicdomain/zero/1.0/${fR1}>.
EOF1
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard output
EOF1
              exit 1
            ;;
          esac

          exit '0'

        ;;

        '--version='*)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}--version${fR2} forbids a value
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '--'*'='*)

          'eval' "${awk}"' '\''
            {
              if (NR != 1) {
                name = name "\n"
              }
              done = sub(/=.*/, "", $0)
              name = name $0
              if (done) {
                exit
              }
            }
            END {
              printf "'\''"${fr2}"'\''gatbps!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
              printf "'\''"${fr2}"'\''gatbps!'\''"${fR2}"'\'' try '\''"${fB2}"'\''gatbps --help'\''"${fR2}"'\'' for more information\n"
            }
          '\''' >&2 <<EOF1
${1}
EOF1
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard error
EOF1
            ;;
          esac
          exit 1

        ;;

        '--'*|'-'?)

          'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} unknown option: ${fB2}${1}${fR2}
${fr2}gatbps!${fR2} try ${fB2}gatbps --help${fR2} for more information
EOF1
          exit 1

        ;;

        '-'?*)

          'eval' "${awk}"' '\''
            {
              name = substr($0 "\n", 1, 2)
              printf "'\''"${fr2}"'\''gatbps!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
              printf "'\''"${fr2}"'\''gatbps!'\''"${fR2}"'\'' try '\''"${fB2}"'\''gatbps --help'\''"${fR2}"'\'' for more information\n"
              exit
            }
          '\''' >&2 <<EOF1
${1}
EOF1
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fr2}gatbps!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}gatbps!${fR2}   1. a here-document
${fr2}gatbps!${fR2} and writing to: standard error
EOF1
            ;;
          esac
          exit 1

        ;;

      esac

    ;;
  esac

  case "${1}" in
    ?*)
    ;;
    *)
      'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} operands must not be empty
${fy2}gatbps:${fR2} operand failed
EOF1
      exit_status='1'
      'continue'
    ;;
  esac

  case "${1}" in
    *'/')
      'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} operands must not end with slashes
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
      exit_status='1'
      'continue'
    ;;
  esac

  case "${dry_run}${verbose}" in
    *'yes'*)
      case "${ferror1}" in
        'no')
          case "${print0}" in
            'yes')
              'eval' "${awk}"' '\''
                {
                  if (NR == 1) {
                    x = $0
                  } else {
                    printf "%s", x
                    x = "\n" $0
                  }
                }
                END {
                  printf "%s%c", x, 0
                }
              '\''' <<EOF1
${1}
EOF1
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. a here-document
${fy2}gatbps:${fR2} and writing to: standard output
${fy2}gatbps:${fR2} printing failed: ${fB2}${1}${fR2}
${fy2}gatbps:${fR2} no further operands will be printed
EOF1
                  exit_status='1'
                  ferror1='yes'
                ;;
              esac
            ;;
            'no')
              cat <<EOF1
${1}
EOF1
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}cat${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. a here-document
${fy2}gatbps:${fR2} and writing to: standard output
${fy2}gatbps:${fR2} printing failed: ${fB2}${1}${fR2}
${fy2}gatbps:${fR2} no further operands will be printed
EOF1
                  exit_status='1'
                  ferror1='yes'
                ;;
              esac
            ;;
          esac
        ;;
      esac
    ;;
  esac

  case "${dry_run}" in
    'no')

      case "${1}" in
        '/'*)
          safe_1="${1}"
        ;;
        *)
          safe_1='./'"${1}"
        ;;
      esac

      tmp0="${1}.tmp0"
      tmp1="${1}.tmp1"
      tmp2="${1}.tmp2"
      tmp3="${1}.tmp3"
      tmp4="${1}.tmp4"
      tmp5="${1}.tmp5"
      tmp6="${1}.tmp6"
      tmp7="${1}.tmp7"
      tmp8="${1}.tmp8"
      tmp9="${1}.tmp9"

      safe_tmp0="${safe_1}.tmp0"
      safe_tmp1="${safe_1}.tmp1"
      safe_tmp2="${safe_1}.tmp2"
      safe_tmp3="${safe_1}.tmp3"
      safe_tmp4="${safe_1}.tmp4"
      safe_tmp5="${safe_1}.tmp5"
      safe_tmp6="${safe_1}.tmp6"
      safe_tmp7="${safe_1}.tmp7"
      safe_tmp8="${safe_1}.tmp8"
      safe_tmp9="${safe_1}.tmp9"

      successfully_deleted_files='yes'

      while ':'; do # generation

        'rm' '-f' "${safe_1}"
        case "${?}" in
          '0')
          ;;
          *)
            'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}rm -f${fR2} failed: ${fB2}${1}${fR2}
EOF1
            exit_status='1'
            successfully_deleted_files='no'
          ;;
        esac

        for i in '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'; do
          'rm' '-f' "${safe_1}"'.tmp'"${i}"
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}rm -f${fR2} failed: ${fB2}${1}.tmp${i}${fR2}
EOF1
              exit_status='1'
              successfully_deleted_files='no'
            ;;
          esac
        done

        case "${successfully_deleted_files}" in
          'no')
            'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
            'break' # generation
          ;;
        esac

        case "${plain},${1}" in

|%}generation_code({%|CC0-1.0-AC-COPYRIGHT.ac|%}){%|

|%}generation_code({%|CC0-1.0-AM-COPYRIGHT.am|%}){%|

|%}generation_code({%|CC0-1.0-appendix.texi|%}){%|

|%}generation_code({%|CC0-1.0-commit.txt|%}){%|

|%}generation_code({%|CC0-1.0-copying.texi|%}){%|

|%}generation_code({%|CC0-1.0-file.txt|%}){%|

|%}generation_code({%|CC0-1.0.txt|%}){%|

|%}generation_code({%|gatbps-gen-date.sh|%}){%|

|%}generation_code({%|GATBPS_ARG_ENABLE.m4|%}){%|

|%}generation_code({%|GATBPS_ARG_ENABLE_BOOL.m4|%}){%|

|%}generation_code({%|GATBPS_ARG_ENABLE_ENUM.m4|%}){%|

|%}generation_code({%|GATBPS_ARG_WITH_ENUM.m4|%}){%|

|%}generation_code({%|GATBPS_CACHE_CHECK.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_CFLAG.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_CLASSPATH_SEPARATOR.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_CXXFLAG.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_EXEEXT.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_HEADER.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_LIB.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_LINK.m4|%}){%|

|%}generation_code({%|GATBPS_CHECK_SHEBANG_LINE.m4|%}){%|

|%}generation_code({%|GATBPS_CONFIG_FILE.m4|%}){%|

|%}generation_code({%|GATBPS_CONFIG_FILE_RULES.am|%}){%|

|%}generation_code({%|GATBPS_CONFIG_FILE_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_CONFIG_LATER.m4|%}){%|

|%}generation_code({%|GATBPS_CONFIG_LATER_RULES.am|%}){%|

|%}generation_code({%|GATBPS_CONFIG_LATER_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_CONFIG_LATER_VAR.m4|%}){%|

|%}generation_code({%|GATBPS_CP.m4|%}){%|

|%}generation_code({%|GATBPS_CP_RULES.am|%}){%|

|%}generation_code({%|GATBPS_CP_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_AT.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_CLASSPATH.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_DATE.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_EXE_CFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_EXE_CXXFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_EXE_LDFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_HARD_INCLUDE.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_JARFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_JAVACFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_JAVADOCFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_LIB_CFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_LIB_CXXFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_LIB_LDFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_TEXI2DVIFLAGS.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_VERSION.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_docbookdir.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_enable_SHEBANG_LINES.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_javadir.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_javadocdir.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_plaintextdir.m4|%}){%|

|%}generation_code({%|GATBPS_DEFINE_xmldir.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_ARCHIVE.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_ARCHIVE_RULES.am|%}){%|

|%}generation_code({%|GATBPS_GIT_ARCHIVE_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_BUNDLE.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_BUNDLE_RULES.am|%}){%|

|%}generation_code({%|GATBPS_GIT_BUNDLE_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_CLONE.m4|%}){%|

|%}generation_code({%|GATBPS_GIT_CLONE_RULES.am|%}){%|

|%}generation_code({%|GATBPS_GIT_CLONE_SUBST.m4|%}){%|

|%}generation_code({%|GATBPS_MSG_FAILURE.m4|%}){%|

|%}generation_code({%|GATBPS_MSG_NOTICE.m4|%}){%|

|%}generation_code({%|GATBPS_MSG_WARN.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_AR.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_CC.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_CURL.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_CXX.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_DOXYGEN.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_GATBPS.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_MAKEINFO.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_RANLIB.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_TEXI2ANY.m4|%}){%|

|%}generation_code({%|GATBPS_PROG_TEXI2DVI_EXE.m4|%}){%|

|%}generation_code({%|GATBPS_VPATH_SEARCH.am|%}){%|

|%}generation_code({%|GATBPS_V_PAD.am|%}){%|

|%}generation_code({%|GATBPS_WGET.m4|%}){%|

|%}generation_code({%|GATBPS_WGET_RULES.am|%}){%|

|%}generation_code({%|GATBPS_WGET_SUBST.m4|%}){%|

|%}generation_code({%|INPUT_FILTER.sh.in|%}){%|

|%}generation_code({%|PACKAGEDATE.texi.in|%}){%|

|%}generation_code({%|PACKAGEVERSION.texi.in|%}){%|

|%}generation_code({%|PACKAGE_STRING.df.in|%}){%|

|%}generation_code({%|PACKAGE_VERSION.df.in|%}){%|

|%}generation_code({%|TEST_EXIT.h|%}){%|

|%}generation_code({%|TestExit.java|%}){%|

|%}generation_code({%|gatbps-gen-version.sh|%}){%|

|%}generation_code({%|gatbps-gen-libtool-c.sh|%}){%|

|%}generation_code({%|awk-form.sh|%}){%|

|%}generation_code({%|barrow.texi|%}){%|

|%}generation_code({%|bdarrow.texi|%}){%|

|%}generation_code({%|bdots.texi|%}){%|

|%}generation_code({%|bothcontents.texi|%}){%|

|%}generation_code({%|contents.texi|%}){%|

|%}generation_code({%|cp.am|%}){%|

|%}generation_code({%|docbook-dist.am|%}){%|

|%}generation_code({%|docbook.am|%}){%|

|%}generation_code({%|docker.am|%}){%|

|%}generation_code({%|doxygen-dist.am|%}){%|

|%}generation_code({%|doxygen.am|%}){%|

|%}generation_code({%|dprm.texi|%}){%|

|%}generation_code({%|dslash.texi|%}){%|

|%}generation_code({%|dvi-dist.am|%}){%|

|%}generation_code({%|gatbps-echo.sh|%}){%|

|%}generation_code({%|format.ac.vim|%}){%|

|%}generation_code({%|format.am.vim|%}){%|

|%}generation_code({%|format.c.vim|%}){%|

|%}generation_code({%|format.java.vim|%}){%|

|%}generation_code({%|gatbps.ac|%}){%|

|%}generation_code({%|gatbps.am|%}){%|

|%}generation_code({%|gatbps_check_macros_code.m4|%}){%|

|%}generation_code({%|gatbps_fatal.m4|%}){%|

|%}generation_code({%|gatbps_notice.m4|%}){%|

|%}generation_code({%|gatbps_rule_word_error.m4|%}){%|

|%}generation_code({%|gen-configure.sh|%}){%|

|%}generation_code({%|gequ.texi|%}){%|

|%}generation_code({%|git.am|%}){%|

|%}generation_code({%|html-dist.am|%}){%|

|%}generation_code({%|indent.texi|%}){%|

|%}generation_code({%|insertascii.texi|%}){%|

|%}generation_code({%|insertmathjax.texi|%}){%|

|%}generation_code({%|ipez.texi|%}){%|

|%}generation_code({%|java-dist.am|%}){%|

|%}generation_code({%|java-test-wrapper.c|%}){%|

|%}generation_code({%|java-test-wrapper.sh.im.in|%}){%|

|%}generation_code({%|javadoc-dist.am|%}){%|

|%}generation_code({%|javadoc.am|%}){%|

|%}generation_code({%|larrow.texi|%}){%|

|%}generation_code({%|lbarrow.texi|%}){%|

|%}generation_code({%|lbdarrow.texi|%}){%|

|%}generation_code({%|lcei.texi|%}){%|

|%}generation_code({%|ldarrow.texi|%}){%|

|%}generation_code({%|lequ.texi|%}){%|

|%}generation_code({%|lflo.texi|%}){%|

|%}generation_code({%|llarrow.texi|%}){%|

|%}generation_code({%|lldarrow.texi|%}){%|

|%}generation_code({%|lrarrow.texi|%}){%|

|%}generation_code({%|lrdarrow.texi|%}){%|

|%}generation_code({%|math.texi|%}){%|

|%}generation_code({%|mdot.texi|%}){%|

|%}generation_code({%|mdots.texi|%}){%|

|%}generation_code({%|msign.texi|%}){%|

|%}generation_code({%|mtvskipbot.texi|%}){%|

|%}generation_code({%|mtvskiptop.texi|%}){%|

|%}generation_code({%|nequ.texi|%}){%|

|%}generation_code({%|pdf-dist.am|%}){%|

|%}generation_code({%|plaintext-dist.am|%}){%|

|%}generation_code({%|plaintext.am|%}){%|

|%}generation_code({%|prm.texi|%}){%|

|%}generation_code({%|ps-dist.am|%}){%|

|%}generation_code({%|qprm.texi|%}){%|

|%}generation_code({%|rarrow.texi|%}){%|

|%}generation_code({%|rcei.texi|%}){%|

|%}generation_code({%|rdarrow.texi|%}){%|

|%}generation_code({%|rflo.texi|%}){%|

|%}generation_code({%|rules_code.m4|%}){%|

|%}generation_code({%|save-artifacts.sh|%}){%|

|%}generation_code({%|sbs.texi|%}){%|

|%}generation_code({%|shortcontents.texi|%}){%|

|%}generation_code({%|sps.texi|%}){%|

|%}generation_code({%|texi-form.sh|%}){%|

|%}generation_code({%|texinfo.css|%}){%|

|%}generation_code({%|tprm.texi|%}){%|

|%}generation_code({%|troff-form.sh|%}){%|

|%}generation_code({%|wget.am|%}){%|

|%}generation_code({%|xml-dist.am|%}){%|

|%}generation_code({%|xml.am|%}){%|

          *)

            if test '-e' "${safe_1}.top"; then

              if test '!' '-d' "${safe_1}.top"; then
                :
              else
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must not be a directory: ${fB2}${1}.top${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              fi

              'eval' "${awk}"' '\''
                $0 !~ /^#/ {
                  print $0
                }
                END {
                  print ""
                }
              '\''' <"${safe_1}.top" >"${safe_tmp0}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${1}.top${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp0}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            elif test '-e' "${safe_1}.top.texi"; then

              if test '!' '-d' "${safe_1}.top.texi"; then
                :
              else
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must not be a directory: ${fB2}${1}.top.texi${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              fi

              'eval' "${awk}"' '\''
                BEGIN {
                  print "\\input texinfo"
                  print "@setfilename foo"
                  print "@ifclear insertascii"
                  print "@documentencoding UTF-8"
                  print "@end ifclear"
                  print "@settitle foo"
                }
                {
                  print $0
                }
                END {
                  print "@bye"
                }
              '\''' <"${safe_1}.top.texi" >"${safe_tmp1}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${1}.top.texi${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp1}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

              'eval' "${texi2any}"' \
                '\''--plaintext'\'' \
                '"${unicode_args}"' \
                '"${path_args}"' \
                "${safe_tmp1}" \
                1>"${safe_tmp0}" \
              ;'
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${texi2any}${fR2} failed while reading from: ${fB2}${tmp1}${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp0}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

              echo >>"${safe_tmp0}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}echo${fR2} failed while writing to: ${fB2}${tmp0}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            else

              cat /dev/null >"${safe_tmp0}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}cat${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}/dev/null${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp0}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            fi

            if test '-e' "${safe_1}.texi"; then
              if test '!' '-d' "${safe_1}.texi"; then
                :
              else
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must not be a directory: ${fB2}${1}.texi${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              fi
            else
              'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must exist: ${fB2}${1}.texi${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
              exit_status='1'
              'break'
            fi

            'eval' "${awk}"' '\''
              BEGIN {
                print "\\input texinfo"
                print "@setfilename foo"
                print "@ifclear insertascii"
                print "@documentencoding UTF-8"
                print "@end ifclear"
                print "@settitle foo"
              }
              {
                print $0
              }
              END {
                print "@bye"
              }
            '\''' <"${safe_1}.texi" >"${safe_tmp2}"
            case "${?}" in
              '0')
              ;;
              *)
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${1}.texi${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              ;;
            esac

            'eval' "${texi2any}"' \
              '\''--plaintext'\'' \
              '"${unicode_args}"' \
              '"${path_args}"' \
              "${safe_tmp2}" \
              1>"${safe_tmp1}" \
            ;'
            case "${?}" in
              '0')
              ;;
              *)
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${texi2any}${fR2} failed while reading from: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp1}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              ;;
            esac

            if test '-e' "${safe_1}.bot"; then

              if test '!' '-d' "${safe_1}.bot"; then
                :
              else
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must not be a directory: ${fB2}${1}.bot${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              fi

              'eval' "${awk}"' '\''
                BEGIN {
                  print ""
                }
                $0 !~ /^#/ {
                  print $0
                }
              '\''' <"${safe_1}.bot" >"${safe_tmp2}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${1}.bot${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            elif test '-e' "${safe_1}.bot.texi"; then

              if test '!' '-d' "${safe_1}.bot.texi"; then
                :
              else
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} file must not be a directory: ${fB2}${1}.bot.texi${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              fi

              echo >"${safe_tmp2}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}echo${fR2} failed while writing to: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

              'eval' "${awk}"' '\''
                BEGIN {
                  print "\\input texinfo"
                  print "@setfilename foo"
                  print "@ifclear insertascii"
                  print "@documentencoding UTF-8"
                  print "@end ifclear"
                  print "@settitle foo"
                }
                {
                  print $0
                }
                END {
                  print "@bye"
                }
              '\''' <"${safe_1}.bot.texi" >"${safe_tmp3}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${1}.bot.texi${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp3}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

              'eval' "${texi2any}"' \
                '\''--plaintext'\'' \
                '"${unicode_args}"' \
                '"${path_args}"' \
                "${safe_tmp3}" \
                1>>"${safe_tmp2}" \
              ;'
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}${texi2any}${fR2} failed while reading from: ${fB2}${tmp3}${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            else

              cat /dev/null >"${safe_tmp2}"
              case "${?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}cat${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}/dev/null${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                  exit_status='1'
                  'break'
                ;;
              esac

            fi

            cat "${safe_tmp0}" "${safe_tmp1}" "${safe_tmp2}" >"${safe_1}"
            case "${?}" in
              '0')
              ;;
              *)
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}cat${fR2} failed while reading from:
${fy2}gatbps:${fR2}   1. ${fB2}${tmp0}${fR2}
${fy2}gatbps:${fR2}   2. ${fB2}${tmp1}${fR2}
${fy2}gatbps:${fR2}   3. ${fB2}${tmp2}${fR2}
${fy2}gatbps:${fR2} and writing to: ${fB2}${1}${fR2}
${fy2}gatbps:${fR2} generation failed: ${fB2}${1}${fR2}
EOF1
                exit_status='1'
                'break'
              ;;
            esac

          ;;

        esac

        'break'

      done # generation

      case "${successfully_deleted_files}" in
        'yes')

          for i in '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'; do
            'rm' '-f' "${safe_1}"'.tmp'"${i}"
            case "${?}" in
              '0')
              ;;
              *)
                'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} ${fB2}rm -f${fR2} failed: ${fB2}${1}.tmp${i}${fR2}
EOF1
                exit_status='1'
                successfully_deleted_files='no'
              ;;
            esac
          done

          case "${successfully_deleted_files}" in
            'no')
              'cat' 0<<EOF1 1>&2;
${fy2}gatbps:${fR2} cleanup failed: ${fB2}${1}${fR2}
EOF1
            ;;
          esac

        ;;
      esac

    ;;
  esac

  case "${boundary}${recursive}" in
    *'yes'*)

      while ':'; do # recursion
        case "${1}" in

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/CC0-1.0-AC-COPYRIGHT.ac.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/CC0-1.0-appendix.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps-gen-date.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_ARG_ENABLE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_ARG_ENABLE_BOOL.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_ARG_ENABLE_ENUM.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_ARG_WITH_ENUM.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CACHE_CHECK.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_CFLAG.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_CLASSPATH_SEPARATOR.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_CXXFLAG.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_EXEEXT.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_HEADER.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_LIB.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_LINK.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CHECK_SHEBANG_LINE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_FILE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_FILE_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_FILE_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_LATER.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_LATER_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_LATER_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CONFIG_LATER_VAR.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CP.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CP_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_CP_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_AT.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_CLASSPATH.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_DATE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_EXE_CFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_EXE_CXXFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_EXE_LDFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_HARD_INCLUDE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_JARFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_JAVACFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_JAVADOCFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_LIB_CFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_LIB_CXXFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_LIB_LDFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_TEXI2DVIFLAGS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_VERSION.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_docbookdir.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_enable_SHEBANG_LINES.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_javadir.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_javadocdir.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_plaintextdir.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_DEFINE_xmldir.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_ARCHIVE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_ARCHIVE_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_ARCHIVE_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_BUNDLE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_BUNDLE_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_BUNDLE_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_CLONE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_CLONE_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_GIT_CLONE_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_MSG_FAILURE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_MSG_NOTICE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_MSG_WARN.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_AR.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_CC.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_CURL.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_CXX.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_DOXYGEN.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_GATBPS.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_MAKEINFO.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_RANLIB.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_TEXI2ANY.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_PROG_TEXI2DVI_EXE.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_VPATH_SEARCH.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_V_PAD.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_WGET.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_WGET_RULES.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/GATBPS_WGET_SUBST.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/INPUT_FILTER.sh.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/PACKAGEDATE.texi.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/PACKAGEVERSION.texi.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/PACKAGE_STRING.df.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/PACKAGE_VERSION.df.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/TEST_EXIT.h.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/TestExit.java.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps-gen-version.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps-gen-libtool-c.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/awk-form.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/barrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/bdarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/bdots.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/bothcontents.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/contents.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/cp.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/docbook-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/docbook.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/docker.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/doxygen-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/doxygen.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/dprm.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/dslash.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/dvi-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps-echo.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/format.ac.vim.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/format.am.vim.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/format.c.vim.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/format.java.vim.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps.ac.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps_check_macros_code.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps_fatal.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps_notice.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gatbps_rule_word_error.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gen-configure.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/gequ.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/git.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/html-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/indent.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/insertascii.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/insertmathjax.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/ipez.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/java-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/java-test-wrapper.c.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/java-test-wrapper.sh.im.in.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/javadoc-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/javadoc.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/larrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lbarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lbdarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lcei.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/ldarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lequ.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lflo.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/llarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lldarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lrarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/lrdarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/math.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/mdot.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/mdots.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/msign.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/mtvskipbot.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/mtvskiptop.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/nequ.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/pdf-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/plaintext-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/plaintext.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/prm.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/ps-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/qprm.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/rarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/rcei.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/rdarrow.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/rflo.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/rules_code.m4.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/save-artifacts.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/sbs.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/shortcontents.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/sps.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/texi-form.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/texinfo.css.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/tprm.texi.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/troff-form.sh.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/wget.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/xml-dist.am.rc.m4'){%||%}dnl
{%|

|%}dnl
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/recursion/xml.am.rc.m4'){%||%}dnl
{%|

        esac
        break # recursion
      done # recursion

      boundary='no'

    ;;
  esac

done

exit "${exit_status}"

|%}footer_comment({%|#|%}, {%|#|%}, {%|#|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
