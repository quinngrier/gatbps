#
# This file was generated by GATBPS 0.0.0-3749-ge1f06ad, which was
# released on 2016-08-22. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: VERSION_LTCUR.sh
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
'readonly' 'LC_ALL'

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

awk='awk'
git='git'

if "${git}" 'ls-files' '--error-unmatch' \
            '--' "${0}" >'/dev/null' 2>&1; then

  "${git}" 'tag' >"${0}.tmp"
  case "${?}" in
    '0')
      :
    ;;
    *)
      'cat' >&2 <<EOF2
${fr2}VERSION_LTCUR.sh!${fR2} ${fB2}${git}${fR2} failed while writing to: ${fB2}${0}.tmp${fR2}
EOF2
      'exit' '1'
    ;;
  esac

  c=`'eval' "${awk}"' '\\''
BEGIN {
  c = -1
}
{
  if ($0 ~ /^v[0-9][0-9]*[^0-9][^0-9]*[0-9][0-9]*/) {
    split($0, a, /[^0-9][^0-9]*/)
    xy = int(a[2]) "." int(a[3])
    if (!seen[xy]) {
      ++c
      seen[xy] = 1
    }
  }
}
END {
  if (c != -1) {
    print c
  }
}
'\\''' <"${0}.tmp"
`
  case "${?}" in
    '0')
      :
    ;;
    *)
      'cat' >&2 <<EOF2
${fr2}VERSION_LTCUR.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}VERSION_LTCUR.sh!${fR2}   1. ${fB2}${0}.tmp${fR2}
${fr2}VERSION_LTCUR.sh!${fR2} and writing to: a command substitution
EOF2
      'exit' '1'
    ;;
  esac

elif test '-f' 'VERSION_LTCUR'; then

  cat 'VERSION_LTCUR'
  case "${?}" in
    '0')
      :
    ;;
    *)
      'cat' >&2 <<EOF2
${fr2}VERSION_LTCUR.sh!${fR2} ${fB2}cat${fR2} failed while reading from:
${fr2}VERSION_LTCUR.sh!${fR2}   1. ${fB2}VERSION_LTCUR${fR2}
${fr2}VERSION_LTCUR.sh!${fR2} and writing to: standard output
EOF2
      'exit' '1'
    ;;
  esac

else

  'cat' >&2 <<EOF2
${fr2}VERSION_LTCUR.sh!${fR2} not in repository and ${fB2}VERSION_LTCUR${fR2} not found
EOF2
  'exit' '1'

fi

'exit' '1'

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
