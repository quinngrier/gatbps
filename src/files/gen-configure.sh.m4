changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gen-configure.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_TROFF.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: gen-configure.sh
#
# For more information, see the GATBPS manual.
#

case ${GATBPS_GEN_CONFIGURE_BOOTSTRAP-} in
  '')
    cat <<'EOF2' || exit $?
configure: preparing environment for code generation
EOF2

    xs=GATBPS_GEN_CONFIGURE_BOOTSTRAP=x
    for x in \
      GATBPS_DONE_COPYING_SOURCE_DIRECTORY \
      GATBPS_DONE_NORMALIZING_TIMESTAMPS \
      PATH \
      TEMP \
      TMP \
    ; do
      eval 'xs=$xs${'$x'+ '$x'=\"\$'$x'\"}'
    done

    eval 'env -i '"$xs"' sh - "$0" --prefix="${prefix?}"'
    exit $?
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
