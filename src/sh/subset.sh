#! /bin/sh -
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

LC_ALL=C
readonly LC_ALL
export LC_ALL

# :r !subset.sh gatbps_barf gatbps_parse_opt gatbps_unknown_opt

#-----------------------------------------------------------------------
# gatbps_barf
#-----------------------------------------------------------------------
#
# The authors of this function have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_barf() {

  case $# in 0)

    printf '%s\n' "$0: Error: Unknown error." >&2

  ;; 1)

    printf '%s\n' "$0: Error: ${1?}" >&2

  ;; *)

    printf '%s' "$0: Error: ${1?}" >&2
    shift
    printf ' %s' "$@" >&2
    echo >&2

  esac

  exit 1

}

#-----------------------------------------------------------------------
# gatbps_parse_opt
#-----------------------------------------------------------------------
#
# The authors of this function have waived all copyright and
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
          sst_barf \
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
          sst_barf \
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
# The authors of this function have waived all copyright and
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

awk=${AWK:-awk}
readonly awk

adjust_notice='
  {
    if (!r1 && /^# The authors of this file have waived all copyright and$/) {
      sub(/this file/, "this function");
      r1 = 1;
    }
    print;
  }
'
readonly adjust_notice

find_deps='
  BEGIN {
    seen[x] = 1;
  }
  /gatbps_/ {
    while ((i = match($0, /gatbps_/)) > 0) {
      $0 = substr($0, i);
      i = match($0, /[^0-9A-Z_a-z]/);
      if (i == 0) {
        y = $0;
        if (!seen[y]) {
          print y;
        }
        break;
      }
      y = substr($0, 1, i - 1);
      if (!seen[y]) {
        print y;
      }
      $0 = substr($0, i);
    }
  }
'
readonly find_deps

# Set d to be a safe path to the include directory.
case $0 in /* | ./*)
  d=$0
;; *)
  d=./$0
esac
r='\(.*/\)'
d=`expr "x${d?}" : "x${r?}"`include || exit $?
readonly d

seen_once=
seen_twice=

# TODO: Parse options.

nonempty_output=false

case $# in 0)
  set x
;; *)
  set x "$@"
esac

until shift && (exit ${1+1}0); do

  x=${1?}

  case ${x?} in [!A-Z_a-z]* | *[!0-9A-Z_a-z]*)
    gatbps_barf "Invalid function name: ${x?}"
  ;; gatbps_*)
    :
  ;; *)
    gatbps_barf "Invalid function name: ${x?}"
  esac

  f=${d?}/${x?}.sh

  test -f "${f?}" || {
    s=$?
    case ${s?} in 1)
      continue
    ;; *)
      exit ${s?}
    esac
  }

  case ${seen_twice?} in *" ${x?} "*)
    continue
  esac

  case ${seen_once?} in *" ${x?} "*)
    eval " ${awk?}"' "${adjust_notice?}" <"${f?}"' || exit $?
    echo || exit $?
    nonempty_output=:
    seen_twice="${seen_twice?} ${x?} "
    continue
  esac

  xs=`eval " ${awk?}"' -v x=${x?} "${find_deps?}" <"${f?}"'` || exit $?
  set x ${xs?} "$@"
  seen_once="${seen_once?} ${x?} "

done

if ${nonempty_output?}; then
  cat <<'EOF' || exit $?
#-----------------------------------------------------------------------
EOF
fi
