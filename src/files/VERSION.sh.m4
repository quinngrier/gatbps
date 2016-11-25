changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/VERSION.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/use_the_c_locale.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: VERSION.sh
#
# For more information, see the GATBPS manual.
#

#
# This script (VERSION.sh) helps to create a version string for
# Autotools by using git describe to get the description of HEAD with
# respect to tags that begin with "v" and a digit. Add this script to
# your repository and adjust the following code for your configure.ac
# and Makefile.am files:
#
#   AC_INIT([Example],
#           m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0))
#
#   EXTRA_DIST += $(srcdir)/VERSION
#   EXTRA_DIST += $(srcdir)/VERSION.sh
#
# When running in your repository, the script uses git describe.
# Elsewhere, the script reads the
# VERSION file.
#

|%}use_the_c_locale{%|

#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'
'readonly' 'nl'

set -e
if git ls-files --error-unmatch "${0}" >/dev/null 2>&1; then
  v_description=`
    git \
      'describe' \
      '--exact-match' \
      '--match' \
      'v[0-9]*' \
      '--tags' \
    ;
  `
  case "${?}" in
    '0')
    ;;
    *)
      'exit' '1'
    ;;
  esac
  'readonly' 'v_description'
  case "${v_description}" in
    ?*)
      sed 's/^v//' <<EOF2
${v_description}
EOF2
      case "${?}" in
        '0')
        ;;
        *)
          'exit' '1'
        ;;
      esac
    ;;
    *)
      u_description=`
        git \
          'describe' \
          '--first-parent' \
          '--match' \
          'u[0-9]*' \
          '--tags' \
        ;
      `
      case "${?}" in
        '0')
        ;;
        *)
          'exit' '1'
        ;;
      esac
      'readonly' 'u_description'
      sed '
        s/^u//
        s/-g/+g/
      ' <<EOF2
${u_description}
EOF2
      case "${?}" in
        '0')
        ;;
        *)
          'exit' '1'
        ;;
      esac
    ;;
  esac
elif test -f VERSION; then
  cat VERSION
else
  echo 'VERSION.sh: not in repository and VERSION not found' >&2
  exit 1
fi

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
