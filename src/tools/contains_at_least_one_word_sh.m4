include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/contains_at_least_one_word_sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|contains_at_least_one_word_sh|%},
  {%||%},
  {%|define(
    {%|contains_at_least_one_word_sh|%},
    {%|dnl
ifelse(
  {%|$#|%}, {%|1|%}, {%||%},
  {%|$#|%}, {%|2|%}, {%||%},
  {%|$#|%}, {%|3|%}, {%||%},
  {%|$#|%}, {%|4|%}, {%||%},
  {%|$#|%}, {%|5|%}, {%||%},
  {%|$#|%}, {%|6|%}, {%||%},
  {%|$#|%}, {%|7|%}, {%||%},
  {%|$#|%}, {%|8|%}, {%||%},
  {%|$#|%}, {%|9|%}, {%||%},
  {%|errprint(
{%|m4: error: |%}dnl
{%|contains_at_least_one_word_sh requires exactly 1, 2, 3, 4, 5, |%}dnl
{%|6, 7, 8, or 9 arguments|%}dnl
{%|
|%})m4exit({%|1|%})|%}){%||%}dnl
{%|{ \
  for x in \|%}dnl
ifelse(
  {%|$1|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($1) \|%}|%}){%||%}dnl
ifelse(
  {%|$2|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($2) \|%}|%}){%||%}dnl
ifelse(
  {%|$3|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($3) \|%}|%}){%||%}dnl
ifelse(
  {%|$4|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($4) \|%}|%}){%||%}dnl
ifelse(
  {%|$5|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($5) \|%}|%}){%||%}dnl
ifelse(
  {%|$6|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($6) \|%}|%}){%||%}dnl
ifelse(
  {%|$7|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($7) \|%}|%}){%||%}dnl
ifelse(
  {%|$8|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($8) \|%}|%}){%||%}dnl
ifelse(
  {%|$9|%},
  {%||%},
  {%||%},
  {%|{%|
    $|%}{%|][($9) \|%}|%}){%||%}dnl
{%|
  ; do \
    '\''exit'\'' '\''0'\''; \
  done; \
  '\''echo'\'' \
    '\''error:'\'' \|%}dnl
ifelse(
  {%|$1|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|1|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($1)'\'' \|%}|%},
  {%|$#|%},
  {%|2|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($1)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($1),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$2|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|2|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($2)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($2),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$3|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|3|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($3)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($3),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$4|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|4|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($4)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($4),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$5|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|5|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($5)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($5),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$6|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|6|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($6)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($6),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$7|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|7|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($7)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($7),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$8|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|8|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($8)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($8),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$9|%},
  {%||%},
  {%||%},
  {%|$#|%},
  {%|9|%},
  {%|{%|
    '\''and $|%}{%|][$|%}{%|][($9)'\'' \|%}|%},
  {%|{%|
    '\''$|%}{%|][$|%}{%|][($9),'\'' \|%}|%}){%||%}dnl
ifelse(
  {%|$#|%},
  {%|1|%},
  {%|{%|
    '\''is'\'' \|%}|%},
  {%|$#|%},
  {%|2|%},
  {%|{%|
    '\''are both'\'' \|%}|%},
  {%|{%|
    '\''are all'\'' \|%}|%}){%||%}dnl
{%|
    '\''not set'\'' \
    >&2 \
  ; \
  '\''exit'\'' '\''1'\''; \
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
