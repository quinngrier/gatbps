#
# This file was generated by GATBPS 0.1.0-5594+g0307717c, which was
# released on 2021-04-10. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: DATE.sh
#
# For more information, see the GATBPS manual.
#



#
# With LC_ALL=C, locale-aware programs use the C locale instead of the
# current locale. This is generally the best approach for code that is
# not deliberately designed to work in other locales, as other locales
# may have surprising behavior. The locale affects many programs, like
# awk, grep, sed, and this shell instance itself. For more information,
# see the C standard, the POSIX standard, and the GNU C Library manual.
#

LC_ALL=C
readonly LC_ALL
export LC_ALL

#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

readonly nl='
'

readonly sh_quote_script="
  s/'/'\\\\''/g
  1 s/^/'/
  \$ s/\$/'/
"

parse_options=:

unknown_option() {
  case $1 in

    --*)
      x="
        s/'/'\\\\''/g
        1 s/^/'/
        /=/ {
          s/=.*/'/
          q
        }
        \$ s/\$/'/
      "
      x=`sed "$x" <<EOF2
$1
EOF2
      ` || exit
      eval x="$x"
      cat <<EOF2 >&2
$0: unknown option: $x
EOF2
      exit 1
    ;;

    -"$nl"*)
      cat <<EOF2 >&2
$0: unknown option: -

EOF2
      exit 1
    ;;

    -?*)
      option=`head -c 2 <<EOF2
$1
EOF2
      ` || exit
      cat <<EOF2 >&2
$0: unknown option: $option
EOF2
      exit 1
    ;;

  esac
}



readonly git=" ${GIT:-git}"
readonly sed=" ${SED:-sed}"

if test -f build-aux/DATE; then

  date=`cat build-aux/DATE` || exit $?
  readonly date

elif test -f DATE; then

  date=`cat DATE` || exit $?
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
DATE.sh: no cache file or repository found
EOF2
  exit 1

fi

case $date in
  *[!0-9-]* | *-*-*-*)
    printf 'DATE.sh: invalid date: %s\n' "$date" >&2
    exit 1
  ;;
  *[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9])
  ;;
  *)
    printf 'DATE.sh: invalid date: %s\n' "$date" >&2
    exit 1
  ;;
esac

printf '%s\n' "$date" || exit

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
