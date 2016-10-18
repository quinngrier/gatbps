include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/autoconf_prerequisites.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/autoconf_prerequisites_helper.m4|%}){%||%}dnl
ifdef(
  {%|autoconf_prerequisites|%},
  {%||%},
  {%|define(
    {%|autoconf_prerequisites|%},
    {%|dnl
ifelse(
  eval({%|$# < 1|%}),
  {%|1|%},
  {%|errprint(
{%|m4: error: |%}dnl
{%|autoconf_prerequisites requires at least 1 argument|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}m4exit({%|1|%})|%}){%||%}dnl
{%|]m4_ifdef(
  [$1_check_prerequisites],
  [dnl
m4_fatal(
m4_location[: error: ]dnl
[$1_check_prerequisites ]dnl
[is already defined]dnl
)[]dnl
])[dnl
]m4_define(
  [$1_check_prerequisites],
  [dnl|%}dnl
autoconf_prerequisites_helper(shift($@)){%|])[dnl
$1_check_prerequisites[]dnl|%}dnl
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
