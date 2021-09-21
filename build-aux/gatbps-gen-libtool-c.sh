#
# This file was generated by GATBPS 0.1.0-5814+gefd1dd4f, which was
# released on 2021-09-21. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: gatbps-gen-libtool-c.sh
#
# For more information, see the GATBPS manual.
#



#-----------------------------------------------------------------------
# Locale
#-----------------------------------------------------------------------
#
# With LC_ALL=C, locale-aware programs use the C locale instead of the
# current locale. This is generally the best approach for code that is
# not deliberately designed to work in other locales, as other locales
# may have surprising behavior. The locale affects many programs, like
# awk, grep, sed, and this shell instance itself. For more information,
# see the C standard, the POSIX standard, and the GNU C Library manual.
#

LC_ALL=C
export LC_ALL

#-----------------------------------------------------------------------
# Newline characters
#-----------------------------------------------------------------------
#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'
readonly nl

#-----------------------------------------------------------------------
# gatbps_barf
#-----------------------------------------------------------------------

gatbps_barf() {
  case $# in 0)
    printf '%s\n' "$0: Error: Unknown error." >&2
  ;; 1)
    printf '%s\n' "$0: Error: $1" >&2
  ;; *)
    printf '%s' "$0: Error: $1" >&2
    shift
    printf ' %s' "$@" >&2
    echo >&2
  esac
  exit 1
}

#-----------------------------------------------------------------------

readonly sh_quote_script="
  s/'/'\\\\''/g
  1 s/^/'/
  \$ s/\$/'/
"

parse_options=:

gatbps_unknown_opt() {
  case $1 in --*)
    printf '%s' "$0: Unknown option: " >&2
    sed '
      /=/ {
        s/=.*//
        q
      }
    ' <<EOF2 >&2
$1
EOF2
    exit 1
  ;; -?*)
    printf '%s: Unknown option: %.2s\n' "$0" "$1" >&2
    exit 1
  esac
}

#-----------------------------------------------------------------------



readonly awk=" ${AWK:-awk}"
readonly git=" ${GIT:-git}"
readonly sed=" ${SED:-sed}"
readonly uniq=" ${UNIQ:-uniq}"

cache=$0.cache

if test -f "$cache"; then

  cat <"$cache" || exit $?

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
gatbps-gen-libtool-c.sh: no cache file or repository found
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
