include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/contains_at_least_one_word|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
ifdef(
  {%|contains_at_least_one_word|%},
  {%||%},
  {%|define(
    {%|contains_at_least_one_word|%},
    {%|{%|{ \
  for x in \|%}dnl
ifelse(
  {%|{%|$1|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($1) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$2|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($2) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$3|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($3) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$4|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($4) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$5|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($5) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$6|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($6) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$7|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($7) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$8|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($8) \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$9|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    $|%}{%|($9) \|%}|%}){%||%}dnl
{%|
  ; do \
    'exit' '0'; \
  done; \
  'echo' \|%}dnl
ifelse(
  {%|{%|$1|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    '$|%}{%|$|%}{%|($1)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$2|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($2)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$3|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($3)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$4|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($4)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$5|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($5)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$6|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($6)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$7|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($7)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$8|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($8)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$9|%}|%},
  {%|{%||%}|%},
  {%|{%||%}|%},
  {%|{%|
    'and $|%}{%|$|%}{%|($9)' \|%}|%}){%||%}dnl
ifelse(
  {%|{%|$#|%}|%},
  {%|{%|1|%}|%},
  {%|{%|
    'is' \|%}|%},
  {%|{%|
    'are' \|%}|%}){%||%}dnl
{%|
    'not set' \
    >&2 \
  ; \
  'exit' '1'; \
:;}|%}|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl