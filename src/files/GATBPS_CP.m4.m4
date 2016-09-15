changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CP.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
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
m4_if(
  m4_eval([$# < 2 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_CP requires 2 to 6 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_CP requires its first argument to contain at least one
    character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_CP requires its second argument to contain at least one
    character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [], [],
    [directory], [],
    [executable], [],
    [gatbps_fatal([
      GATBPS_CP requires its third argument to be either empty,
      "directory", or "executable"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 5]),
  [1],
  [m4_case(
    [$5],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_CP requires its fourth argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 6]),
  [1],
  [m4_if(
    m4_bregexp([$6], [[^
	 ]]),
    [-1],
    [gatbps_fatal([
      GATBPS_CP requires its fifth argument to contain at least one
      character that is not a space, tab, or newline
    ])])])[]dnl
m4_pushdef(
  [output_file_or_directory],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_file_or_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_if(
    [$4],
    [],
    [m4_dquote(input_file_or_directory)],
    [m4_bpatsubst([[[$4]]], ['], ['\\''])]))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_bpatsubst([[[$6]]], ['], ['\\'']))[]dnl
[

GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"'

]output_file_or_directory[: ]m4_if(
  [$6],
  [],
  [child_prerequisites],
  [leaf_prerequisites])[
	$][(AM@&t@_V_at)|%}dnl
contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%|
	$][(GATBPS_V_CP): make: $][@]dnl
m4_if([$6], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]child_prerequisites[ \
;]])[
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at){ \
  x=]input_file_or_directory[; \
  if '\''test'\'' '\''-]dnl
m4_if([$3], [directory], [[d]], [[f]])['\'' "$][$][{x}"; then \
    d='\''.'\''; \
  else \
    d=$][(srcdir); \
    case "$][$][{d}" in \
      '\''/'\''*) \
      ;; \
      *) \
        d='\''./'\''"$][$][{d}"; \
      ;; \
    esac; \
  fi; \
  '\''cp'\'' \]dnl
m4_if([$3], [directory], [[
    '\''-R'\'' \]])[
    "$][$][{d}"'\''/'\''"$][$][{x}" \
    '\''./'\'']output_file_or_directory[ \
  || '\''exit'\'' "$][$][{?}"; \
  '\''exit'\'' '\''0'\''; \
:;}]dnl
m4_if([$3], [executable], [[
	$][(AM@&t@_V_at)'\''chmod'\'' \
  '\''a+x'\'' \
  '\''./'\'']output_file_or_directory[ \
;]])[
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]output_file_or_directory[

clean-]output_file_or_directory[:
	-'\''rm'\'' \
  '\''-f'\'' \]dnl
m4_if([$3], [directory], [[
  '\''-r'\'' \]])[
  '\''./'\'']output_file_or_directory[ \
;

]m4_if([$5], [], [[mostlyclean]], [[$5]])[-local: clean-]output_file_or_directory[

'
]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([input_file_or_directory])[]dnl
m4_popdef([output_file_or_directory])[]dnl
[
:;}]])[]dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
