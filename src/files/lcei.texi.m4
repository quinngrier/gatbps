changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/lcei.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/math_symbol.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: lcei.texi
@c
@c The lcei.texi special file defines the @lcei Texinfo macro, which can
@c be used to imitate the mathematical notation of TeX in the other
@c output formats. For example:
@c
@c       @tex
@c       $\lceil x \rceil$
@c       @end tex
@c       @ifnottex
@c       @w{@lcei{}@i{x}@rcei{}}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
|%}math_symbol(
  {%|lcei|%},
  {%|&#x2308;|%},
  {%|⌈|%},
  {%|ceil(|%}){%|
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
