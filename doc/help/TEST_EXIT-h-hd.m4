changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/TEST_EXIT.h.hd|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
{%|Special file: ${fB1}TEST_EXIT.h${fR1}

The ${fB1}TEST_EXIT.h${fR1} special file is a C header file that defines the
${fB1}TEST_EXIT_ERROR${fR1}, ${fB1}TEST_EXIT_FAIL${fR1}, ${fB1}TEST_EXIT_PASS${fR1}, and ${fB1}TEST_EXIT_SKIP${fR1}
macros to ${fB1}99${fR1}, ${fB1}1${fR1}, ${fB1}0${fR1}, and ${fB1}77${fR1}, respectively. These are the exit status
values used by GNU Automake for a test suite with no test protocol.

Try ${fB1}man gatbps${fR1} or ${fB1}info gatbps${fR1} for more information.|%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
