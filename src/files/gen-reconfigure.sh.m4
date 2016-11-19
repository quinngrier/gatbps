changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gen-reconfigure.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_TROFF.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/use_the_c_locale.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: gen-reconfigure.sh
#
# For more information, see the GATBPS manual.
#

'readonly' 'gen_reconfigure'
case "${gen_reconfigure}" in
  'no')
  ;;
  *)
    'echo' \
      'configure: reconfiguring for code generation' \
    || 'exit' "${?}"
    case "${#}" in
      '0')
        'sh' \
          '-' \
          "${srcdir}"'/../build-aux/sh-form.sh' \
          '--' \
          'env' \
          '-i' \
          'PATH='"${PATH}" \
          'gen_reconfigure=no' \
          'sh' \
          '-' \
          "${0}" \
        || 'exit' "${?}"
        'env' \
          '-i' \
          'PATH='"${PATH}" \
          'gen_reconfigure=no' \
          'sh' \
          '-' \
          "${0}" \
        ;
        'exit' "${?}"
      ;;
      *)
        'sh' \
          '-' \
          "${srcdir}"'/../build-aux/sh-form.sh' \
          '--' \
          'env' \
          '-i' \
          'PATH='"${PATH}" \
          'gen_reconfigure=no' \
          'sh' \
          '-' \
          "${0}" \
          "${@}" \
        || 'exit' "${?}"
        'env' \
          '-i' \
          'PATH='"${PATH}" \
          'gen_reconfigure=no' \
          'sh' \
          '-' \
          "${0}" \
          "${@}" \
        ;
        'exit' "${?}"
      ;;
    esac
  ;;
esac

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
