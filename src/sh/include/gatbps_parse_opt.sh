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
