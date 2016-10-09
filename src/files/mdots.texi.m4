changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/mdots.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: mdots.texi
@c
@c The mdots.texi special file defines the @mdots Texinfo macro, which
@c can be used to imitate the mathematical notation of TeX in the other
@c output formats. For example:
@c
@c       @tex
@c       $1 + \cdots + n$
@c       @end tex
@c       @ifnottex
@c       @w{1 + @mdots{} + @i{n}}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear mdotstexi
@set mdotstexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro mdots{}
@inlineraw{docbook, &#x22EF;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro mdots{}
⋯
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro mdots{}
⋯
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro mdots{}
@inlineraw{html, &#x22EF;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro mdots{}
⋯
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro mdots{}
⋯
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro mdots{}
⋯
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro mdots{}
⋯
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro mdots{}
@inlineraw{xml, &#x22EF;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro mdots{}
⋯
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro mdots{}
⋯
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro mdots{}
.@:.@:.@:
@end macro
@end ifdocbook
@ifhtml
@macro mdots{}
.@:.@:.@:
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro mdots{}
.@:.@:.@:
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro mdots{}
.@:.@:.@:
@end macro
@end ifplaintext
@ifxml
@macro mdots{}
.@:.@:.@:
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
