changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/PACKAGE_DATE_TROFF.m4|%})dnl
include({%|src/tools/PACKAGE_VERSION.m4|%})dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: sh-form.sh
#
# The sh-form.sh special file is a portable shell script that formats
# its input as a shell string literal.
#
# For more information, see the GATBPS manual.
#

#
# With LC_ALL=C, locale-aware programs use the C locale instead of the
# current locale. This is generally the best approach for code that is
# not deliberately designed to work in other locales. The C locale has
# predictable behavior and is compatible with UTF-8. Other locales may
# have surprising behavior. This affects many important programs, like
# awk, grep, sed, and this shell instance itself. For more information,
# see the C standard, the POSIX standard, and the GNU C Library manual.
#

LC_ALL='C'
'export' 'LC_ALL'

#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'

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
#               <'/dev/null' \
#               >'/dev/null' \
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
#               <'/dev/null' \
#               >'/dev/null' \
#               2>&1 \
#             ; then
#               sed_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#

awk_auto=''
sed_auto=''

#
# For each program P of interest, the P variable holds the command that
# will be used to run P. The variable starts off with a value chosen by
# some outside force (such as a configure script) and is updated by the
# P environment variable (in all capital letters) and each instance of
# the --P=V option. If the variable starts off as 'auto', then it is
# immediately updated to the value of the P_auto variable.
#

awk='auto'
sed='auto'

case "${awk}" in
  'auto')
    case "${awk_auto}" in
      ?*)
        ':'
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
            <'/dev/null' \
            >'/dev/null' \
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
        ':'
      ;;
      *)
        sed_auto=''\''sed'\'''
        for x in \
          ''\''gsed'\''' \
        ; do
          if 'eval' \
            "${x}"' '\'''\''' \
            <'/dev/null' \
            >'/dev/null' \
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

#
# The following code translates environment variables to arguments as
# described by the manual page for this program.
#

case "${STYLE_STDOUT}" in
  ?*)
    'set' 'x' '--style-stdout='"${STYLE_STDOUT}" "${@}"
    'shift'
  ;;
esac

case "${STYLE_STDERR}" in
  ?*)
    'set' 'x' '--style-stderr='"${STYLE_STDERR}" "${@}"
    'shift'
  ;;
esac

case "${STYLE}" in
  ?*)
    'set' 'x' '--style='"${STYLE}" "${@}"
    'shift'
  ;;
esac

case "${SED}" in
  ?*)
    'set' 'x' '--sed='"${SED}" "${@}"
    'shift'
  ;;
esac

case "${AWK}" in
  ?*)
    'set' 'x' '--awk='"${AWK}" "${@}"
    'shift'
  ;;
esac

#
# The following are the underlying boolean variables that are controlled
# by various options. Each is always set to 'yes' or 'no' and is updated
# each time an appropriate option is found.
#

keep='no'

first_item='yes'
the_output=''

'set' 'x' "${@}"

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
${fr2}sh-form.sh!${fR2} ${fB2}--${fR2} forbids a value
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
EOF2
          'exit' '1'

        ;;

        '--awk')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}--awk${fR2} requires a value
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
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

          x=`eval "${sed}"' "
s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
1s/^--awk=/awk='\\''/
\\$s/\\$/'\\''/
"' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          case "${awk}" in
            'auto')
              case "${awk_auto}" in
                ?*)
                  ':'
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
                      <'/dev/null' \
                      >'/dev/null' \
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

        '--keep')

          keep='yes'
          'continue'

        ;;

        '--keep='*)

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}--keep${fR2} forbids a value
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
EOF2
          'exit' '1'

        ;;

        '-k')

          shift
          set 'x' '--keep' "${@}"
          'continue'

        ;;

        '-k'*)

          x=`eval "${sed}"' "
s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
1s/^-./x='\\''/
\\$s/\\$/'\\''/
"' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          shift
          set 'x' '--keep' "-${x}" "${@}"
          'continue'

        ;;

        '--man')

          cat <<'EOF2'
.de nohy
.nh
\\$1
.hy
..
.de TPZ
.PD 0
.TP
.PD
..
.de IPEZ
.PD 0
.IP ""
.PD
..
.hy
.TH "sh\-form.sh" "1" "|%}PACKAGE_DATE_TROFF{%|" "GATBPS |%}PACKAGE_VERSION{%|"
.SH "NAME"
.LP
\fBsh\-form.sh\fR \- format input as a shell string literal
.\"
.\" The authors of this file have waived all copyright and
.\" related or neighboring rights to the extent permitted by
.\" law as described by the CC0 1.0 Universal Public Domain
.\" Dedication. You should have received a copy of the full
.\" dedication along with this file, typically as a file
.\" named <CC0-1.0.txt>. If not, it may be available at
.\" <https://creativecommons.org/publicdomain/zero/1.0/>.
.\"
EOF2
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: standard output
EOF2
              'exit' '1'
            ;;
          esac

          exit '0'

        ;;

        '--man='*)

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}--man${fR2} forbids a value
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
EOF2
          'exit' '1'

        ;;

        '--sed')

          case "${#}" in
            '1')
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}--sed${fR2} requires a value
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
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

          x=`eval "${sed}"' "
s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
1s/^--sed=/sed='\\''/
\\$s/\\$/'\\''/
"' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
              'exit' '1'
            ;;
          esac
          'eval' "${x}"

          case "${sed}" in
            'auto')
              case "${sed_auto}" in
                ?*)
                  ':'
                ;;
                *)
                  sed_auto=''\''sed'\'''
                  for x in \
                    ''\''gsed'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\'''\''' \
                      <'/dev/null' \
                      >'/dev/null' \
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

        '--stdin')

s=`
cat
case "${?}" in
  '0')
    :
  ;;
  *)
    'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. standard input
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
    'exit' '1'
  ;;
esac
echo "'"
case "${?}" in
  '0')
    :
  ;;
  *)
    'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}echo${fR2} failed while writing to: a command substitution
EOF2
    'exit' '1'
  ;;
esac
`
case "${?}" in
  '0')
    :
  ;;
  *)
    'exit' '1'
  ;;
esac

case "${keep}" in
  'no')
    case "${s}" in
      *"${nl}'")
        s=`eval "${awk}"' '\\''
{
  if (NR == 1) {
    x = $0
  } else {
    printf "%s", x
    x = "\\n" $0
  }
}
END {
  printf "'\\''\\'\\'''\\''"
}
'\\''' <<EOF2
${s}
EOF2
`
        case "${?}" in
          '0')
            :
          ;;
          *)
            'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
            'exit' '1'
          ;;
        esac
      ;;
    esac
  ;;
esac

          case "${first_item}" in
            'no')
              the_output="${the_output}"' '
            ;;
          esac

          the_output="${the_output}"`eval "${sed}"' "
s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
1s/^/'\\''/
\\$s/'\\''\\\\\\\\'\\'''\\''\\$/'\\''/
"' <<EOF2
${s}
EOF2
`
case "${?}" in
  '0')
    :
  ;;
  *)
    'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
    'exit' '1'
  ;;
esac

          first_item='no'

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

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} invalid ${fB2}--style${fR2} value
EOF2
          'exit' '1'

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

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} invalid ${fB2}--style-stderr${fR2} value
EOF2
          'exit' '1'

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

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} invalid ${fB2}--style-stdout${fR2} value
EOF2
          'exit' '1'

        ;;

        '--'*'='*)

          eval "${awk}"' '\''
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
  printf "'\''"${fr2}"'\''sh-form.sh!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
  printf "'\''"${fr2}"'\''sh-form.sh!'\''"${fR2}"'\'' try '\''"${fB2}"'\''sh sh-form.sh --help'\''"${fR2}"'\'' for more information\n"
}
'\''' >&2 <<EOF2
${1}
EOF2
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: standard error
EOF2
            ;;
          esac
          'exit' '1'

        ;;

        '--'*|'-'?)

          'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} unknown option: ${fB2}${1}${fR2}
${fr2}sh-form.sh!${fR2} try ${fB2}sh sh-form.sh --help${fR2} for more information
EOF2
          'exit' '1'

        ;;

        '-'?*)

          eval "${awk}"' '\''
{
  name = substr($0 "\n", 1, 2)
  printf "'\''"${fr2}"'\''sh-form.sh!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
  printf "'\''"${fr2}"'\''sh-form.sh!'\''"${fR2}"'\'' try '\''"${fB2}"'\''sh sh-form.sh --help'\''"${fR2}"'\'' for more information\n"
  exit
}
'\''' >&2 <<EOF2
${1}
EOF2
          case "${?}" in
            '0')
              :
            ;;
            *)
              'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: standard error
EOF2
            ;;
          esac
          'exit' '1'

        ;;

      esac

    ;;
  esac

  case "${first_item}" in
    'no')
      the_output="${the_output}"' '
    ;;
  esac

  the_output="${the_output}"`eval "${sed}"' "
s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
1s/^/'\\''/
\\$s/\\$/'\\''/
"' <<EOF2
${1}
EOF2
`
  case "${?}" in
    '0')
      :
    ;;
    *)
      'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: a command substitution
EOF2
      'exit' '1'
    ;;
  esac

  first_item='no'

done

    'cat' <<EOF2
${the_output}
EOF2
  case "${?}" in
    '0')
      :
    ;;
    *)
      'cat' >&2 <<EOF2
${fr2}sh-form.sh!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}sh-form.sh!${fR2}   1. a here-document
${fr2}sh-form.sh!${fR2} and writing to: standard output
EOF2
      'exit' '1'
    ;;
  esac

'exit' '0'

|%}footer_comment({%|#|%}, {%|#|%}, {%|#|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
