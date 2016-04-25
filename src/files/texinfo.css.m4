changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
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
 * For more information, see the GATBPS manual.
 */

body {
  margin: auto;
  max-width: 40em;
  padding: 1.46em;
  text-align: justify;
}

hr {
  border-bottom: none;
  border-left: none;
  border-right: none;
  border-top: 1px solid;
}

span.indent-immediately-following-paragraph + p {
  text-indent: 1.46em;
}

/*
 * If you are reading this comment in an HTML file, then the CSS file
 * that originally held this comment has been embedded into this HTML
 * file by Texinfo. In this case, the "file" spoken of by this comment
 * is not this HTML file, but rather the original CSS file. Texinfo may
 * also have mixed the content of the original CSS file with the normal
 * HTML content that it produces, making it difficult to determine what
 * came from the original CSS file.
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
