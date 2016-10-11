changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/sbs.texi.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: sbs.texi
@c
@c The sbs.texi special file defines the @sbs{L, S, R} Texinfo macro,
@c which inserts S as a subscript in the output formats other than TeX.
@c L and R are ignored except in Info and plain text, in which they are
@c inserted to the left and right of S, serving as parentheses. This is
@c used to imitate the mathematical notation of TeX in the other output
@c formats:
@c
@c       @tex
@c       $x_{y + z_w}$
@c       @end tex
@c       @ifnottex
@c       @w{@i{x}@sbs{(,@i{y} + @i{z}@sbs{,@i{w},},)}}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear sbstexi
@set sbstexi
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sbs{L, S, R}
@inlineraw{docbook, <subscript>}\S\@inlineraw{docbook, </subscript>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sbs{L, S, R}
@inlineraw{html, <sub>}\S\@inlineraw{html, </sub>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifclear
@end ifhtml
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sbs{L, S, R}
@inlineraw{xml, <sub>}\S\@inlineraw{xml, </sub>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifclear
@end ifxml
@ifnotdocbook
@ifnothtml
@ifnottex
@ifnotxml
@rmacro sbs{L, S, R}
_\L\\S\\R\
@end rmacro
@end ifnotxml
@end ifnottex
@end ifnothtml
@end ifnotdocbook
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
