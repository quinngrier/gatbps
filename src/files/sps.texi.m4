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
@c Special file: sps.texi
@c
@c The sps.texi special file defines the @sps{L, S, R} Texinfo macro,
@c which inserts S as a superscript in the output formats other than
@c TeX. L and R are ignored except in Info and plain text, in which they
@c are inserted to the left and right of S, serving as parentheses. This
@c is used to imitate the mathematical notation of TeX in the other
@c output formats:
@c
@c       @tex
@c       $x^{y + z^w}$
@c       @end tex
@c       @ifnottex
@c       @i{x}@sps{(,@i{y} + @i{z}@sps{,@i{w},},)}
@c       @end ifnottex
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@ifclear spstexi
@set spstexi
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sps{L, S, R}
@inlineraw{docbook, <superscript>}\S\@inlineraw{docbook, </superscript>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sps{L, S, R}
@inlineraw{html, <sup>}\S\@inlineraw{html, </sup>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@rmacro sps{L, S, R}
@inlineraw{xml, <sup>}\S\@inlineraw{xml, </sup>}
@end rmacro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@rmacro sps{L, S, R}
^\L\\S\\R\
@end rmacro
@end ifclear
@end ifxml
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
