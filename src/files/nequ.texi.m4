changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/nequ.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: nequ.texi
@c
@c The nequ.texi special file defines the @nequ Texinfo macro, which is
@c used to imitate the mathematical notation of TeX in the other output
@c formats:
@c
@c       @tex
@c       $x \ne y$
@c       @end tex
@c       @ifnottex
@c       @i{x} @nequ{} @i{y}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear nequtexi
@set nequtexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro nequ{}
@inlineraw{docbook, &#x2260;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro nequ{}
≠
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro nequ{}
≠
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro nequ{}
@inlineraw{html, &#x2260;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro nequ{}
≠
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro nequ{}
≠
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro nequ{}
≠
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro nequ{}
≠
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro nequ{}
@inlineraw{xml, &#x2260;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro nequ{}
≠
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro nequ{}
≠
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro nequ{}
!=
@end macro
@end ifdocbook
@ifhtml
@macro nequ{}
!=
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro nequ{}
!=
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro nequ{}
!=
@end macro
@end ifplaintext
@ifxml
@macro nequ{}
!=
@end macro
@end ifxml
@end ifset
@end ifclear
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
