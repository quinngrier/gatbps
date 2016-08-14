changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/CC0-1.0-copying.texi.hd.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
{%|Special file: ${fB1}CC0-1.0-copying.texi${fR1}

The ${fB1}CC0-1.0-copying.texi${fR1} special file invokes the ${fB1}@copying${fR1} Texinfo
command with a message stating that the authors of the manual have
waived their rights to it by cross-referencing the appendix of the
${fB1}CC0-1.0-appendix.texi${fR1} special file. It can be included in a Texinfo
document where the invocation of the ${fB1}@copying${fR1} command is desired to
occur.

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
