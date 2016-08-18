changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/sps.texi.hd.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
{%|Special file: ${fB1}sps.texi${fR1}

The ${fB1}sps.texi${fR1} special file defines the ${fB1}@sps{${fI1}L${fB1}, ${fI1}S${fB1}, ${fI1}R${fB1}}${fR1} Texinfo macro, which
inserts ${fI1}S${fR1} as a superscript in the output formats other than TeX. ${fI1}L${fR1} and ${fI1}R${fR1}
are ignored except in Info and plain text, in which they are inserted to
the left and right of ${fI1}S${fR1}, serving as parentheses. This is used to imitate
the mathematical notation of TeX in the other output formats:

      @tex
      \$x^{y + z^w}\$
      @end tex
      @ifnottex
      @i{x}@sps{(,@i{y} + @i{z}@sps{,@i{w},},)}
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
