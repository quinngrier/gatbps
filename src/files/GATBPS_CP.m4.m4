changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CP.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
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
  [4], [],
  [5], [],
  [gatbps_fatal([
    GATBPS_CP requires exactly 2, 3, 4, or 5 arguments
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
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [directory], [],
    [executable], [],
    [regular], [],
    [gatbps_fatal([
      GATBPS_CP requires its third argument to be either "directory",
      "executable", or "regular"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 4]),
  [1],
  [m4_case(
    [$4],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_CP requires its fourth argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 5]),
  [1],
  [m4_if(
    m4_bregexp([$5], [^[-./0-9A-Z_a-z]+$]),
    [-1],
    [m4_if(
      m4_bregexp([$5], [^\$([A-Z_a-z][0-9A-Z_a-z]*)$]),
      [-1],
      [gatbps_fatal([
        GATBPS_CP requires its fifth argument to match one of the
        following regular expressions: ^[-./0-9A-Z_a-z]+$ or
        ^\$([A-Z_a-z][0-9A-Z_a-z]*)$
      ])])])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [prereq_sh],
  m4_bpatsubst([[[$5]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [target_sh_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\''\\'\\'''\\'']))[]dnl
m4_pushdef(
  [source_sh_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\''\\'\\'''\\'']))[]dnl
[

GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"'

]target_sh[: ]m4_if([$5], [], [source_sh], [prereq_sh])[
	$][(GATBPS_V_CP)'\'':'\'']dnl
m4_if([$5], [], [], [[
	$][(AM@&t@_V_at)$(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  '\'']source_sh_sh['\'' \
;]])[
	$][(AM@&t@_V_at)$(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at){ \
  x='\'']source_sh_sh['\''; \
  if '\''test'\'' '\''-]dnl
m4_if([$3], [directory], [[d]], [[f]])['\'' "$][$][{x}"; then \
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
m4_if([$3], [directory], [[
    '\''-R'\'' \]])[
    "$][$][{d}"'\''/'\''"$][$][{x}" \
    '\''./]target_sh_sh['\'' \
  || '\''exit'\'' "$][$][{?}"; \
  '\''exit'\'' '\''0'\''; \
:;}]dnl
m4_if([$3], [executable], [[
	'\''chmod'\'' \
  '\''a+x'\'' \
  '\''./]target_sh_sh['\'' \
;]])[

.PHONY: clean-]target_sh[

clean-]target_sh[:
	-'\''rm'\'' \
  '\''-f'\'' \]dnl
m4_if([$3], [directory], [[
  '\''-r'\'' \]])[
  '\''./]target_sh_sh['\'' \
;

]m4_if([$4], [], [[mostlyclean]], [[$4]])[-local: clean-]target_sh[

'
]dnl
m4_popdef([source_sh_sh])[]dnl
m4_popdef([target_sh_sh])[]dnl
m4_popdef([prereq_sh])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([target_sh])[]dnl
[
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
