include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/footer_comment.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|footer_comment|%},
  {%||%},
  {%|define(
    {%|footer_comment|%},
    {%|{%|$1
$2 The authors of this file have waived all copyright and
$2 related or neighboring rights to the extent permitted by
$2 law as described by the CC0 1.0 Universal Public Domain
$2 Dedication. You should have received a copy of the full
$2 dedication along with this file, typically as a file
$2 named <CC0-1.0.txt>. If not, it may be available at
$2 <https://creativecommons.org/publicdomain/zero/1.0/>.
$3|%}|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
