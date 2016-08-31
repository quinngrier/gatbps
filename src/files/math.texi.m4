changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/math.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: math.texi
@c
@c The math.texi special file is a Texinfo file that includes every
@c special file that defines a macro for imitating the mathematical
@c notation of TeX in the other output formats.
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@include bdots.texi
@include dslash.texi
@include gequ.texi
@include lcei.texi
@include lequ.texi
@include lflo.texi
@include mdot.texi
@include mdots.texi
@include msign.texi
@include nequ.texi
@include prm.texi
@include rarrow.texi
@include rcei.texi
@include rflo.texi
@include sbs.texi
@include sps.texi
|%}footer_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}, {%|@c
@end ifnotxml
@end ifxml|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
