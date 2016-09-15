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
m4_if(
  m4_eval([$# < 3 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_DOCKER requires 3 to 6 arguments
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
  m4_bregexp([$4], [[^
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
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [image_names],
  [[$3]])[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_bpatsubst([[[$4]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_bpatsubst([[[$6]]], ['], ['\\'']))[]dnl
[

GATBPS_DOCKER_RULES="$][{GATBPS_DOCKER_RULES}"'

]output_file[: ]m4_if([$6], [], [child_prerequisites], [leaf_prerequisites])[
	$][(GATBPS_V_DOCKER): make: $][@]dnl
m4_if([$6], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]child_prerequisites[ \
;]])[
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\'']output_file[ \
  '\''./'\'']output_file['\''.tmp'\'' \
  '\''build-tmp/GATBPS_DOCKER/'\'']input_directory[ \
;
	$][(AM@&t@_V_at){ \
  ( \
    merge='\''no'\''; \
    context='\'''\''; \
    first_iteration='\''yes'\''; \
    for x in '\'''\'' ]child_prerequisites[; do \
      case "$][$][{first_iteration}" in \
        '\''yes'\'') \
          first_iteration='\''no'\''; \
          '\''continue'\''; \
        ;; \
      esac; \
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
    done; \
    '\''readonly'\'' '\''merge'\''; \
    case "$][$][{merge}" in \
      '\''yes'\'') \
        context='\''build-tmp/GATBPS_DOCKER/'\'']input_directory[; \
        '\''readonly'\'' '\''context'\''; \
        $][(MKDIR_P) \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
        '\''cp'\'' \
          '\''-R'\'' \
          $][(srcdir)'\''/'\'']input_directory['\''/'\''* \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
        '\''cp'\'' \
          '\''-R'\'' \
          '\''./'\'']input_directory['\''/'\''* \
          "$][$][{context}" \
        || '\''exit'\'' "$][$][{?}"; \
      ;; \
      '\''no'\'') \
        context="$][$][{context}"'\''/'\'']input_directory[; \
        '\''readonly'\'' '\''context'\''; \
      ;; \
    esac; \
    $][(DOCKER) \
      '\''build'\'' \
      '\''--tag=tmp'\''"$][$][{$][$][}" \]dnl
m4_foreach(
  [name],
  image_names,
  [m4_if(
    m4_defn([name]),
    [],
    [],
    [[
      '\''--tag='\'']m4_bpatsubst(m4_dquote(name), ['], ['\\''])[ \]])])[]dnl
[
      $][(DOCKER_BUILD_FLAGS) \
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
m4_foreach(
  [name],
  image_names,
  [m4_if(
    m4_defn([name]),
    [],
    [],
    [[
      ]m4_bpatsubst(m4_dquote(name), ['], ['\\''])[ \]])])[]dnl
[
      >'\''./'\'']output_file['\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    '\''mv'\'' \
      '\''./'\'']output_file['\''.tmp'\'' \
      '\''./'\'']output_file[ \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$][$][{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''-r'\'' \
    '\''build-tmp/GATBPS_DOCKER/'\'']input_directory[ \
  ; \
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
	$][(AM@&t@_V_at): done: $][@

.PHONY: clean-]output_file[

clean-]output_file[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']output_file[ \
  '\''./'\'']output_file['\''.tmp'\'' \
  '\''build-tmp/GATBPS_DOCKER/'\'']input_directory[ \
;

]m4_if([$5], [], [[mostlyclean]], [[$5]])[-local: clean-]output_file[

'
]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([image_names])[]dnl
m4_popdef([input_directory])[]dnl
m4_popdef([output_file])[]dnl
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
