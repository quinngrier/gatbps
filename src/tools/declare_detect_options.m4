include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/declare_detect_options.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|declare_detect_options|%},
  {%||%},
  {%|define(
    {%|declare_detect_options|%},
    {%|dnl
ifelse(
  eval({%|$# < 0 || $# > 0|%}),
  {%|1|%},
  {%|dnl
errprint(
{%|m4: error: |%}dnl
{%|declare_detect_options requires exactly 0 arguments|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}dnl errprint
m4exit({%|1|%})|%}){%||%}dnl
{%|#
# The detect_options variable is set to "yes" if the arguments are being
# scanned for options, or "no" if not. It starts off as "yes" and is set
# to "no" upon finding the -- option.
#

detect_options=yes|%}dnl
|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
