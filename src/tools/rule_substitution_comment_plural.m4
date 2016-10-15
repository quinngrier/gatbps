include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/rule_substitution_comment_plural.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
ifdef(
  {%|rule_substitution_comment_plural|%},
  {%||%},
  {%|define(
    {%|rule_substitution_comment_plural|%},
    {%|{%|##
## The substitution above may add prerequisites to some of the targets
## below, but Automake cannot see this because substitution runs after
## Automake. If Automake does not see the targets at all, then it will
## not add them as prerequisites to the corresponding non-local targets,
## which leaves any new prerequisites disconnected. The rules below are
## included to ensure that Automake sees the targets.
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
