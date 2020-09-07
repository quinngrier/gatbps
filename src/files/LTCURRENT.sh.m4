changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/LTCURRENT.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/declare_detect_options.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/use_the_c_locale.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: LTCURRENT.sh
#
# For more information, see the GATBPS manual.
#

|%}use_the_c_locale{%|

awk=" ${AWK:-awk}"
readonly awk

git=" ${GIT:-git}"
readonly git

sed=" ${SED:-sed}"
readonly sed

uniq=" ${UNIQ:-uniq}"
readonly uniq

file=${1-LTCURRENT}
readonly file

if test -f "$file"; then

  cat <"$file" || exit $?

elif eval "$git"' ls-files --error-unmatch "$0"' >/dev/null 2>&1; then

  x=`eval "$git"' tag -l "v[0-9]*.[0-9]*.[0-9]*"'` || exit $?

  x=`eval "$sed"' "s/\\.[^.]*\$//"' <<EOF2
$x
EOF2
  ` || exit $?

  x=`eval "$uniq" <<EOF2
$x
EOF2
  ` || exit $?

  eval "$awk"' "END { print NR - 1 }"' <<EOF2 || exit $?
$x
EOF2

else

  cat <<EOF2 >&2
LTCURRENT.sh: no LTCURRENT file and no repository
EOF2
  exit 1

fi

exit 0

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
