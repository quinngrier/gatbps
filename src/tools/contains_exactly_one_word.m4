include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/contains_exactly_one_word|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
ifdef(
  {%|contains_exactly_one_word|%},
  {%||%},
  {%|define(
    {%|contains_exactly_one_word|%},
    {%|{%|{ \
  x=''; \
  for y in $|%}{%|($1); do \
    x="$|%}{%|$|%}{%|{x}"'x'; \
    case "$|%}{%|$|%}{%|{x}" in \
      ??*) \
        'echo' \
          '$|%}{%|$|%}{%|($1)' \
          'contains multiple words' \
          >&2 \
        ; \
        'exit' '1'; \
      ;; \
    esac; \
  done; \
  case "$|%}{%|$|%}{%|{x}" in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'echo' \
    '$|%}{%|$|%}{%|($1)' \
    'is not set' \
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
