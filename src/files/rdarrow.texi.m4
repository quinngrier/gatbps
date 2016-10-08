changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/rdarrow.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/math_symbol.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: rdarrow.texi
@c
@c The rdarrow.texi special file defines the @rdarrow Texinfo macro,
@c which can be used to imitate the mathematical notation of TeX in the
@c other output formats. For example:
@c
@c       @tex
@c       $P \Rightarrow Q$
@c       @end tex
@c       @ifnottex
@c       @w{@i{P} @rdarrow{} @i{Q}}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
|%}math_symbol(
  {%|rdarrow|%},
  {%|&#x21D2;|%},
  {%|⇒|%},
  {%|=>|%}){%|
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
