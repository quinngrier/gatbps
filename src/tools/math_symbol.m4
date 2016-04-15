ifdef(
  {%|math_symbol|%},
  {%||%},
  {%|define(
    {%|math_symbol|%},
    {%|{%|@ifclear $1texi
@set $1texi
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
$3
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
$3
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
$3
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
$3
@end macro
@end ifclear
@end ifhtml
@ifinfo
@ifnotplaintext
@macro $1{}
$3
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro $1{}
$3
@end macro
@end ifplaintext
@ifxml
@ifset txicommandconditionals
@ifcommanddefined inlineraw
@macro $1{}
@inlineraw{xml, $2}
@end macro
@end ifcommanddefined
@ifcommandnotdefined inlineraw
@macro $1{}
$3
@end macro
@end ifcommandnotdefined
@end ifset
@ifclear txicommandconditionals
@macro $1{}
$3
@end macro
@end ifclear
@end ifxml
@end ifclear
@ifset insertascii
@ifdocbook
@macro $1{}
$4
@end macro
@end ifdocbook
@ifhtml
@macro $1{}
$4
@end macro
@end ifhtml
@ifinfo
@ifnotplaintext
@macro $1{}
$4
@end macro
@end ifnotplaintext
@end ifinfo
@ifplaintext
@macro $1{}
$4
@end macro
@end ifplaintext
@ifxml
@macro $1{}
$4
@end macro
@end ifxml
@end ifset
@end ifclear|%}|%})|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
