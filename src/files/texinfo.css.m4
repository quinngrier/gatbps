changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/texinfo.css.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
{%|/*
 * If you are reading this comment in an HTML file, then the CSS file
 * that originally held this comment has been copied into this HTML file
 * by Texinfo. In this case, the "file" spoken of by this comment is not
 * this HTML file, but rather the original CSS file. The contents of the
 * original CSS file should be contained between this header comment and
 * the matching footer comment, which should be below, but be aware that
 * Texinfo may have reorganized things.
|%}header_comment({%| *|%}, {%| *|%}){%|
 *
 * Special file: texinfo.css
 *
 * The texinfo.css special file is a CSS file that makes Texinfo's HTML
 * output look more like its TeX output. It can be copied into the HTML
 * output by using the --css-include option of the texi2any program.
 *
 * For more information, see the GATBPS manual.
 */

blockquote table {
  border-spacing: 1.50em 0;
}

body {
  font-family: serif;
  margin: auto;
  max-width: 40em;
  padding: 1.50em;
  text-align: justify;
}

div.contents > ul > li > ul {
  margin: 0.25em 0;
}

div.contents > ul > li > ul li {
  margin: 0;
}

div.shortcontents li {
  margin: 0;
}

hr {
  display: none;
}

li {
  margin: 0.75em 0;
}

span.indent-immediately-following-paragraph + p {
  text-indent: 1.50em;
}

/*
 * If you are reading this comment in an HTML file, then the CSS file
 * that originally held this comment has been copied into this HTML file
 * by Texinfo. In this case, the "file" spoken of by this comment is not
 * this HTML file, but rather the original CSS file. The contents of the
 * original CSS file should be contained between this footer comment and
 * the matching header comment, which should be above, but be aware that
 * Texinfo may have reorganized things.
|%}footer_comment({%| *|%}, {%| *|%}, {%| */|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
