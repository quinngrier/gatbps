changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/help/texinfo.css.hd|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
{%|Special file: ${fB1}texinfo.css${fR1}

The ${fB1}texinfo.css${fR1} special file is a cascading style sheet that makes
Texinfo's HTML output look more like its TeX output. It can be used with
the ${fB1}--css-include${fR1} option of ${fB1}texi2any${fR1} to embed it into the style sheet of
the HTML output.

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
