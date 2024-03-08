#
# This file was generated by GATBPS 0.2.0-alpha.37+g25e2979, which was
# released on 2024-03-08. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: gatbps-gen-version.sh
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

#-----------------------------------------------------------------------
# gatbps_barf
#-----------------------------------------------------------------------
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_barf() {

  gatbps_barf_status=1
  case ${GATBPS_BARF_STATUS+x} in ?*)
    case ${GATBPS_BARF_STATUS?} in \
      [0-9] | \
      [1-9][0-9] | \
      1[0-9][0-9] | \
      2[0-4][0-9] | \
      25[0-5] \
    )
      gatbps_barf_status=${GATBPS_BARF_STATUS?}
    ;; *)
      gatbps_warn \
        "Ignoring invalid" \
        "GATBPS_BARF_STATUS:" \
        "\"${GATBPS_BARF_STATUS?}\"." \
      ;
    esac
  esac

  case $# in 0)
    set "Unknown error"
  esac

  gatbps_barf_message="$0: Error: $@."

  printf '%s\n' "${gatbps_barf_message?}" >&2

  exit ${gatbps_barf_status?}

}

#-----------------------------------------------------------------------
# gatbps_parse_opt
#-----------------------------------------------------------------------
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_parse_opt() {

  case $# in 0)
    gatbps_barf \
      "gatbps_parse_opt(): At least one <option> must be given." \
    ;
  esac

  case ${1?} in -? | --*)
    gatbps_parse_opt_prefix=
  ;; *)
    gatbps_parse_opt_prefix=${1?}
    case ${gatbps_parse_opt_prefix?} in *[!0-9A-Z_a-z]* | [0-9]*)
      gatbps_barf \
        "gatbps_parse_opt(): Invalid <prefix>: " \
        "${gatbps_parse_opt_prefix?}" \
      ;
    esac
    shift
  esac

  case $# in 0)
    gatbps_barf \
      "gatbps_parse_opt(): At least one <option> must be given." \
    ;
  esac

  gatbps_parse_opt_opts_n=0
  while :; do
    case $# in 0)
      break
    esac
    case ${1?} in -? | --*)
      eval gatbps_parse_opt_opts_${gatbps_parse_opt_opts_n?}='${1?}'
      gatbps_parse_opt_opts_n=`
        expr ${gatbps_parse_opt_opts_n?} + 1
      ` || exit $?
      shift
    ;; *)
      break
    esac
  done

  case ${gatbps_parse_opt_opts_n?} in 0)
    gatbps_barf \
      "gatbps_parse_opt(): At least one <option> must be given." \
    ;
  esac

  case $# in 0)
    gatbps_barf \
      "gatbps_parse_opt(): The argument list must be given." \
    ;
  esac

  case ${1?} in required | forbidden | permitted)
    gatbps_parse_opt_style=${1?}
    shift
  ;; *)
    gatbps_parse_opt_style=required
  esac

  case $# in 0)
    gatbps_barf \
      "gatbps_parse_opt(): The argument list must be given." \
    ;
  esac

  case ${1?} in :)
    shift
  ;; *)
    gatbps_barf \
      "gatbps_parse_opt(): Unexpected argument: ${1?}" \
    ;
  esac

  gatbps_parse_opt_opts_i=0

  while :; do

    case ${gatbps_parse_opt_opts_i?} in ${gatbps_parse_opt_opts_n?})
      break
    esac

    case $# in 0)
      break
    esac

    eval gatbps_parse_opt_opt=\$gatbps_parse_opt_opts_${gatbps_parse_opt_opts_i?}

    case ${1?} in "${gatbps_parse_opt_opt?}")
      eval ${gatbps_parse_opt_prefix?}got=:
      eval ${gatbps_parse_opt_prefix?}opt='${gatbps_parse_opt_opt?}'
      case ${gatbps_parse_opt_style?} in required)
        case $# in 1)
          gatbps_barf \
            "Option requires an argument: ${gatbps_parse_opt_opt?}" \
          ;
        esac
        eval ${gatbps_parse_opt_prefix?}arg='${2?}'
        eval ${gatbps_parse_opt_prefix?}pop=shift
      ;; *)
        unset ${gatbps_parse_opt_prefix?}arg
        eval ${gatbps_parse_opt_prefix?}pop=
      esac
      return
    esac

    case ${gatbps_parse_opt_opt?} in --*)

      case ${1?} in "${gatbps_parse_opt_opt?}"=*)
        case ${gatbps_parse_opt_style?} in forbidden)
          gatbps_barf \
            "Option forbids an argument: ${gatbps_parse_opt_opt?}" \
          ;
        esac
        gatbps_parse_opt_x='
          {
            if (seen_equals) {
              print;
            } else if (/=/) {
              seen_equals = 1;
              sub(/[^=]*=/, "");
              print;
            }
          }
        '
        gatbps_parse_opt_x=`eval " ${AWK:-awk}"' \
          "${gatbps_parse_opt_x?}" \
          <<gatbps_parse_opt_eof
${1?}
gatbps_parse_opt_eof
        '` || exit $?
        eval ${gatbps_parse_opt_prefix?}got=:
        eval ${gatbps_parse_opt_prefix?}opt='${gatbps_parse_opt_opt?}'
        eval ${gatbps_parse_opt_prefix?}arg='${gatbps_parse_opt_x?}'
        eval ${gatbps_parse_opt_prefix?}pop=
        return
      esac

    ;; *)

      case ${1?} in "${gatbps_parse_opt_opt?}"*)
        case ${gatbps_parse_opt_opt?} in '-
')
          gatbps_parse_opt_x='
            1 d
            s/'\''/&\\&&/g
            2 s/^/'\''/
            $ s/$/'\''/
          '
        ;; *)
          gatbps_parse_opt_x='
            1 s/^..//
            s/'\''/&\\&&/g
            1 s/^/'\''/
            $ s/$/'\''/
          '
        esac
        gatbps_parse_opt_x=`eval " ${SED:-sed}"' \
          "${gatbps_parse_opt_x?}" \
          <<gatbps_parse_opt_eof
${1?}
gatbps_parse_opt_eof
        '` || exit $?
        eval ${gatbps_parse_opt_prefix?}got=:
        eval ${gatbps_parse_opt_prefix?}opt='${gatbps_parse_opt_opt?}'
        case ${gatbps_parse_opt_style?} in forbidden)
          unset ${gatbps_parse_opt_prefix?}arg
          eval ${gatbps_parse_opt_prefix?}pop=\"'
            shift
            set x -${gatbps_parse_opt_x?} \"\$@\"
          '\"
        ;; *)
          eval ${gatbps_parse_opt_prefix?}arg=${gatbps_parse_opt_x?}
          eval ${gatbps_parse_opt_prefix?}pop=
        esac
        return
      esac

    esac

    gatbps_parse_opt_opts_i=`
      expr ${gatbps_parse_opt_opts_i?} + 1
    ` || exit $?

  done

  eval ${gatbps_parse_opt_prefix?}got=false
  unset ${gatbps_parse_opt_prefix?}opt
  unset ${gatbps_parse_opt_prefix?}arg
  eval ${gatbps_parse_opt_prefix?}pop=

}

#-----------------------------------------------------------------------
# gatbps_unknown_opt
#-----------------------------------------------------------------------
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_unknown_opt() {

  case $# in 1)
    :
  ;; *)
    gatbps_barf \
      "gatbps_unknown_opt(): Exactly one argument must be given." \
    ;
  esac

  case ${1?} in --*)

    printf '%s' "$0: Unknown option: " >&2

    sed '
      /=/ {
        s/=.*//
        q
      }
    ' <<gatbps_unknown_opt_eof >&2
${1?}
gatbps_unknown_opt_eof

    exit 1

  ;; -?*)

    printf '%s: Unknown option: %.2s\n' "$0" "${1?}" >&2

    exit 1

  esac

}

#-----------------------------------------------------------------------
# gatbps_warn
#-----------------------------------------------------------------------
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_warn() {

  case $# in 0)

    printf '%s\n' "$0: Warning: Unknown warning." >&2 || :

  ;; 1)

    printf '%s\n' "$0: Warning: ${1?}" >&2 || :

  ;; *)

    printf '%s' "$0: Warning: ${1?}" >&2 || :
    shift
    printf ' %s' "$@" >&2 || :
    echo >&2 || :

  esac

}


#-----------------------------------------------------------------------

readonly sh_quote_script="
  s/'/'\\\\''/g
  1 s/^/'/
  \$ s/\$/'/
"

parse_options=:

#-----------------------------------------------------------------------



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

# TODO: Support a scheme that's just a commit count. This is useful for
#       at least Gradle's versionCode field.

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

alpha=alpha
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

    # TODO: Add an --alpha option with a required value

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

case ${alpha?} in *[!a-z]*)
  gatbps_barf "Invalid --alpha: \"${alpha?}\""
esac
case ${alpha?} in ?*)
  alpha=${alpha?}.
esac
readonly alpha

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

  #
  # Note that --abbrev=n is needed to ensure that all versions of Git
  # produce the same output from git describe. The issue is that when
  # --abbrev=n is not given, newer versions of Git may be affected by
  # core.abbrev=auto to choose n > 7 by default, while older versions
  # tend to choose n = 7 by default.
  #

  x='describe'
  x=$x' --abbrev=7'
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
        $0 = $1 "." $2 "." $3 "-'${alpha?}'" $4 "+" $5
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
  x=$x' --abbrev=7'
  x=$x' --candidates=1'
  x=$x' --long'
  x=$x' --match="'$u_prefix'[0-9]*.[0-9]*.[0-9]*"'
  x=$x' --tags'
  u_description=`eval " $git $x"` || exit $?
  readonly u_description

  x='
    /^'$u_prefix''$num'\.'$num'\.'$num'-'$num'-g[0-9a-f]+?$/ {
      sub(/^'$u_prefix'/, "")
      if (/-g/) {
        gsub(/[-.]/, " ")
        $0 = $1 "." $2 "." $3 "-'${alpha?}'" $4 "+" $5
      }
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

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
