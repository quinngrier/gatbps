changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/CC0-1.0-appendix.texi.hd.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
{%|Special file: ${fB1}CC0-1.0-appendix.texi${fR1}

The ${fB1}CC0-1.0-appendix.texi${fR1} special file is a Texinfo appendix that
contains the complete text of the Creative Commons Zero (CC0) 1.0
Universal Public Domain Dedication. It can be included in a Texinfo
document where the appendix is desired to appear. The appendix is
labeled with ${fB1}@node Creative Commons Zero@tie{}@w{1-0}${fR1} so that it
maintains the usual node structure and can be cross-referenced.

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
