changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/INPUT_FILTER.sh.in.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: INPUT_FILTER.sh.in
#
# For more information, see the GATBPS manual.
#

|%}sh_prelude{%|

@AWK@ '
  BEGIN {
    in_javadoc_code_block = 0;
  }
  {
    gsub(/final\/\*def\*\//, "", $0);
    gsub(/<code><!--#-->/, "<code>#", $0);
    gsub(/<code><!--::-->/, "<code>::", $0);
    if (in_javadoc_code_block) {
      sub(/^[	 ]*\*/, "& ", $0);
      if ($0 ~ /^[	 ]*\* <\/pre><\/blockquote>$/) {
        sub(/<\/pre><\/blockquote>$/, "@AT@endcode", $0);
        in_javadoc_code_block = 0;
      } else {
        gsub(/<b><\/b>/, "", $0);
        gsub(/&lt;/, "<", $0);
        gsub(/&gt;/, ">", $0);
        gsub(/&#64;/, "@AT@", $0);
        gsub(/&#92;/, "\\", $0);
        gsub(/&amp;/, "\\&", $0);
      }
    } else {
      gsub(/&#64;/, "@AT@@AT@", $0);
      gsub(/&#92;/, "@AT@\\", $0);
      if ($0 ~ /^[	 ]*\*<!--code.*--><blockquote><pre>$/) {
        sub(/<!--/, " @AT@", $0);
        sub(/--><blockquote><pre>$/, "", $0);
        in_javadoc_code_block = 1;
      } else if ($0 ~ / @AT@see ["<]/) {
      } else if ($0 ~ / @AT@see /) {
        sub(/ @AT@see /, " @AT@see <code>", $0);
        $0 = $0 "</code>";
      } else if ($0 ~ / @AT@throws /) {
        sub(/ @AT@throws /, " @AT@throws <code>", $0);
        $0 = $0 "</code>";
      }
    }
    print $0;
  }
' <"${1}"

|%}footer_comment({%|#|%}, {%|#|%}, {%|#|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
