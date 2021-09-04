changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps-gen-date.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: gatbps-gen-date.sh
#
# For more information, see the GATBPS manual.
#

|%}sh_prelude{%|

readonly git=" ${GIT:-git}"
readonly sed=" ${SED:-sed}"

cache=$0.cache

if test -f "$cache"; then

  date=`cat <"$cache"` || exit $?
  readonly date

elif eval "$git"' ls-files --error-unmatch "$0"' >/dev/null 2>&1; then

  # Example: "Sun Dec 29 07:32:33 2019".
  d=`eval "TZ=UTC $git log -1 --pretty=%ad --date=local"` || exit
  readonly d

  # Example: "Sun Dec 29 07:32:33 2019" becomes "2019-12-29".
  readonly script='
    s/.* \(.*\) \(.*\) .* \(.*\)/\3-\1-\2/
    s/-\(.\)$/-0\1/
    s/Jan/01/
    s/Feb/02/
    s/Mar/03/
    s/Apr/04/
    s/May/05/
    s/Jun/06/
    s/Jul/07/
    s/Aug/08/
    s/Sep/09/
    s/Oct/10/
    s/Nov/11/
    s/Dec/12/
  '

  date=`
    eval "$sed" '"$script" <<EOF2
$d
EOF2
    '
  ` || exit
  readonly date

else

  cat <<EOF2 >&2
gatbps-gen-date.sh: no cache file or repository found
EOF2
  exit 1

fi

case $date in
  *[!0-9-]* | *-*-*-*)
    printf 'gatbps-gen-date.sh: invalid date: %s\n' "$date" >&2
    exit 1
  ;;
  *[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9])
  ;;
  *)
    printf 'gatbps-gen-date.sh: invalid date: %s\n' "$date" >&2
    exit 1
  ;;
esac

printf '%s\n' "$date" || exit

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
