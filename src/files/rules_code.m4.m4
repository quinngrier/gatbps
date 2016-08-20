changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/rules_code.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%||%}dnl
changequote({%|`|%}, {%|'|%})`
dnl
dnl Special file: rules_code.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
ifdef(
  {%|rules_code|%},
  {%||%},
  {%|define(
    {%|rules_code|%},
    {%|ifdef(
      {%|make_rules|%},
      {%|ifdef(
        {%|rules_target|%},
        {%|divert({%|0|%})rules_target{%|: $1
$1:
|%}|%},
        {%|define(
          {%|rules_target|%},
          {%|{%|$1out|%}|%})|%})divert({%|-1|%})|%},
      {%||%}){%||%}dnl
|%})|%}){%||%}dnl
'changequote(`{%|', `|%}'){%||%}dnl
footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
