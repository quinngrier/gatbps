changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/java-test-wrapper.sh.im.in.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: java-test-wrapper.sh.im.in
#
# For more information, see the GATBPS manual.
#

|%}sh_prelude{%|

case "${CLASSPATH+is_set}" in
  ?*)
    CLASSPATH=@CLASSPATH_SEPARATOR_LATER@"${CLASSPATH}";
  ;;
esac;
CLASSPATH='{@}abs_builddir{@}/lib/*'"${CLASSPATH}";
'readonly' 'CLASSPATH';

class_name=`
  'basename' \
    "${0}" \
    '.sh' \
    0</dev/null \
  ;
`
case "${?}" in
  '0')
    ;;
  *)
    'exit' '99';
  ;;
esac;
'readonly' 'class_name';

'@JAVA_LATER@' \
  '-classpath' \
  "${CLASSPATH}" \
  'tests.'"${class_name}" \
;
'exit' "${?}";

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
