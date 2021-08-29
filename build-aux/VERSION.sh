#
# This file was generated by GATBPS 0.1.0-5766+g0c83b0cb, which was
# released on 2021-08-29. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: VERSION.sh
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



awk=" ${AWK:-awk}"
readonly awk

git=" ${GIT:-git}"
readonly git

num='(0|[1-9][0-9]*)'
readonly num

v_prefix=v
u_prefix=u

# TODO: Support a mode where we don't do semver and instead just output
#       the most recent version number.

# TODO: v_prefix and u_prefix should be settable via options or
#       operands. Either --v-prefix and --u-prefix or <v_prefix>
#       [<u_prefix>] should be good.

readonly v_prefix
readonly u_prefix

case $v_prefix in '' \
    | *[!-0-9A-Z_a-z]* | [-0-9_]* | *[-_][-_]* | *[-_])
  printf '%s\n' "Invalid --v-prefix value: $v_prefix" >&2
  exit 1
esac

case $u_prefix in '' \
    | *[!-0-9A-Z_a-z]* | [-0-9_]* | *[-_][-_]* | *[-_])
  printf '%s\n' "Invalid --u-prefix value: $u_prefix" >&2
  exit 1
esac

case $v_prefix in v)
  v_suffix=
;; *)
  v_suffix=.$v_prefix
esac
readonly v_suffix

if test -f build-aux/VERSION$v_suffix; then

  cat build-aux/VERSION$v_suffix || exit $?

elif test -f VERSION$v_suffix; then

  cat VERSION$v_suffix || exit $?

elif eval "$git"' ls-files --error-unmatch "$0"' >/dev/null 2>&1; then

  x='describe'
  x=$x' --candidates=1'
  x=$x' --match="'$v_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  v_description=`eval "$git $x"` || exit $?
  readonly v_description

  x='
    /^'$v_prefix''$num'\.'$num'\.'$num'(-'$num'-g[0-9a-f]+)?$/ {
      sub(/^'$v_prefix'/, "")
      if (/-g/) {
        gsub(/[-.]/, " ")
        $3 = $3 + 1
        $0 = $1 "." $2 "." $3 "-" $4 "+" $5
      }
      print
    }
  '
  v_result=`eval "$awk"' "$x"' <<EOF2
$v_description
EOF2
  ` || exit $?
  readonly v_result

  case $v_result in '')
    printf '%s\n' "$0: Invalid v description: $v_description" >&2
    exit 1
  ;; *-*)
    :
  ;; *)
    printf '%s\n' "$v_result" || exit $?
    exit 0
  esac

  x='describe'
  x=$x' --always'
  x=$x' --abbrev=0'
  x=$x' --candidates=1'
  x=$x' --match="'$u_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  u_tag=`eval "$git $x"` || exit $?
  readonly u_tag

  case $u_tag in *.*)
    :
  ;; *)
    printf '%s\n' "$v_result" || exit $?
    exit 0
  esac

  x='describe'
  x=$x' --abbrev=0'
  x=$x' --candidates=1'
  x=$x' --match="'$v_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  v_tag=`eval "$git $x"` || exit $?
  readonly v_tag

  eval "$git"' merge-base --is-ancestor "$v_tag" "$u_tag"'
  s=$?
  case $s in 0)
    :
  ;; 1)
    printf '%s\n' "$v_result" || exit $?
    exit 0
  ;; *)
    exit $s
  esac

  x='describe'
  x=$x' --candidates=1'
  x=$x' --long'
  x=$x' --match="'$u_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  u_description=`eval "$git $x"` || exit $?
  readonly u_description

  x='
    /^'$u_prefix''$num'\.'$num'\.'$num'-'$num'-g[0-9a-f]+?$/ {
      sub(/^'$u_prefix'/, "")
      sub(/-g/, "+g")
      print
    }
  '
  u_result=`eval "$awk"' "$x"' <<EOF2
$u_description
EOF2
  ` || exit $?
  readonly u_result

  case $u_result in '')
    printf '%s\n' "$0: Invalid u description: $u_description" >&2
    exit 1
  esac

  printf '%s\n' "$u_result" || exit $?

else

  cat <<EOF2 >&2
$0: no cache file or repository found
EOF2
  exit 1

fi

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
