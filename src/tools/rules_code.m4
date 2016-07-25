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
|%}|%},
        {%|define(
          {%|rules_target|%},
          {%|{%|$1|%}|%})|%})divert({%|-1|%})|%},
      {%||%})dnl
|%})|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
