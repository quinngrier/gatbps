changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/echo.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
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

set -e
trap 'rm -f VERSION.tmp' EXIT
if git ls-files --error-unmatch "${0}" >/dev/null 2>&1; then
  git describe --always --match='v[0-9]*' --tags >VERSION.tmp
  x=$(sed s/^v// VERSION.tmp)
  echo "$x"
elif test -f VERSION; then
  cat VERSION
else
  echo 'VERSION.sh: not in repository and VERSION not found' >&2
  exit 1
fi

|%}footer_comment({%|#|%}, {%|#|%}, {%|#|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl