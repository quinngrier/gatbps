include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/substitution_comment_singular.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
ifdef(
  {%|substitution_comment_singular|%},
  {%||%},
  {%|define(
    {%|substitution_comment_singular|%},
    {%|{%|##
## The above substitution adds prerequisites to the below target, but
## Automake cannot see them because substitution occurs after Automake
## runs. If the below line were omitted and the target did not appear
## elsewhere, then Automake might not add it as a prerequisite to the
## corresponding non-local target, disconnecting the non-local target
## from the new prerequisites. This is why the below line is included.
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
