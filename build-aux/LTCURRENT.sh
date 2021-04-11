#
# This file was generated by GATBPS 0.1.0-5609+g47a26154, which was
# released on 2021-04-11. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: LTCURRENT.sh
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



readonly awk=" ${AWK:-awk}"
readonly git=" ${GIT:-git}"
readonly sed=" ${SED:-sed}"
readonly uniq=" ${UNIQ:-uniq}"

if test -f build-aux/LTCURRENT; then

  cat build-aux/LTCURRENT || exit $?

elif test -f LTCURRENT; then

  cat LTCURRENT || exit $?

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
LTCURRENT.sh: no cache file or repository found
EOF2
  exit 1

fi

exit 0

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
