changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
include({%|src/tools/math_symbol.m4|%})dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: msign.texi
@c
@c The msign.texi special file defines the @msign{} Texinfo macro, which
@c is used to imitate the mathematical notation of TeX in the other
@c output formats:
@c
@c       @tex
@c       $x - y$
@c       @end tex
@c       @ifnottex
@c       @i{x} @msign{} @i{y}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
|%}dnl
math_symbol(
  {%|msign|%},
  {%|&#x2212;|%},
  {%|−|%},
  {%|-|%})
footer_comment({%|@ifxml
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
