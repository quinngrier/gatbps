changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/dslash.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: dslash.texi
@c
@c The dslash.texi special file defines the @dslash{} Texinfo macro,
@c which is used to imitate the mathematical notation of TeX in the
@c other output formats:
@c
@c       @tex
@c       $x / y$
@c       @end tex
@c       @ifnottex
@c       @i{x} @dslash{} @i{y}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear dslashtexi
@set dslashtexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro dslash{}
@inlineraw{docbook, &#x2215;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro dslash{}
∕
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro dslash{}
∕
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro dslash{}
@inlineraw{html, &#x2215;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro dslash{}
∕
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro dslash{}
∕
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro dslash{}
∕
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro dslash{}
∕
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro dslash{}
@inlineraw{xml, &#x2215;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro dslash{}
∕
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro dslash{}
∕
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro dslash{}
/
@end macro
@end ifdocbook
@ifhtml
@macro dslash{}
/
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro dslash{}
/
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro dslash{}
/
@end macro
@end ifplaintext
@ifxml
@macro dslash{}
/
@end macro
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
