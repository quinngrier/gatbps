changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_WGET.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_WGET.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_WGET], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_WGET macro for the $1 target.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# < 2 || $# > 4]),
  [1],
  [gatbps_fatal([
    GATBPS_WGET requires 2 to 4 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument for GATBPS_WGET:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_pushdef(
  [list_2],
  m4_bpatsubst([[[$2]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_WGET_check_2],
  [gatbps_fatal([
    GATBPS_WGET_check_2 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_WGET_check_2],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the second GATBPS_WGET argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the second GATBPS_WGET argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_WGET_check_2(m4_shift($@))])])])[dnl
GATBPS_WGET_check_2(m4_if(,,list_2))[]dnl
m4_pushdef(
  [list_3],
  m4_bpatsubst([[[$3]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_WGET_check_3],
  [gatbps_fatal([
    GATBPS_WGET_check_3 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_WGET_check_3],
  [m4_if(
    [$1],
    [],
    [m4_if(
      [$#],
      [1],
      [],
      [gatbps_fatal([
        GATBPS_WGET bad third argument
      ])])],
    [m4_if(
      m4_bregexp([$1], [^md5:]dnl [0-9a-f]\{32\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [],
      m4_bregexp([$1], [^sha1:]dnl [0-9a-f]\{40\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [],
      m4_bregexp([$1], [^sha224:]dnl [0-9a-f]\{56\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [],
      m4_bregexp([$1], [^sha256:]dnl [0-9a-f]\{64\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [],
      m4_bregexp([$1], [^sha384:]dnl [0-9a-f]\{96\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [],
      m4_bregexp([$1], [^sha512:]dnl [0-9a-f]\{128\} doesn't work
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]]dnl
[$]),
      [0],
      [m4_if(
        [$#],
        [1],
        [],
        [GATBPS_WGET_check_3(m4_shift($@))])],
      [gatbps_fatal([
        GATBPS_WGET bad third argument
      ])])])])[dnl
GATBPS_WGET_check_3(m4_if(,,list_3))[]dnl
m4_case(
  [$4],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid fourth argument for GATBPS_WGET:
  [--VERBATIM--] "$4"], [
    the fourth argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_urls],
  m4_dquote(list_2))[]dnl
m4_pushdef(
  [file_hashes],
  m4_dquote(list_3))[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$4],
    [],
    [[[clean]]],
    [[[$4]]]))[]dnl
]m4_ifdef(
  [GATBPS_WGET_url_lines],
  [gatbps_fatal([
    GATBPS_WGET_url_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_WGET_url_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
      ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_WGET_url_lines(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_WGET_hash_checks],
  [gatbps_fatal([
    GATBPS_WGET_hash_checks is already defined
  ])])[dnl
]m4_define(
  [GATBPS_WGET_hash_checks],
  [m4_if(
    [$1],
    [],
    [],
    [[
      $][(OPENSSL) \
        '\''dgst'\'' \
        '\''-non-fips-allow'\'' \
        '\''-]m4_bregexp([$1], [[^:]*], [[\&]])['\'' \
        <'\''./'\'']output_file['\''.tmp'\'' \
      | $][(GREP) \
        '\'']m4_bregexp([$1], [:\(.*\)], [[\1]])['\'' \
        >'\''/dev/null'\'' \
      || '\''continue'\''; \]dnl
GATBPS_WGET_hash_checks(m4_shift($@))])])[dnl
[

GATBPS_WGET_RULES="$][{GATBPS_WGET_RULES}"'

]output_file[:
	$][(GATBPS_V_WGET)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(AM@&t@_V_at)|%}contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  '\''./'\''$][(@D) \
;
	$][(AM@&t@_V_at)'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']output_file[ \
  '\''./'\'']output_file['\''.tmp'\'' \
;
	$][(AM@&t@_V_at){ \
  ( \
    download_succeeded='\''no'\''; \
    for url in \]dnl
GATBPS_WGET_url_lines(m4_if(,,input_urls))[
      $][$][{prevent_an_empty_word_list} \
    ; do \
      case "$][$][{url}" in \
        *'\''://'\''*) \
          $][(WGET) \
            '\''-O'\'' \
            '\''./'\'']output_file['\''.tmp'\'' \
            '\''--'\'' \
            "$][$][{url}" \
          || '\''continue'\''; \
        ;; \
        *) \
          case "$][$][{url}" in \
            '\''/'\''*) \
              safe_url="$][$][{url}"; \
            ;; \
            *) \
              safe_url='\''./'\''"$][$][{url}"; \
            ;; \
          esac; \
          'cp' \
            "$][$][{safe_url}" \
            '\''./'\'']output_file['\''.tmp'\'' \
          || '\''continue'\''; \
        ;; \
      esac; \]dnl
GATBPS_WGET_hash_checks(m4_if(,,file_hashes))[
      download_succeeded='\''yes'\''; \
      '\''readonly'\'' '\''download_succeeded'\''; \
      '\''break'\''; \
    done; \
    '\''readonly'\'' '\''download_succeeded'\''; \
    case "$][$][{download_succeeded}" in \
      '\''no'\'') \
        '\''exit'\'' '\''1'\''; \
      ;; \
    esac; \
    '\''mv'\'' \
      '\''./'\'']output_file['\''.tmp'\'' \
      '\''./'\'']output_file[ \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  exit_status="$][$][{?}"; \
  '\''readonly'\'' '\''exit_status'\''; \
  case "$][$][{exit_status}" in \
    '\''0'\'') \
    ;; \
    *) \
      '\''rm'\'' \
        '\''-f'\'' \
        '\''./'\'']output_file[ \
        '\''./'\'']output_file['\''.tmp'\'' \
      ; \
    ;; \
  esac; \
  '\''exit'\'' "$][$][{exit_status}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]output_file[

clean-]output_file[:
	-'\''rm'\'' \
  '\''-f'\'' \
  '\''./'\'']output_file[ \
  '\''./'\'']output_file['\''.tmp'\'' \
;

]clean_target[-local: clean-]output_file[

'

]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([file_hashes])[]dnl
m4_popdef([input_urls])[]dnl
m4_popdef([output_file])[]dnl
m4_popdef([list_3])[]dnl
m4_popdef([list_2])[]dnl
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
