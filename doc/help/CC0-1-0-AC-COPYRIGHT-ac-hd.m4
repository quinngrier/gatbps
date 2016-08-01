changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/CC0-1.0-AC-COPYRIGHT.ac.hd|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
{%|Special file: ${fB1}CC0-1.0-AC-COPYRIGHT.ac${fR1}

The ${fB1}CC0-1.0-AC-COPYRIGHT.ac${fR1} special file calls the ${fB1}AC_COPYRIGHT${fR1} Autoconf
macro with a message stating that some parts of the script are from the
package and that the authors of those parts have waived their rights to
them by referencing the ${fB1}CC0-1.0.txt${fR1} special file. It can be included in
an Autoconf file where the ${fB1}AC_COPYRIGHT${fR1} call is desired to occur.

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
