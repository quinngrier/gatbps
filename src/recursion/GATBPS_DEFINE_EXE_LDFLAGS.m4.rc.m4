changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/recursion/GATBPS_DEFINE_EXE_LDFLAGS.m4.rc.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/recursion_code.m4|%}){%||%}dnl
recursion_code(
  {%|GATBPS_DEFINE_EXE_LDFLAGS.m4|%},
  {%|
            'set' '' "${prefix}"'gatbps_fatal.m4' "${@}"; 'shift'
            'set' '' "${prefix}"'CC0-1.0.txt' "${@}"; 'shift'
|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
