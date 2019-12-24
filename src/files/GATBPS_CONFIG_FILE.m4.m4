changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CONFIG_FILE.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CONFIG_FILE.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CONFIG_FILE], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_CONFIG_FILE macro.
#]dnl
m4_if(
  m4_eval([$# < 1 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_CONFIG_FILE requires 1 to 6 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [distclean], [],
    [maintainer-clean], [],
    [gatbps_fatal([
      GATBPS_CONFIG_FILE requires its third argument to be either
      "distclean" or "maintainer-clean"
    ])])])[]dnl
m4_pushdef(
  [gatbps_output],
  [$1])[]dnl
m4_pushdef(
  [input_file],
  [$2])[]dnl
m4_pushdef(
  [input_file],
  m4_ifval(input_file, [input_file], [gatbps_output.in]))[]dnl
m4_pushdef(
  [gatbps_suffix],
  m4_if(m4_eval([$# < 4]), [1], [.out], [$4]))[]dnl
[

]AC_CONFIG_FILES(
  gatbps_output[]gatbps_suffix[:]input_file,
  [[(
    dst=]]gatbps_output[[
    src=]]gatbps_output[[]]gatbps_suffix[[
    inp=]]input_file[[
    if test ! -f $inp; then
      inp=$srcdir/$inp
    fi
    if (
      (
        test -f $dst
      ) && (
        (test   -x $dst && test   -x $inp) ||
        (test ! -x $dst && test ! -x $inp)
      ) && (
        cmp $dst $src >/dev/null
      )
    ); then
      ]AC_MSG_NOTICE([skipping $dst])[
    else
      ]AC_MSG_NOTICE([updating $dst])[
      rm -f $dst || exit
      cp $inp $dst || exit
      cat $src >$dst || exit
      ]$5[
    fi
  )]],
  [$6])

gatbps_new_rules='.PHONY: clean-gatbps_output

clean-gatbps_output:
	-rm -f gatbps_output

[

]m4_if([$3], [], [[distclean]], [[$3]])[-local: clean-]gatbps_output[

]gatbps_output[: ]input_file[
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(GATBPS_V_CONFIG_FILE)$][(GATBPS_V_NOP)
	$][(AM@&t@_V_at)rm \
  -f \
  ./]gatbps_output[ \
;
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  ./$][(@D) \
;
	$][(AM@&t@_V_at)$][(SHELL) \
  '\''-'\'' \
  '\''./config.status'\'' \
  ]gatbps_output[]gatbps_suffix[ \
;
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

'

]

case "$[]{GATBPS_CONFIG_FILE_RULES}" in
  ?*)
    GATBPS_CONFIG_FILE_RULES="$[]{GATBPS_CONFIG_FILE_RULES}

$[]{gatbps_new_rules}"
  ;;
  *)
    GATBPS_CONFIG_FILE_RULES="$[]{gatbps_new_rules}"
  ;;
esac

m4_popdef([gatbps_suffix])[]dnl
m4_popdef([input_file])[]dnl
m4_popdef([input_file])[]dnl
m4_popdef([gatbps_output])[]dnl
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
