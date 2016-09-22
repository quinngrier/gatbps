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
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument to GATBPS_CP:
    [--VERBATIM--] "$1"
  ], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid second argument to GATBPS_CP:
    [--VERBATIM--] "$2"
  ], [
    the second argument must contain at least one character that is not
    a space, tab, or newline character
  ])])[]dnl
m4_case(
  [$3],
  [], [],
  [directory], [],
  [executable], [],
  [file], [],
  [file_or_directory], [],
  [gatbps_fatal([
    invalid third argument to GATBPS_CP:
    [--VERBATIM--] "$3"
  ], [
    the third argument must be either empty, "directory", "executable",
    "file", or "file_or_directory"
  ])])[]dnl
m4_pushdef(
  [list_4],
  m4_bpatsubst([[[$4]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_CP_check_4],
  [gatbps_fatal([
    GATBPS_CP_check_4 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CP_check_4],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the fourth GATBPS_CP argument:
        [--VERBATIM--] "$1"
      ], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the fourth GATBPS_CP argument:
        [--VERBATIM--] "$1"
      ], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])])[]GATBPS_CP_check_4(m4_shift($@))])])[dnl
GATBPS_CP_check_4(m4_if(,,list_4))[]dnl
m4_case(
  [$5],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid fifth argument to GATBPS_CP:
    [--VERBATIM--] "$5"
  ], [
    the fifth argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [list_6],
  m4_bpatsubst([[[$6]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_CP_check_6],
  [gatbps_fatal([
    GATBPS_CP_check_6 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CP_check_6],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the sixth GATBPS_CP argument:
        [--VERBATIM--] "$1"
      ], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the sixth GATBPS_CP argument:
        [--VERBATIM--] "$1"
      ], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])])[]GATBPS_CP_check_6(m4_shift($@))])])[dnl
GATBPS_CP_check_6(m4_if(,,list_6))[]dnl
m4_pushdef(
  [output_file_or_directory],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_file_or_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [output_mode],
  m4_if(
    [$3],
    [],
    [[[file_or_directory]]],
    [[[$3]]]))[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_if(
    list_4,
    [],
    [[[[$2]]]],
    [m4_dquote(list_4)]))[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$5],
    [],
    [[[mostlyclean]]],
    [[[$5]]]))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_dquote(list_6))[]dnl
m4_pushdef(
  [rule_prerequisites],
  m4_if(
    leaf_prerequisites,
    [],
    [m4_dquote(child_prerequisites)],
    [m4_dquote(leaf_prerequisites)]))[]dnl
]m4_ifdef(
  [GATBPS_CP_rule_lines],
  [gatbps_fatal([
    GATBPS_CP_rule_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CP_rule_lines],
  [m4_if(
    [$1],
    [],
    [],
    [
output_file_or_directory[: ]dnl
m4_bpatsubst([[$1]], ['], ['\\''])dnl
GATBPS_CP_rule_lines(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_CP_make_lines],
  [gatbps_fatal([
    GATBPS_CP_make_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CP_make_lines],
  [m4_if(
    [$1],
    [],
    [],
    [
  m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_CP_make_lines(m4_shift($@))])])[dnl
[

GATBPS_CP_RULES="$][{GATBPS_CP_RULES}"'

]GATBPS_CP_rule_lines(m4_if(,,rule_prerequisites))[
m4_if(
  leaf_prerequisites,
  [],
  [],
  [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \]dnl
GATBPS_CP_make_lines(m4_if(,,child_prerequisites))[
;]])[
	$][(GATBPS_V_CP): make: $][@]dnl
	$][(AM@&t@_V_at)|%}dnl
contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%|
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_file_or_directory[ \
  '\''./'\'']output_file_or_directory['\''.tmp'\'' \
;
	$][(AM@&t@_V_at){ \
  ( \
    x=]input_file_or_directory[; \
    if '\''test'\'' '\''-r'\'' "$][$][{x}"; then \
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
    '\''test'\'' \
      '\''-]m4_if(output_mode, [directory], [[d]], [[f]])['\'' \
      "$][$][{d}"'\''/'\''"$][$][{x}" \]dnl
m4_if(
  output_mode,
  [file_or_directory],
  [[
    || '\''test'\'' \
      '\''-d'\'' \
      "$][$][{d}"'\''/'\''"$][$][{x}" \]])[]dnl
[
    || '\''exit'\'' "$][$][{?}"; \
    '\''cp'\'' \
      '\''-R'\'' \
      "$][$][{d}"'\''/'\''"$][$][{x}" \
      '\''./'\'']output_file_or_directory['\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \]dnl
m4_if(
  output_mode,
  [executable],
  [[
    '\''chmod'\'' \
      '\''a+x'\'' \
      '\''./'\'']output_file_or_directory['\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \]])[]dnl
[
    '\''mv'\'' \
      '\''./'\'']output_file_or_directory['\''.tmp'\'' \
      '\''./'\'']output_file_or_directory[ \
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
        '\''./'\'']output_file_or_directory[ \
        '\''./'\'']output_file_or_directory['\''.tmp'\'' \
      ; \
    ;; \
  esac; \
  '\''exit'\'' "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]output_file_or_directory[

clean-]output_file_or_directory[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_file_or_directory[ \
  '\''./'\'']output_file_or_directory['\''.tmp'\'' \
;

]clean_target[-local: clean-]output_file_or_directory[

'
]dnl
m4_popdef([rule_prerequisites])[]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([output_mode])[]dnl
m4_popdef([input_file_or_directory])[]dnl
m4_popdef([output_file_or_directory])[]dnl
m4_popdef([list_6])[]dnl
m4_popdef([list_4])[]dnl
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
