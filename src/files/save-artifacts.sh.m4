changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/save-artifacts.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/use_the_c_locale.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: save-artifacts.sh
#
# For more information, see the GATBPS manual.
#

|%}use_the_c_locale{%|

#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'
'readonly' 'nl'

#
# The detect_options variable is set to 'yes' if the arguments are being
# scanned for options, or 'no' if not. It starts off as 'yes' and is set
# to 'no' upon finding the -- option.
#

detect_options='yes'

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
#               0<'/dev/null' \
#               1>'/dev/null' \
#               2>&1 \
#             ; then
#               awk_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the git program:
#
#       case "${git_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           git_auto=''\''git'\''';
#           for x in \
#           ; do
#             if 'eval' \
#               "${x}"' '\''--version'\''' \
#               0<'/dev/null' \
#               1>'/dev/null' \
#               2>'/dev/null' \
#             ; then
#               git_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
#
# For the gpg program:
#
#       case "${gpg_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           gpg_auto=''\''gpg'\''';
#           for x in \
#           ; do
#             if 'eval' \
#               "${x}"' '\''--version'\''' \
#               0<'/dev/null' \
#               1>'/dev/null' \
#               2>'/dev/null' \
#             ; then
#               gpg_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
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
#               0<'/dev/null' \
#               1>'/dev/null' \
#               2>&1 \
#             ; then
#               sed_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the sshpass program:
#
#       case "${sshpass_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           sshpass_auto=''\''sshpass'\''';
#           for x in \
#           ; do
#             if 'eval' \
#               "${x}"' '\''-V'\''' \
#               0<'/dev/null' \
#               1>'/dev/null' \
#               2>'/dev/null' \
#             ; then
#               sshpass_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
#

awk_auto=''
git_auto=''
gpg_auto=''
sed_auto=''
sshpass_auto=''

#
# For each program P of interest, the P variable holds the command that
# will be used to run P. The variable starts off with a value chosen by
# some outside force (such as a configure script) and is updated by the
# P environment variable (in all capital letters) and each instance of
# the --P=V option. If the variable starts off as 'auto', then it is
# immediately updated to the value of the P_auto variable.
#

awk='auto'
git='auto'
gpg='auto'
sed='auto'
sshpass='auto'

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
            0<'/dev/null' \
            1>'/dev/null' \
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

case "${git}" in
  'auto')
    case "${git_auto}" in
      ?*)
        ':';
      ;;
      *)
        git_auto=''\''git'\''';
        for x in \
        ; do
          if 'eval' \
            "${x}"' '\''--version'\''' \
            0<'/dev/null' \
            1>'/dev/null' \
            2>'/dev/null' \
          ; then
            git_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    git="${git_auto}";
  ;;
esac;

case "${gpg}" in
  'auto')
    case "${gpg_auto}" in
      ?*)
        ':';
      ;;
      *)
        gpg_auto=''\''gpg'\''';
        for x in \
        ; do
          if 'eval' \
            "${x}"' '\''--version'\''' \
            0<'/dev/null' \
            1>'/dev/null' \
            2>'/dev/null' \
          ; then
            gpg_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    gpg="${gpg_auto}";
  ;;
esac;

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
            0<'/dev/null' \
            1>'/dev/null' \
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

case "${sshpass}" in
  'auto')
    case "${sshpass_auto}" in
      ?*)
        ':';
      ;;
      *)
        sshpass_auto=''\''sshpass'\''';
        for x in \
        ; do
          if 'eval' \
            "${x}"' '\''-V'\''' \
            0<'/dev/null' \
            1>'/dev/null' \
            2>'/dev/null' \
          ; then
            sshpass_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    sshpass="${sshpass_auto}";
  ;;
esac;

#
# The following code translates environment variables to arguments as
# described by the man page for this program.
#

case "${STYLE_STDOUT+is_set}" in
  ?*)
    case "${#}" in
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
    case "${#}" in
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
    case "${#}" in
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

case "${SSHPASS+is_set}" in
  ?*)
    case "${#}" in
      '0')
        'set' 'dummy' '--sshpass='"${SSHPASS}";
      ;;
      *)
        'set' 'dummy' '--sshpass='"${SSHPASS}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${SED+is_set}" in
  ?*)
    case "${#}" in
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

case "${GPG+is_set}" in
  ?*)
    case "${#}" in
      '0')
        'set' 'dummy' '--gpg='"${GPG}";
      ;;
      *)
        'set' 'dummy' '--gpg='"${GPG}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${GIT+is_set}" in
  ?*)
    case "${#}" in
      '0')
        'set' 'dummy' '--git='"${GIT}";
      ;;
      *)
        'set' 'dummy' '--git='"${GIT}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${AWK+is_set}" in
  ?*)
    case "${#}" in
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

gpg_secret_key_file='gpg-secret-key-file.asc'

case "${#}" in
  '0')
    'set' 'dummy'
  ;;
  *)
    'set' 'dummy' "${@}"
  ;;
esac

while ':'; do

  'shift'

  case "${#}" in
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

          'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--${fR2} forbids a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
          'exit' '1'

        ;;

        '--awk')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--awk${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
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
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
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
                      0<'/dev/null' \
                      1>'/dev/null' \
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

        '--git')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--git${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--git=${x}" "${@}"

          'continue'

        ;;

        '--git='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--git=/git='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          case "${git}" in
            'auto')
              case "${git_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  git_auto=''\''git'\''';
                  for x in \
                  ; do
                    if 'eval' \
                      "${x}"' '\''--version'\''' \
                      0<'/dev/null' \
                      1>'/dev/null' \
                      2>'/dev/null' \
                    ; then
                      git_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              git="${git_auto}";
            ;;
          esac;

          'continue'

        ;;

        '--gpg')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--gpg${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--gpg=${x}" "${@}"

          'continue'

        ;;

        '--gpg='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--gpg=/gpg='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          case "${gpg}" in
            'auto')
              case "${gpg_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  gpg_auto=''\''gpg'\''';
                  for x in \
                  ; do
                    if 'eval' \
                      "${x}"' '\''--version'\''' \
                      0<'/dev/null' \
                      1>'/dev/null' \
                      2>'/dev/null' \
                    ; then
                      gpg_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              gpg="${gpg_auto}";
            ;;
          esac;

          'continue'

        ;;

        '--gpg-secret-key-file')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--gpg-secret-key-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--gpg-secret-key-file=${x}" "${@}"

          'continue'

        ;;

        '--gpg-secret-key-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--gpg-secret-key-file=/gpg_secret_key_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          'continue'

        ;;

        '--sed')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--sed${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
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
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
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
                      0<'/dev/null' \
                      1>'/dev/null' \
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

        '--sshpass')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}--sshpass${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              'exit' '1'
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--sshpass=${x}" "${@}"

          'continue'

        ;;

        '--sshpass='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--sshpass=/sshpass='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          case "${sshpass}" in
            'auto')
              case "${sshpass_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  sshpass_auto=''\''sshpass'\''';
                  for x in \
                  ; do
                    if 'eval' \
                      "${x}"' '\''-V'\''' \
                      0<'/dev/null' \
                      1>'/dev/null' \
                      2>'/dev/null' \
                    ; then
                      sshpass_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              sshpass="${sshpass_auto}";
            ;;
          esac;

          'continue'

        ;;

      esac

    ;;
  esac

done

'exit' '0';

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
