changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps-echo.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
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

|%}sh_prelude{%|

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
