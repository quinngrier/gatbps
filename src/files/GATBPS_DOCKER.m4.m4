changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_DOCKER.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_DOCKER.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_DOCKER], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_DOCKER macro.
#]dnl
m4_case(
  [$#],
  [3], [],
  [4], [],
  [5], [],
  [6], [],
  [gatbps_fatal([
    GATBPS_DOCKER requires exactly 3, 4, 5, or 6 arguments
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_DOCKER requires its first argument to contain at least
    one character that is not a space, tab, or newline
  ])])[]dnl
m4_if(
  m4_bregexp([$3], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_DOCKER requires its second argument to contain at least
    one character that is not a space, tab, or newline
  ])])[]dnl
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
      GATBPS_DOCKER requires its fourth argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [output_file_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$3]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [prereq_sh],
  m4_bpatsubst([[[$6]]], ['], ['\\'']))[]dnl
[

GATBPS_DOCKER_RULES="$][{GATBPS_DOCKER_RULES}"'

]output_file_sh[: ]m4_if([$6], [], [source_sh], [prereq_sh])[
	$][(GATBPS_V_DOCKER): make: $][@]dnl
m4_if([$6], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]source_sh[ \
;]])[
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_file_sh[ \
  '\''./'\'']output_file_sh['\''.tmp'\'' \
  '\''build-tmp/GATBPS_DOCKER/'\'']input_directory_sh[ \
;
	$][(AM@&t@_V_at){ \
  ( \
    merge='\''no'\''; \
    context='\'''\''; \
    for x in '\'''\'' ]source_sh[; do \
      case "$][$][{x}" in \
        ?*) \
          if '\''test'\'' '\''-r'\'' "$][$][{x}"; then \
            '\''test'\'' \
              '\''-f'\'' \
              "$][$][{x}" \
            || '\''test'\'' \
              '\''-d'\'' \
              "$][$][{x}" \
            || '\''exit'\'' "$][$][{?}"; \
            case "$][$][{merge}" in \
              '\''no'\'') \
                case "$][$][{context}" in \
                  '\''.'\'') \
                  ;; \
                  ?*) \
                    merge='\''yes'\''; \
                    '\''readonly'\'' '\''merge'\''; \
                  ;; \
                  *) \
                    context='\''.'\''; \
                  ;; \
                esac; \
              ;; \
            esac; \
          else \
            '\''test'\'' \
              '\''-f'\'' \
              $][(srcdir)'\''/'\''"$][$][{x}" \
            || '\''test'\'' \
              '\''-d'\'' \
              $][(srcdir)'\''/'\''"$][$][{x}" \
            || '\''exit'\'' "$][$][{?}"; \
            case "$][$][{merge}" in \
              '\''no'\'') \
                case "$][$][{context}" in \
                  $][(srcdir)) \
                  ;; \
                  ?*) \
                    merge='\''yes'\''; \
                    '\''readonly'\'' '\''merge'\''; \
                  ;; \
                  *) \
                    context=$][(srcdir); \
                  ;; \
                esac; \
              ;; \
            esac; \
          fi; \
        ;; \
      esac; \
    done; \
    '\''readonly'\'' '\''merge'\''; \
    case "$][$][{merge}" in \
      '\''yes'\'') \
        context='\''build-tmp/GATBPS_DOCKER/'\'']input_directory_sh[; \
        '\''readonly'\'' '\''context'\''; \
        $][(MKDIR_P) \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
        '\''cp'\'' \
          '\''-R'\'' \
          '\''./'\'']input_directory_sh['\''/'\''* \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
        '\''cp'\'' \
          '\''-R'\'' \
          $][(srcdir)'\''/'\'']input_directory_sh['\''/'\''* \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
      ;; \
      '\''no'\'') \
        context="$][$][{context}"'\''/'\'']input_directory_sh[; \
        '\''readonly'\'' '\''context'\''; \
      ;; \
    esac; \
    $][(DOCKER) \
      '\''build'\'' \
      '\''--tag'\'' \
      '\''tmp'\''"$][$][{$][$][}" \]dnl
m4_foreach_w([name], [$4], [[
      '\''--tag'\'' \
      '\'']m4_bpatsubst(name, ['], ['\''])['\'' \]])[
      "$][$][{context}" \
    || '\''exit'\'' "$][$][{?}"; \
    hash=`$][(DOCKER) \
      '\''images'\'' \
      '\''--quiet'\'' \
      '\''tmp'\''"$][$][{$][$][}" \
    ` || '\''exit'\'' "$][$][{?}"; \
    '\''readonly'\'' '\''hash'\''; \
    $][(DOCKER) \
      '\''save'\'' \
      "$][$][{hash}" \]dnl
m4_foreach_w([name], [$4], [[
      '\'']m4_bpatsubst(name, ['], ['\''])['\'' \]])[
      >'\''./'\'']output_file_sh['\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    '\''mv'\'' \
      '\''./'\'']output_file_sh['\''.tmp'\'' \
      '\''./'\'']output_file_sh[ \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$][$][{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''-r'\'' \
    '\''build-tmp/GATBPS_DOCKER/'\'']input_directory_sh[ \
  ; \
  case "$][$][{x}" in \
    '\''0'\'') \
    ;; \
    *) \
      '\''rm'\'' \
        '\''-f'\'' \
        '\''-r'\'' \
        '\''./'\'']output_file_sh[ \
        '\''./'\'']output_file_sh['\''.tmp'\'' \
      ; \
    ;; \
  esac; \
  '\''exit'\'' "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]output_file_sh[

clean-]output_file_sh[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']output_file_sh[ \
  '\''./'\'']output_file_sh['\''.tmp'\'' \
  '\''build-tmp/GATBPS_DOCKER/'\'']input_directory_sh[ \
;

]m4_if([$5], [], [[mostlyclean]], [[$5]])[-local: clean-]output_file_sh[

'
]dnl
m4_popdef([prereq_sh])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([input_directory_sh])[]dnl
m4_popdef([output_file_sh])[]dnl
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
