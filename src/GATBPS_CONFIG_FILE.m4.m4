changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/header.m4|%})dnl
header({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CONFIG_FILE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CONFIG_FILE], [{ :

  m4_case(
    [$#],
    [1], [],
    [2], [],
    [3], [],
    [4], [],
    [m4_fatal([GATBPS_CONFIG_FILE requires 1 to 4 arguments])])

  m4_pushdef([gatbps_output], m4_bpatsubst([$1], [:.*]))
  m4_pushdef([gatbps_inputs], m4_bpatsubst([$1], [^[^:]*]))
  m4_pushdef([gatbps_inputs], m4_ifval(gatbps_inputs, [gatbps_inputs], [:gatbps_output.in]))

  m4_pushdef([gatbps_suffix], m4_if([$#], [1], [.out], [$2]))

  AC_CONFIG_FILES(
    gatbps_output[]gatbps_suffix[]gatbps_inputs,
    [{ :
      gatbps_dst=']gatbps_output['
      case "$[]{gatbps_dst}" in
      #(
        '-'*)
          gatbps_safe_dst="./$[]{gatbps_dst}"
        ;;
      #(
        *)
          gatbps_safe_dst="$[]{gatbps_dst}"
        ;;
      esac
      gatbps_safe_src="$[]{gatbps_safe_dst}"']gatbps_suffix['
      if cmp "$[]{gatbps_safe_src}" \
             "$[]{gatbps_safe_dst}" >'/dev/null' 2>&1; then
        AC_MSG_NOTICE([skipping $[]{gatbps_dst}])
      else
        AC_MSG_NOTICE([updating $[]{gatbps_dst}])
        cp "$[]{gatbps_safe_src}" "$[]{gatbps_safe_dst}"
        case "${?}" in
        #(
          '0')
            :
          ;;
        #(
          *)
            exit 1
          ;;
        esac
        $3
      fi
    }],
    [$4])

  case "$[]{GATBPS_CONFIG_FILE_FILES}" in
  #(
    ?*)
      GATBPS_CONFIG_FILE_FILES="$[]{GATBPS_CONFIG_FILE_FILES}"' \
  gatbps_output'
    ;;
  #(
    *)
      GATBPS_CONFIG_FILE_FILES='\
  gatbps_output'
    ;;
  esac

  case "$[]{GATBPS_CONFIG_FILE_RULES}" in
  #(
    ?*)
      GATBPS_CONFIG_FILE_RULES="$[]{GATBPS_CONFIG_FILE_RULES}"'

gatbps_output: gatbps_output[]gatbps_suffix
	@:'
    ;;
  #(
    *)
      GATBPS_CONFIG_FILE_RULES='gatbps_output: gatbps_output[]gatbps_suffix
	@:'
    ;;
  esac

  m4_popdef([gatbps_suffix])
  m4_popdef([gatbps_inputs])
  m4_popdef([gatbps_inputs])
  m4_popdef([gatbps_output])

}])dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl|%}
