changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CP-m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CP.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CP], [[{

#
# The block that contains this comment is an expansion of the GATBPS_CP
# macro.
#]dnl
m4_case(
  [$#],
  [2], [],
  [3], [],
  [gatbps_fatal([
    GATBPS_CP requires exactly 2 or 3 arguments
  ])])[]dnl
m4_if(
  [$1],
  [],
  [gatbps_fatal([
    GATBPS_CP requires its first argument to be nonempty
  ])])[]dnl
m4_if(
  [$2],
  [],
  [gatbps_fatal([
    GATBPS_CP requires its second argument to be nonempty
  ])])[]dnl
m4_case(
  [$3],
  [], [],
  [r], [],
  [x], [],
  [gatbps_fatal([
    GATBPS_CP requires its third argument to be either empty, the 'r'
    character, or the 'x' character
  ])])[]dnl
[

case "$][{GATBPS_CP_RULES}" in
  ?*)
    GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"'

'
  ;;
esac

GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"\
'']$1[': ']$2['
	$][(GATBPS_V_CP)'\'':'\''
	$][(AM@&t@_V_at){ \
  x=']$2['; \
  if '\''test'\'' '\''-f'\'' "$][$][{x}"; then \
    d='\''.'\''; \
  else \
    d=$][(srcdir); \
    case "$][$][{d}" in \
      '\''-'\''*) \
        d='\''./'\''"$][$][{d}"; \
      ;; \
    esac; \
  fi; \
  '\''cp'\'' \]dnl
m4_if(
  [$3],
  [r],
  [[
    '\''-R'\'' \]])[
    "$][$][{d}"'\''/'\''"$][$][{x}" \
    '\''./'\''']$1[' \
  || '\''exit'\'' "$][$][{?}"; \]dnl
m4_if(
  [$3],
  [x],
  [[
  '\''chmod'\'' \
    '\''a+x'\'' \
    '\''./'\''']$1[' \
  || '\''exit'\'' "$][$][{?}"; \]])[
  '\''exit'\'' '\''0'\''; \
:;}

clean-']$1[':
	-'\''rm'\'' \
  '\''-f'\'' \]dnl
m4_if(
  [$3],
  [r],
  [[
  '\''-r'\'' \]])[
  '\''./'\''']$1[' \
;

clean-local: clean-']$1[''

:;}]])[]dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
