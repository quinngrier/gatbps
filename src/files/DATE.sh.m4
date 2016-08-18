changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/DATE.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: DATE.sh
#
# For more information, see the GATBPS manual.
#

#
# This script (DATE.sh) helps to create an (AC_)PACKAGE_DATE variable
# for Autotools by using git log to get the UTC author date of HEAD in
# YYYY-MM-DD format. Add this script to your repository and adjust the
# following code for your configure.ac and Makefile.am files:
#
#   m4_define([AC_PACKAGE_DATE],
#             m4_esyscmd_s([sh DATE.sh])m4_assert(m4_sysval == 0))
#   AC_SUBST([PACKAGE_DATE], 'AC_PACKAGE_DATE')
#   AC_DEFINE([PACKAGE_DATE], "AC_PACKAGE_DATE")
#
#   EXTRA_DIST += $(srcdir)/DATE
#   EXTRA_DIST += $(srcdir)/DATE.sh
#
# When running in your repository, the script uses git log.
# Elsewhere, the script reads the
# DATE file.
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
trap 'rm -f DATE.tmp' EXIT
if git ls-files --error-unmatch "${0}" >/dev/null 2>&1; then
  TZ=UTC git log -1 --date=local --pretty=%ad >DATE.tmp
  x=$(sed 's/... \(...\) \(.*\) ..:..:.. \(....\)/\3-\1-\2/
           s/Jan/01/; s/Feb/02/; s/Mar/03/; s/Apr/04/
           s/May/05/; s/Jun/06/; s/Jul/07/; s/Aug/08/
           s/Sep/09/; s/Oct/10/; s/Nov/11/; s/Dec/12/
           s/-\(.\)$/-0\1/' DATE.tmp)
  echo "$x"
elif test -f DATE; then
  cat DATE
else
  echo 'DATE.sh: not in repository and DATE not found' >&2
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
