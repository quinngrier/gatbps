changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/rflo.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: rflo.texi
@c
@c The rflo.texi special file defines the @rflo Texinfo macro, which is
@c used to imitate the mathematical notation of TeX in the other output
@c formats:
@c
@c       @tex
@c       $\lfloor x \rfloor$
@c       @end tex
@c       @ifnottex
@c       @lflo{}@i{x}@rflo{}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear rflotexi
@set rflotexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro rflo{}
@inlineraw{docbook, &#x230B;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro rflo{}
⌋
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro rflo{}
⌋
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro rflo{}
@inlineraw{html, &#x230B;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro rflo{}
⌋
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro rflo{}
⌋
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro rflo{}
⌋
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro rflo{}
⌋
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro rflo{}
@inlineraw{xml, &#x230B;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro rflo{}
⌋
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro rflo{}
⌋
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@c (
@macro rflo{}
)
@end macro
@end ifdocbook
@ifhtml
@c (
@macro rflo{}
)
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@c (
@macro rflo{}
)
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@c (
@macro rflo{}
)
@end macro
@end ifplaintext
@ifxml
@c (
@macro rflo{}
)
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
