changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_TAR.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_TAR.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_TAR], [[{

#
# The block that contains this comment is an expansion of the GATBPS_TAR
# macro.
#]dnl
m4_case(
  [$#],
  [2], [],
  [3], [],
  [4], [],
  [5], [],
  [6], [],
  [gatbps_fatal([
    GATBPS_TAR requires exactly 2, 3, 4, 5, or 6 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_TAR requires its first argument to contain at least one
    character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_TAR requires its second argument to contain at least one
    character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [], [],
    [contents], [],
    [gatbps_fatal([
      GATBPS_TAR requires its third argument to be either empty or
      "contents"
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
      GATBPS_TAR requires its fourth argument to be either "clean",
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
      GATBPS_TAR requires its fifth argument to contain at least one
      character that is not a space, tab, or newline
    ])])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_if(
    [$4],
    [],
    [m4_dquote(input_directory)],
    [m4_bpatsubst([[[$4]]], ['], ['\\''])]))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_bpatsubst([[[$6]]], ['], ['\\'']))[]dnl
[

GATBPS_TAR_RULES="$][{GATBPS_TAR_RULES}"'

]target_sh[: ]m4_if(
  [$6],
  [],
  [child_prerequisites],
  [leaf_prerequisites])[
	$][(AM@&t@_V_at)|%}dnl
contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%|
	$][(GATBPS_V_TAR): make: $][@]dnl
m4_if([$6], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]child_prerequisites[ \
;]])[
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;]dnl
m4_if(
[$3], [contents], [[
	$][(AM@&t@_V_at){ \
  x=]input_directory[; \
  if '\''test'\'' '\''-d'\'' "$][$][{x}"; then \
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
  ( \
    '\''cd'\'' \
      "$][$][{d}"'\''/'\''"$][$][{x}" \
    || '\''exit'\'' "$][$][{?}"; \
    $][(TAR) \
      '\''cf'\'' \
      '\''-'\'' \
      * \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;) \
    >'\''./'\'']target_sh['\''.tmp'\'' \
  || '\''exit'\'' "$][$][{?}"; \
  '\''exit'\'' '\''0'\''; \
:;}]],
[$3], [], [[
	$][(AM@&t@_V_at){ \
  x=]input_directory[; \
  if \
    '\''test'\'' '\''-f'\'' "$][$][{x}" || \
    '\''test'\'' '\''-d'\'' "$][$][{x}" \
  ; then \
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
  $][(TAR) \
    '\''cf'\'' \
    '\''./'\'']target_sh['\''.tmp'\'' \
    "$][$][{d}"'\''/'\''"$][$][{x}" \
  || '\''exit'\'' "$][$][{?}"; \
  '\''exit'\'' '\''0'\''; \
:;}]], [gatbps_fatal([missing case])])[
	$][(AM@&t@_V_at)'\''mv'\'' \
  '\''./'\'']target_sh['\''.tmp'\'' \
  '\''./'\'']target_sh[ \
;
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]target_sh[

clean-]target_sh[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']target_sh[ \
;

]m4_if([$5], [], [[mostlyclean]], [[$5]])[-local: clean-]target_sh[

'
]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([input_directory])[]dnl
m4_popdef([target_sh])[]dnl
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
