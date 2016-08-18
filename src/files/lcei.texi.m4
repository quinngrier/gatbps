changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/lcei.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: lcei.texi
@c
@c The lcei.texi special file defines the @lcei{} Texinfo macro, which
@c is used to imitate the mathematical notation of TeX in the other
@c output formats:
@c
@c       @tex
@c       $\lceil x \rceil$
@c       @end tex
@c       @ifnottex
@c       @lcei{}@i{x}@rcei{}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear lceitexi
@set lceitexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lcei{}
@inlineraw{docbook, &#x2308;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lcei{}
⌈
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lcei{}
⌈
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lcei{}
@inlineraw{html, &#x2308;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lcei{}
⌈
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lcei{}
⌈
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro lcei{}
⌈
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro lcei{}
⌈
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro lcei{}
@inlineraw{xml, &#x2308;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro lcei{}
⌈
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro lcei{}
⌈
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro lcei{}
ceil(
@end macro
@c )
@end ifdocbook
@ifhtml
@macro lcei{}
ceil(
@end macro
@c )
@end ifhtml
@ifinfo
@ifnotplaintext
@macro lcei{}
ceil(
@end macro
@c )
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro lcei{}
ceil(
@end macro
@c )
@end ifplaintext
@ifxml
@macro lcei{}
ceil(
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
