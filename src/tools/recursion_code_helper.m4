include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/recursion_code_helper.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|recursion_code_helper|%},
  {%||%},
  {%|define(
    {%|recursion_code_helper|%},
    {%|dnl
ifelse(
  eval({%|$# < 1|%}),
  {%|1|%},
  {%|dnl
errprint(
{%|m4: error: |%}dnl
{%|recursion_code_helper requires at least 1 argument|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}dnl errprint
m4exit({%|1|%})|%}){%||%}dnl
ifelse(
  {%|$1|%},
  {%||%},
  {%|{%||%}|%},
  {%|{%|

            case "$|%}{%|{#}" in
              '0')
                'set' 'dummy' "$|%}{%|{prefix}"'$1'
              ;;
              *)
                'set' 'dummy' "$|%}{%|{prefix}"'$1' "$|%}{%|{@}"
              ;;
            esac
            'shift'|%}dnl
recursion_code_helper(shift($@)){%||%}dnl
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
