include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/autoconf_boundary.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/autoconf_boundary_helper.m4|%}){%||%}dnl
ifdef(
  {%|autoconf_boundary|%},
  {%||%},
  {%|define(
    {%|autoconf_boundary|%},
    {%|dnl
ifelse(
  eval({%|$# < 1|%}),
  {%|1|%},
  {%|errprint(
{%|m4: error: |%}dnl
{%|autoconf_boundary requires at least 1 argument|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}m4exit({%|1|%})|%}){%||%}dnl
{%|AC_DEFUN([$1_check_prerequisites], [dnl|%}dnl
autoconf_boundary_helper(shift($@)){%|]dnl
m4_ifndef(
  [gatbps_check_for_missing_gatbps_macros],
  [m4_define(
    [gatbps_check_for_missing_gatbps_macros],
    [dnl
[# gatbps_check_for_missing_gatbps_macros]dnl
$1_check_prerequisites[]dnl
])],
  [m4_define(
    [gatbps_check_for_missing_gatbps_macros],
    [dnl
]m4_defn([gatbps_check_for_missing_gatbps_macros])[dnl
$1_check_prerequisites[]dnl
])])[]dnl
)[]dnl|%}dnl
|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
