changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/CC0-1.0-appendix.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: bdots.texi
@c
@c The bdots.texi special file defines the @bdots{} Texinfo macro, which
@c is used to imitate the mathematical notation of TeX in the other
@c output formats:
@c
@c       @tex
@c       $1, \ldots, n$
@c       @end tex
@c       @ifnottex
@c       1, @bdots{}, @i{n}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear bdotstexi
@set bdotstexi
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro bdots{}
@inlineraw{docbook, &#x2026;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro bdots{}
…
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro bdots{}
…
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro bdots{}
@inlineraw{html, &#x2026;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro bdots{}
…
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro bdots{}
…
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro bdots{}
…
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro bdots{}
…
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro bdots{}
@inlineraw{xml, &#x2026;}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro bdots{}
…
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro bdots{}
…
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro bdots{}
.@:.@:.@:
@end macro
@end ifdocbook
@ifhtml
@macro bdots{}
.@:.@:.@:
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro bdots{}
.@:.@:.@:
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro bdots{}
.@:.@:.@:
@end macro
@end ifplaintext
@ifxml
@macro bdots{}
.@:.@:.@:
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