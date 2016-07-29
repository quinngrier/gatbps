changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/texinfo.css|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
{%|/*
 * If you are reading this comment in an HTML file, then the CSS file
 * that originally held this comment has been embedded into this HTML
 * file by Texinfo. In this case, the "file" spoken of by this comment
 * is not this HTML file, but rather the original CSS file. Texinfo may
 * also have mixed the content of the original CSS file with the normal
 * HTML content that it produces, making it difficult to determine what
 * came from the original CSS file.
|%}header_comment({%| *|%}, {%| *|%}){%|
 *
 * Special file: texinfo.css
 *
 * The texinfo.css special file is a cascading style sheet that makes
 * Texinfo's HTML output look more like its TeX output. It can be used
 * with the --css-include option of texi2any to embed it into the style
 * sheet of the HTML output.
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
 * that originally held this comment has been embedded into this HTML
 * file by Texinfo. In this case, the "file" spoken of by this comment
 * is not this HTML file, but rather the original CSS file. Texinfo may
 * also have mixed the content of the original CSS file with the normal
 * HTML content that it produces, making it difficult to determine what
 * came from the original CSS file.
|%}footer_comment({%| *|%}, {%| *|%}, {%| */|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
