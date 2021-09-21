changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps-gen-version.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: gatbps-gen-version.sh
#
# For more information, see the GATBPS manual.
#

|%}sh_prelude{%|

awk=${AWK:-awk}
readonly awk

git=${GIT:-git}
readonly git

sed=${SED:-sed}
readonly sed

num='(0|[1-9][0-9]*)'
readonly num

# TODO: Support a scheme where we don't do semver and instead just
#       output the most recent version number.

if test -f "$0.args"; then
  s='
    {
      if (dump || !/^[ 	]*(#.*)*$/) {
        print;
        dump = 1;
      }
    }
  '
  x=`eval " $awk"' "$s" <"$0.args"'` || exit $?
  case $# in 0)
    eval "set x $x" || exit $?
  ;; *)
    eval "set x \"\$@\" $x" || exit $?
  esac
  shift
fi

#-----------------------------------------------------------------------

unset scheme
unset scheme_implicitly

set_scheme() {
  case $1 in '')
    case ${scheme+x} in '')
      scheme=semver
      scheme_implicitly='implicitly '
      readonly scheme
      readonly scheme_implicitly
    esac
  ;; *)
    case ${scheme+x} in '')
      scheme=$1
      readonly scheme
      readonly scheme_implicitly
    ;; *)
      case $scheme in $1)
        :
      ;; *)
        gatbps_barf \
          "--$1 was given, but the scheme was already" \
          "${scheme_implicitly-}set to --$scheme." \
        ;
      esac
    esac
  esac
}

#-----------------------------------------------------------------------

unsupported_scheme_and_datum() {
  gatbps_barf \
    "Unsupported scheme and datum combination: --$scheme --$datum" \
  ;
}

#-----------------------------------------------------------------------

unset datum
unset datum_implicitly

set_datum() {
  set_scheme
  case $1 in '')
    case ${datum+x} in '')
      datum=default
      datum_implicitly='implicitly '
      readonly datum
      readonly datum_implicitly
    esac
  ;; *)
    case ${datum+x} in '')
      datum=$1
      readonly datum
      readonly datum_implicitly
      case $scheme:$datum in : \
        | semver:default \
        | semver:docker \
      )
        :
      ;; *)
        unsupported_scheme_and_datum
      esac
    ;; *)
      case $datum in $1)
        :
      ;; *)
        gatbps_barf \
          "--$1 was given, but the datum was already" \
          "${datum_implicitly-}set to --$datum." \
        ;
      esac
    esac
  esac
}

#-----------------------------------------------------------------------

print_semver() {
  case $datum in default)
    printf '%s\n' "$1" || exit $?
  ;; docker)
    print_semver_x='s/[+].*//'
    eval " $sed"' "$print_semver_x"' <<EOF2 || exit $?
$1
EOF2
  ;; *)
    gatbps_barf \
      "print_semver(): Unexpected datum: $datum" \
    ;
  esac
}

#-----------------------------------------------------------------------

unset v_prefix
unset u_prefix

parse_options=:
case $# in 0)
  set x
;; *)
  set x "$@"
esac
until shift && (exit ${1+1}0); do

  if $parse_options; then

    #-------------------------------------------------------------------
    # Options terminator
    #-------------------------------------------------------------------

    case $1 in --)

      parse_options=false
      continue

    ;; --=*)

      printf '%s\n' "$0: Option forbids an argument: --" >&2
      exit 1

    #-------------------------------------------------------------------
    # --docker
    #-------------------------------------------------------------------

    ;; --docker)

      set_datum docker
      continue

    ;; --docker=*)

      gatbps_barf "Option forbids an argument: --docker"

    #-------------------------------------------------------------------
    # --help
    #-------------------------------------------------------------------

    ;; --help)

      cat <<EOF || exit $?
Usage: $0 [--semver] [--docker] [<v_prefix=v> <u_prefix=u>]
EOF

      exit 0

    ;; --help=*)

      printf '%s\n' "$0: Option forbids an argument: --help" >&2
      exit 1

    #-------------------------------------------------------------------
    # --semver
    #-------------------------------------------------------------------

    ;; --semver)

      set_scheme semver
      continue

    ;; --semver=*)

      gatbps_barf "Option forbids an argument: --semver"

    #-------------------------------------------------------------------
    # Unknown options
    #-------------------------------------------------------------------

    ;; --*)

      printf '%s' "$0: Unknown option: " >&2
      sed -n '
        /=/ {
          s/=.*//
          p
          q
        }
        p
      ' <<EOF >&2
$1
EOF
      exit 1

    ;; -?*)

      printf '%s: Unknown option: %.2s\n' "$0" "$1" >&2
      exit 1

    #-------------------------------------------------------------------

    esac
  fi

  set_datum

  case $scheme:$datum in : \
    | semver:default \
    | semver:docker \
  )
    if ${v_prefix+false} :; then
      v_prefix=$1
    elif ${u_prefix+false} :; then
      u_prefix=$1
    else
      gatbps_barf "Too many operands: $1"
    fi
  ;; *)
    unsupported_scheme_and_datum
  esac

done
readonly parse_options

set_datum

if ${v_prefix+:} false; then
  if ${u_prefix+:} false; then
    :
  else
    printf '%s\n' `
      `"$0: <u_prefix> must be given if <v_prefix> is given."`
    ` >&2
    exit 1
  fi
else
  v_prefix=v
  u_prefix=u
fi
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

if test -f "$0.cache"; then

  cat <"$0.cache" || exit $?

elif eval " $git"' ls-files --error-unmatch "$0"' >/dev/null 2>&1; then

  x='describe'
  x=$x' --candidates=1'
  x=$x' --match="'$v_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  v_description=`eval " $git $x"` || exit $?
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
  v_result=`eval " $awk"' "$x"' <<EOF2
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
    print_semver "$v_result"
    exit 0
  esac

  x='describe'
  x=$x' --always'
  x=$x' --abbrev=0'
  x=$x' --candidates=1'
  x=$x' --match="'$u_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  u_tag=`eval " $git $x"` || exit $?
  readonly u_tag

  case $u_tag in *.*)
    :
  ;; *)
    print_semver "$v_result"
    exit 0
  esac

  x='describe'
  x=$x' --abbrev=0'
  x=$x' --candidates=1'
  x=$x' --match="'$v_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  v_tag=`eval " $git $x"` || exit $?
  readonly v_tag

  eval " $git"' merge-base --is-ancestor "$v_tag" "$u_tag"'
  s=$?
  case $s in 0)
    :
  ;; 1)
    print_semver "$v_result"
    exit 0
  ;; *)
    exit $s
  esac

  x='describe'
  x=$x' --candidates=1'
  x=$x' --long'
  x=$x' --match="'$u_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  u_description=`eval " $git $x"` || exit $?
  readonly u_description

  x='
    /^'$u_prefix''$num'\.'$num'\.'$num'-'$num'-g[0-9a-f]+?$/ {
      sub(/^'$u_prefix'/, "")
      sub(/-g/, "+g")
      print
    }
  '
  u_result=`eval " $awk"' "$x"' <<EOF2
$u_description
EOF2
  ` || exit $?
  readonly u_result

  case $u_result in '')
    printf '%s\n' "$0: Invalid u description: $u_description" >&2
    exit 1
  esac

  print_semver "$u_result"

else

  gatbps_barf "No cache file or repository found."

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
