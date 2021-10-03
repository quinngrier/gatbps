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

until (exit ${1+1}0); do

  if $parse_options; then
    case $1 in

      #-----------------------------------------------------------------
      # --
      #-----------------------------------------------------------------

      --)
        parse_options=false
        shift
        continue
      ;;

      --=*)
        cat <<EOF2 >&2
${fr2}gatbps-echo.sh!${fR2} ${fB2}--${fR2} forbids a value
${fr2}gatbps-echo.sh!${fR2} try ${fB2}sh gatbps-echo.sh --help${fR2} for more information
EOF2
        exit 1
      ;;

      #-----------------------------------------------------------------
      # -, --stdin
      #-----------------------------------------------------------------

      - | --stdin)
        x=`cat && echo x` || exit
        x=${x%x}
        x=${x%"$nl"}
        process_operand "$x"
        shift
        continue
      ;;

      --stdin=*)
        cat <<EOF2 >&2
${fr2}gatbps-echo.sh!${fR2} ${fB2}--stdin${fR2} forbids a value
EOF2
        exit 1
      ;;

      #-----------------------------------------------------------------
      # -q, --quote
      #-----------------------------------------------------------------

      -q | --quote)
        quoting_level=`expr $quoting_level + 1` || exit
        shift
        continue
      ;;

      -q*)
        x=-${1#-q}
        shift
        set x -q "$x" "$@"
        shift
        continue
      ;;

      --quote=*)
        cat <<EOF2 >&2
${fr2}gatbps-echo.sh!${fR2} ${fB2}--quote${fR2} forbids a value
EOF2
        exit 1
      ;;

      #-----------------------------------------------------------------
      # unknown option
      #-----------------------------------------------------------------

      *)
        gatbps_unknown_opt "$1"
      ;;

      #-----------------------------------------------------------------

    esac
  fi

  process_operand "$1"

  shift

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
