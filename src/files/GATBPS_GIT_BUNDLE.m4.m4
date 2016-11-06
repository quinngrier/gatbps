changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_GIT_BUNDLE.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_GIT_BUNDLE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_GIT_BUNDLE], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_GIT_BUNDLE macro for the $1 target.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# < 3 || $# > 4]),
  [1],
  [gatbps_fatal([
    GATBPS_GIT_BUNDLE requires 3 to 4 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument to GATBPS_GIT_BUNDLE:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid second argument to GATBPS_GIT_BUNDLE:
  [--VERBATIM--] "$2"], [
    the second argument must contain at least one character that is not
    a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$3], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_GIT_BUNDLE requires its fourth argument to contain at least
    one character that is not a space, tab, or newline character
  ])])[]dnl
m4_case(
  [$4],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid fourth argument to GATBPS_GIT_BUNDLE:
  [--VERBATIM--] "$4"], [
    the fourth argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [commit_ish],
  m4_bpatsubst([[[$3]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$4],
    [],
    [[[clean]]],
    [[[$4]]]))[]dnl
[

GATBPS_GIT_BUNDLE_RULES="$][{GATBPS_GIT_BUNDLE_RULES}"'

]output_file[: ]input_directory[
	$][(AM@&t@_V_at)|%}contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$][(GATBPS_V_GIT_BUNDLE)$][(GATBPS_RECIPE_MARKER_TOP)
	@$][(MKDIR_P) '\''./'\''$][(@D)
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_file[ \
  '\''./'\'']output_file['\''.tmp'\'' \
;
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
    $][(GIT) \
      '\''rev-parse'\'' \
      '\''--verify'\'' \
      ]commit_ish['\''^{commit}'\'' \
    || ( \
      $][(GIT) \
        '\''remote'\'' \
        '\''update'\'' \
      ; \
      $][(GIT) \
        '\''rev-parse'\'' \
        '\''--verify'\'' \
        ]commit_ish['\''^{commit}'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      '\''exit'\'' '\''0'\''; \
    ) || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;) || '\''exit'\'' "$][$][{?}"; \
  ( \
    ( \
      '\''cd'\'' \
        "$][$][{d}"'\''/'\''"$][$][{x}" \
      || '\''exit'\'' "$][$][{?}"; \
      $][(GIT) \
        '\''checkout'\'' \
        ]commit_ish['\''^{commit}'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      $][(GIT) \
        '\''bundle'\'' \
        '\''create'\'' \
        '\''-'\'' \
        '\''HEAD'\'' \
        '\''--tags'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      '\''exit'\'' '\''0'\''; \
    :;) \
      >'\''./'\'']output_file['\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    '\''mv'\'' \
      '\''./'\'']output_file['\''.tmp'\'' \
      '\''./'\'']output_file[ \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$][$][{?}"; \
  case "$][$][{x}" in \
    '\''0'\'') \
    ;; \
    *) \
      '\''rm'\'' \
        '\''-f'\'' \
        '\''-r'\'' \
        '\''./'\'']output_file[ \
        '\''./'\'']output_file['\''.tmp'\'' \
      ; \
    ;; \
  esac; \
  '\''exit'\'' "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]output_file[

clean-]output_file[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']output_file[ \
;

]clean_target[-local: clean-]output_file[

'

]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([commit_ish])[]dnl
m4_popdef([input_directory])[]dnl
m4_popdef([output_file])[]dnl
[:;}]])[]dnl
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