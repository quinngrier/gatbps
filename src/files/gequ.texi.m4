changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gequ.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: gequ.texi
@c
@c The gequ.texi special file defines the @gequ Texinfo macro, which can
@c be used to imitate the mathematical notation of TeX in the other
@c output formats. For example:
@c
@c       @tex
@c       $x \ge y$
@c       @end tex
@c       @ifnottex
@c       @w{@i{x} @gequ{} @i{y}}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear gequtexi
@set gequtexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro gequ{}
@inlineraw{docbook, &#x2265;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro gequ{}
≥
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro gequ{}
≥
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro gequ{}
@inlineraw{html, &#x2265;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro gequ{}
≥
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro gequ{}
≥
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro gequ{}
≥
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro gequ{}
≥
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro gequ{}
@inlineraw{xml, &#x2265;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro gequ{}
≥
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro gequ{}
≥
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro gequ{}
>=
@end macro
@end ifdocbook
@ifhtml
@macro gequ{}
>=
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro gequ{}
>=
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro gequ{}
>=
@end macro
@end ifplaintext
@ifxml
@macro gequ{}
>=
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
