dnl
dnl This file was generated by GATBPS 0.0.0-3560-g51000dd, which was
dnl released on 2016-08-12. Before changing it, make sure
dnl you're doing the right thing. Depending on how GATBPS
dnl is being used, your changes may be automatically lost.
dnl A short description of this file follows.
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
  m4_bregexp([$1], [^[-./0-9A-Z_a-z]+$]),
  [-1],
  [gatbps_fatal([
    GATBPS_CP requires its first argument to match the following regular
    expression: ^[-./0-9A-Z_a-z]+$
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [^[-./0-9A-Z_a-z]+$]),
  [-1],
  [gatbps_fatal([
    GATBPS_CP requires its second argument to match the following
    regular expression: ^[-./0-9A-Z_a-z]+$
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
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[$1]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[$2]], ['], ['\\'']))[]dnl
m4_pushdef(
  [target_sh_sh],
  m4_bpatsubst([[$1]], ['], ['\\''\\'\\'''\\'']))[]dnl
m4_pushdef(
  [source_sh_sh],
  m4_bpatsubst([[$2]], ['], ['\\''\\'\\'''\\'']))[]dnl
[

case "$][{GATBPS_CP_RULES}" in
  ?*)
    GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"'

'
  ;;
esac

GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"\
']target_sh[: ]source_sh[
	$][(GATBPS_V_CP)'\'':'\''
	$][(AM@&t@_V_at){ \
  x='\'']source_sh_sh['\''; \
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
    '\''./]target_sh_sh['\'' \
  || '\''exit'\'' "$][$][{?}"; \]dnl
m4_if(
  [$3],
  [x],
  [[
  '\''chmod'\'' \
    '\''a+x'\'' \
    '\''./]target_sh_sh['\'' \
  || '\''exit'\'' "$][$][{?}"; \]])[
  '\''exit'\'' '\''0'\''; \
:;}

.PHONY: clean-]target_sh[

clean-]target_sh[:
	-'\''rm'\'' \
  '\''-f'\'' \]dnl
m4_if(
  [$3],
  [r],
  [[
  '\''-r'\'' \]])[
  '\''./]target_sh_sh['\'' \
;

clean-local: clean-]target_sh['
]dnl
m4_popdef([source_sh_sh])[]dnl
m4_popdef([target_sh_sh])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([target_sh])[]dnl
[
:;}]])[]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
