changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/rflo.texi.hd.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
{%|Special file: ${fB1}rflo.texi${fR1}

The ${fB1}rflo.texi${fR1} special file defines the ${fB1}@rflo${fR1} Texinfo macro, which can be
used to imitate the mathematical notation of TeX in the other output
formats. For example:

      @tex
      \$\\lfloor x \\rfloor\$
      @end tex
      @ifnottex
      @lflo{}@i{x}@rflo{}
      @end ifnottex

Try ${fB1}man gatbps${fR1} or ${fB1}info gatbps${fR1} for more information.|%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
