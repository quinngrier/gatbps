changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: CC0-1.0-copying.texi
@c
@c The CC0-1.0-copying.texi special file invokes the @copying Texinfo
@c command with a message stating that the authors of the manual have
@c waived their rights to it by cross-referencing the appendix of the
@c CC0-1.0-appendix.texi special file. It can be included in another
@c Texinfo file where the @copying command is desired to appear.
@c
@end ifnotxml
@end ifxml
@ifdocbook
@copying
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication, see the appendix
labeled by the CC0 node. It may also be available at
@url{https://creativecommons.org/publicdomain/zero/1.0/}.
@end copying
@end ifdocbook
@ifhtml
@copying
@*
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication, see the appendix
labeled by the CC0 node. It may also be available at
<https://creativecommons.org/publicdomain/zero/1.0/>.
@*
@end copying
@end ifhtml
@ifinfo
@ifnotplaintext
@copying
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication, see the appendix
labeled by the CC0 node. It may also be available at
@url{https://creativecommons.org/publicdomain/zero/1.0/}.
@end copying
@end ifnotplaintext
@end ifinfo
@ifplaintext
@copying
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication,
@pxref{Creative Commons Zero 1-0}.
It may also be available at
@url{https://creativecommons.org/publicdomain/zero/1.0/}.
@end copying
@end ifplaintext
@iftex
@copying
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication,
@pxref{Creative Commons Zero 1-0}.
It may also be available at
@url{https://creativecommons.org/publicdomain/zero/1.0/}.
@end copying
@end iftex
@ifxml
@copying
The authors of this manual have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. For the full dedication, see the appendix
labeled by the CC0 node. It may also be available at
@url{https://creativecommons.org/publicdomain/zero/1.0/}.
@end copying
@end ifxml
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
