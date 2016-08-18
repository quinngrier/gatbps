changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/lflo.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: lflo.texi
@c
@c The lflo.texi special file defines the @lflo{} Texinfo macro, which
@c is used to imitate the mathematical notation of TeX in the other
@c output formats:
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
@ifclear lflotexi
@set lflotexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lflo{}
@inlineraw{docbook, &#x230A;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lflo{}
⌊
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lflo{}
⌊
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lflo{}
@inlineraw{html, &#x230A;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lflo{}
⌊
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lflo{}
⌊
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro lflo{}
⌊
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro lflo{}
⌊
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lflo{}
@inlineraw{xml, &#x230A;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lflo{}
⌊
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lflo{}
⌊
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro lflo{}
floor(
@end macro
@c )
@end ifdocbook
@ifhtml
@macro lflo{}
floor(
@end macro
@c )
@end ifhtml
@ifinfo
@ifnotplaintext
@macro lflo{}
floor(
@end macro
@c )
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro lflo{}
floor(
@end macro
@c )
@end ifplaintext
@ifxml
@macro lflo{}
floor(
@end macro
@c )
@end ifxml
@end ifset
@end ifclear
|%}footer_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}, {%|@c
@end ifnotxml
@end ifxml|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
