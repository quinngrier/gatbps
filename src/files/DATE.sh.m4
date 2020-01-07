changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/DATE.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/use_the_c_locale.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: DATE.sh
#
# For more information, see the GATBPS manual.
#

|%}use_the_c_locale{%|

readonly git=${GIT:=git}
readonly sed=${SED:=sed}

if test -f DATE; then

  cat DATE || exit

elif eval "$git"' ls-files --error-unmatch "$0" >/dev/null 2>&1'; then

  trap "rm -f DATE" EXIT
  eval "TZ=UTC $git log -1 --pretty=%ad --date=local >DATE" || exit
  # example: Sun Dec 29 07:32:33 2019
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
  eval "$sed"' "$script" DATE' || exit

else

  echo "DATE.sh: no DATE file and no repository" >&2
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
