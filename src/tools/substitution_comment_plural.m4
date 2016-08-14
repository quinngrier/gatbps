include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/substitution_comment_plural.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
ifdef(
  {%|substitution_comment_plural|%},
  {%||%},
  {%|define(
    {%|substitution_comment_plural|%},
    {%|{%|##
## The above substitution adds prerequisites to the below targets, but
## Automake cannot see them because substitution occurs after Automake
## runs. If the below lines were omitted and the targets did not appear
## elsewhere, then Automake might not add them as prerequisites to the
## corresponding non-local targets, disconnecting the non-local targets
## from the new prerequisites. This is why the below lines are included.
##|%}|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
