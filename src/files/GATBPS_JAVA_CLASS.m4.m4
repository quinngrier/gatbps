changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_JAVA_CLASS.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_JAVA_CLASS.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_JAVA_CLASS], [[{

#
# The block that contains this comment is an expansion of the
# GATBPS_JAVA_CLASS macro.
#]dnl
m4_if(
  m4_eval([$# < 1 || $# > 2]),
  [1],
  [gatbps_fatal([
    GATBPS_JAVA_CLASS requires 1 to 2 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_JAVA_CLASS requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_eval([$# >= 2]),
  [1],
  [m4_case(
    [$2],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_JAVA_CLASS requires its second argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [dst],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
[

]AC_REQUIRE([GATBPS_CHECK_SOFT_INCLUDE])[

GATBPS_JAVA_CLASS_RULES="$][{GATBPS_JAVA_CLASS_RULES}"'

]dst[: ]dst[.d

#
# The following rule causes the .d file to be treated as up-to-date if
# it does not exist. This causes the output file to be remade when the
# .d file does not exist, which generates the .d file as a side-effect.
#
# Here is the relevant part of the description of the make utility in
# the 2001 edition of the POSIX standard:
#
#       After make has ensured that all of the prerequisites of a
#       target are up-to-date and if the target is out-of-date,
#       the commands associated with the target entry shall be
#       executed. If there are no commands listed for the target,
#       the target shall be treated as up-to-date.
#
# Here is the relevant part of the GNU make 3.81 manual:
#
#       If a rule has no prerequisites or commands, and the target
#       of the rule is a nonexistent file, then make imagines this
#       target to have been updated whenever its rule is run.
#

]dst[.d:

.PRECIOUS: ]dst[.d

.PHONY: clean-]dst[

clean-]dst[:
	-rm -f ]dst[ ]dst[.d ]dst[.d.tmp ]dst[.tmp

]m4_if([$2], [], [[mostlyclean]], [[$2]])[-local: clean-]dst[

'"$][{SOFT_INCLUDE}"' ]dst[.d

'

]dnl
m4_popdef([dst])[]dnl
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
