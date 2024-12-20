#
# This file was generated by GATBPS 0.2.0-alpha.171+g12ad8a7, which was
# released on 2024-12-12. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: gatbps-echo.sh
#
# For more information, see the GATBPS manual.
#

# TODO: We could support quoting for languages other than sh, like for
# awk for example, via syntax like sh gatbps-echo.sh --awk -q. Then we can
# remove awk-form.sh and any other *-form.sh scripts. Make sure to also
# support --sh for consistency. And maybe something like -Q to reset
# quoting_level back to 0.



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



SED=${SED:-sed}
readonly SED

quoting_level=0
first_operand=:
output=

process_operand() {

  if $first_operand; then
    first_operand=false
  else
    output=$output' '
  fi

  case $quoting_level in
    -* | 0)
      output=$output$1
    ;;
    1)
      case $1 in
        '' | *[!+./0-9:=A-Z_a-z-]*)
          output=$output`eval " $SED"' "$sh_quote_script" <<EOF2
$1
EOF2
          '` || exit
        ;;
        *)
          output=$output$1
        ;;
      esac
    ;;
    *)
      output=$output`eval " $SED"' "$sh_quote_script" <<EOF2
$1
EOF2
      '` || exit
    ;;
  esac

}

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

    gatbps_parse_opt -- forbidden : "$@"
    eval "$pop"
    if $got; then
      parse_options=false
      continue
    fi

    #-------------------------------------------------------------------
    # -, --stdin
    #-------------------------------------------------------------------

    case ${1?} in -)
      got=:
    ;; *)
      gatbps_parse_opt --stdin forbidden : "$@"
      eval "$pop"
    esac
    if $got; then
      x=`cat && echo x` || exit
      x=${x%x}
      x=${x%"$nl"}
      process_operand "$x"
      continue
    fi

    #-------------------------------------------------------------------
    # -q, --quote
    #-------------------------------------------------------------------

    gatbps_parse_opt -q --quote forbidden : "$@"
    eval "$pop"
    if $got; then
      quoting_level=`expr $quoting_level + 1` || exit
      continue
    fi

    #-------------------------------------------------------------------
    # Unknown options
    #-------------------------------------------------------------------

    gatbps_unknown_opt "${1-}"

    #-------------------------------------------------------------------

  fi

  process_operand "$1"

done

cat <<EOF2 || exit
$output
EOF2

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
