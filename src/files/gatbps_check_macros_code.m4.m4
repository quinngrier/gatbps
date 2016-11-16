changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps_check_macros_code.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/autoconf_boundary.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: gatbps_check_macros_code.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
|%}dnl
autoconf_boundary(
  {%|gatbps_check_macros_code|%},
  {%||%}){%||%}dnl
{%|
AC_DEFUN([gatbps_check_macros_code], [dnl
gatbps_check_macros_code_check_macros[]dnl
m4_if(
  [$1],
  [],
  [dnl
m4_ifndef(
  [gatbps_check_macros],
  [m4_define(
    [gatbps_check_macros],
    [dnl
[# gatbps_check_macros]dnl
$1_check_macros[]dnl
])],
  [m4_define(
    [gatbps_check_macros],
    [dnl
]m4_defn([gatbps_check_macros])[dnl
$1_check_macros[]dnl
])])[]dnl
],
  [dnl
m4_ifndef(
  [$1],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[$1 ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[did you forget ]dnl
[$1.m4?]dnl
)[]dnl
])[]dnl
m4_ifndef(
  [$1_check_macros],
  [dnl
m4_errprintn(
m4_location[: error: ]dnl
[$1_check_macros ]dnl
[is not defined]dnl
)[]dnl
m4_fatal(
[did you forget to define it in ]dnl
[$1.m4?]dnl
)[]dnl
])[]dnl
$1_check_macros[]dnl
gatbps_check_macros_code(m4_shift($@))[]dnl
])[]dnl
])[]dnl
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
