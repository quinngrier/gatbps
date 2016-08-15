changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/configure.ac.vim.hd.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
{%|Special file: ${fB1}CC0-1.0-AM-COPYRIGHT.am${fR1}

The ${fB1}CC0-1.0-AM-COPYRIGHT.am${fR1} special file contains an Automake comment
that states that some parts of the ${fB1}Makefile${fR1} are from the package, and
that the authors of those parts have waived their rights to them by
referencing the ${fB1}CC0-1.0.txt${fR1} special file. This can be included in
another Automake file with the ${fB1}include${fR1} directive where the comment is
desired to appear.

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
