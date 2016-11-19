include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/check_macros_code.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|check_macros_code|%},
  {%||%},
  {%|define(
    {%|check_macros_code|%},
    {%|dnl
ifelse(
  eval({%|$# < 1|%}),
  {%|1|%},
  {%|dnl
errprint(
{%|m4: error: |%}dnl
{%|check_macros_code requires at least 1 argument|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}m4exit({%|1|%})|%}){%||%}dnl
ifelse(
  {%|$1|%},
  {%||%},
  {%|{%|
|%}|%},
  {%|{%|
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
[this means that there is a bug in GATBPS]dnl
)[]dnl
])[]dnl
$1_check_macros[]dnl|%}dnl
check_macros_code(shift($@)){%||%}dnl
|%})|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
