changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DOCKER_BUILD.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DOCKER_BUILD.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_DOCKER_BUILD], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_DOCKER_BUILD macro for the $1 target.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# < 2 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD requires 2 to 6 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid second argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$2"], [
    the second argument must contain at least one character that is not
    a space, tab, or newline character
  ])])[]dnl
m4_pushdef(
  [list_3],
  m4_bpatsubst([[[$3]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_3],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_3 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_check_3],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the third GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the third GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_3(m4_shift($@))])])])[dnl
GATBPS_DOCKER_BUILD_check_3(m4_if(,,list_3))[]dnl
m4_pushdef(
  [list_4],
  m4_bpatsubst([[[$4]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_4],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_4 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_check_4],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the fourth GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the fourth GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_4(m4_shift($@))])])])[dnl
GATBPS_DOCKER_BUILD_check_4(m4_if(,,list_4))[]dnl
m4_case(
  [$5],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid fifth argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$5"], [
    the fifth argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [list_6],
  m4_bpatsubst([[[$6]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_6],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_6 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_check_6],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the sixth GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the sixth GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_6(m4_shift($@))])])])[dnl
GATBPS_DOCKER_BUILD_check_6(m4_if(,,list_6))[]dnl
m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [image_names],
  m4_dquote(list_3))[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_if(
    list_4,
    [],
    [[[[$2/Dockerfile]]]],
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
  [GATBPS_DOCKER_BUILD_rule_lines],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_rule_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_rule_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
]output_file[: ]dnl
m4_bpatsubst([[$1]], ['], ['\\''])[]dnl
GATBPS_DOCKER_BUILD_rule_lines(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_word_lines_2],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_word_lines_2 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_word_lines_2],
  [m4_if(
    [$1],
    [],
    [],
    [[
  ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_word_lines_2(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_word_lines_6],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_word_lines_6 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_word_lines_6],
  [m4_if(
    [$1],
    [],
    [],
    [[
      ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_DOCKER_BUILD_tag_lines],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_tag_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_DOCKER_BUILD_tag_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
      '\''--tag='\'']m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_tag_lines(m4_shift($@))])])[dnl
[

GATBPS_DOCKER_BUILD_RULES="$][{GATBPS_DOCKER_BUILD_RULES}"'

]GATBPS_DOCKER_BUILD_rule_lines(m4_if(,,rule_prerequisites))[]dnl
m4_if(
  leaf_prerequisites,
  [],
  [],
  [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \]dnl
GATBPS_DOCKER_BUILD_word_lines_2(m4_if(,,child_prerequisites))[
;]])[
	$][(GATBPS_V_DOCKER)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(AM@&t@_V_at)|%}contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at)|%}contains_exactly_one_word_sh(
  {%|srcdir|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  ./$][(@D) \
;
	$][(AM@&t@_V_at)rm \
  -f \
  -r \
  ./]output_file[ \
  ./]output_file[.tmp \
  '\''GATBPS_DOCKER_BUILD/'\'']input_directory[ \
;
	$][(AM@&t@_V_at){ \
  ( \
    merge=no; \
    context='\'''\''; \
    for x in \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_if(,,child_prerequisites))[
      $][$][{prevent_an_empty_word_list} \
    ; do \
      if test -r "$][$][{x}"; then \
        test \
          -f \
          "$][$][{x}" \
        || test \
          -d \
          "$][$][{x}" \
        || exit $][$][?; \
        case "$][$][{merge}" in \
          no) \
            case "$][$][{context}" in \
              .) \
              ;; \
              ?*) \
                merge=yes; \
                readonly merge; \
              ;; \
              *) \
                context=.; \
              ;; \
            esac; \
          ;; \
        esac; \
      else \
        test \
          -f \
          $][(srcdir)'\''/'\''"$][$][{x}" \
        || test \
          -d \
          $][(srcdir)'\''/'\''"$][$][{x}" \
        || exit $][$][?; \
        case "$][$][{merge}" in \
          no) \
            case "$][$][{context}" in \
              $][(srcdir)) \
              ;; \
              ?*) \
                merge=yes; \
                readonly merge; \
              ;; \
              *) \
                context=$][(srcdir); \
              ;; \
            esac; \
          ;; \
        esac; \
      fi; \
    done; \
    readonly merge; \
    case "$][$][{merge}" in \
      yes) \
        context='\''GATBPS_DOCKER_BUILD/'\'']input_directory[; \
        readonly '\''context'\''; \
        $][(MKDIR_P) \
          "$][$][{context}" \
        || exit $][$][?; \
        cp \
          -R \
          $][(srcdir)'\''/'\'']input_directory['\''/'\''* \
          "$][$][{context}" \
        || exit $][$][?; \
        cp \
          -R \
          ./]input_directory['\''/'\''* \
          "$][$][{context}" \
        || exit $][$][?; \
      ;; \
      no) \
        context="$][$][{context}"'\''/'\'']input_directory[; \
        readonly '\''context'\''; \
      ;; \
    esac; \
    $][(DOCKER) \
      build \
      '\''--tag=tmp'\''"$][$][{$][$][}" \]dnl
GATBPS_DOCKER_BUILD_tag_lines(m4_if(,,image_names))[
      $][(DOCKER_BUILD_FLAGS) \
      "$][$][{context}" \
    || exit $][$][?; \
    hash=` \
      $][(DOCKER) \
        images \
        --quiet \
        '\''tmp'\''"$][$][{$][$][}" \
      ; \
    ` || exit $][$][?; \
    readonly hash; \
    $][(DOCKER) \
      save \
      "$][$][{hash}" \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_if(,,image_names))[
      1>./]output_file[.tmp \
    || exit $][$][?; \
    mv \
      -f \
      ./]output_file[.tmp \
      ./]output_file[ \
    || exit $][$][?; \
    exit '\''0'\''; \
  :;); \
  x=$][$][?; \
  rm \
    -f \
    -r \
    '\''GATBPS_DOCKER_BUILD/'\'']input_directory[ \
  ; \
  case "$][$][{x}" in \
    '\''0'\'') \
    ;; \
    *) \
      rm \
        -f \
        -r \
        ./]output_file[ \
        ./]output_file[.tmp \
      ; \
    ;; \
  esac; \
  exit "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]output_file[

clean-]output_file[: FORCE
	-rm -f -r]dnl
[ ./]output_file[]dnl
[ ./]output_file[.tmp]dnl
[ GATBPS_DOCKER_BUILD/]input_directory[]dnl
[

]clean_target[-local: clean-]output_file[

'

]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([image_names])[]dnl
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
