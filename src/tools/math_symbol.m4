include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/math_symbol.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|math_symbol|%},
  {%||%},
  {%|define(
    {%|math_symbol|%},
    {%|{%|@ifclear $1texi
@set $1texi
@ifset insertascii
@ifnottex
@macro $1{}
@w{$4}
@end macro
@end ifnottex
@end ifset
@ifclear insertascii
@ifdocbook
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro $1{}
@inlineraw{docbook, $2}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro $1{}
@w{$3}
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
@w{$3}
@end macro
@end ifclear
@end ifdocbook
@ifhtml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro $1{}
@inlineraw{html, $2}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro $1{}
@w{$3}
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
@w{$3}
@end macro
@end ifclear
@end ifhtml
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro $1{}
@inlineraw{xml, $2}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro $1{}
@w{$3}
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
@w{$3}
@end macro
@end ifclear
@end ifxml
@ifnotdocbook
@ifnothtml
@ifnottex
@ifnotxml
@macro $1{}
@w{$3}
@end macro
@end ifnotxml
@end ifnottex
@end ifnothtml
@end ifnotdocbook
@end ifclear
@end ifclear|%}|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
