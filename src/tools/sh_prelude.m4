include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/sh_prelude.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|sh_prelude|%},
  {%||%},
  {%|define(
    {%|sh_prelude|%},
    {%|dnl
ifelse(
  eval({%|$# < 0 || $# > 0|%}),
  {%|1|%},
  {%|dnl
errprint(
{%|m4: error: |%}dnl
{%|sh_prelude requires exactly 0 arguments|%}dnl
{%| ($# |%}dnl
ifelse({%|$#|%}, {%|1|%}, {%|{%|was|%}|%}, {%|{%|were|%}|%}){%||%}dnl
{%| given)|%}dnl
{%|
|%}){%||%}dnl errprint
m4exit({%|1|%})|%}){%||%}dnl
{%|

#-----------------------------------------------------------------------
# Locale
#-----------------------------------------------------------------------
#
# With LC_ALL=C, locale-aware programs use the C locale instead of the
# current locale. This is generally the best approach for code that is
# not deliberately designed to work in other locales, as other locales
# may have surprising behavior. The locale affects many programs, like
# awk, grep, sed, and this shell instance itself. For more information,
# see the C standard, the POSIX standard, and the GNU C Library manual.
#

LC_ALL=C
export LC_ALL

#-----------------------------------------------------------------------
# Newline characters
#-----------------------------------------------------------------------
#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'
readonly nl

#-----------------------------------------------------------------------

|%}include({%|src/sh/include/gatbps_barf.sh|%}){%|
|%}include({%|src/sh/include/gatbps_parse_opt.sh|%}){%|
|%}include({%|src/sh/include/gatbps_unknown_opt.sh|%}){%|
|%}include({%|src/sh/include/gatbps_warn.sh|%}){%|

#-----------------------------------------------------------------------

readonly sh_quote_script="
  s/'/'\\\\''/g
  1 s/^/'/
  \$ s/\$/'/
"

parse_options=:

#-----------------------------------------------------------------------

|%}dnl
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
