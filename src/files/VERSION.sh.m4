changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/VERSION.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/portable_shell_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: VERSION.sh
#
# For more information, see the GATBPS manual.
#

|%}portable_shell_prelude{%|

readonly git=" ${GIT:-git}"
readonly sed=" ${SED:-sed}"

v_prefix=v
u_prefix=u

if test -f build-aux/VERSION; then

  cat build-aux/VERSION || exit $?

elif test -f VERSION; then

  cat VERSION || exit $?

elif eval "$git"' ls-files --error-unmatch "$0"' >/dev/null 2>&1; then

  v_description=`
    git \
      describe \
      --candidates=1 \
      --match="v[0-9]*.[0-9]*.[0-9]*" \
      --tags \
    ;
  `
  s=$?
  readonly v_description

  case $s in
    0)
    ;;
    *)
      cat <<EOF2 >&2
${fr2}VERSION.sh!$fR2 error calculating a $v_prefix* description
${fr2}VERSION.sh!$fR2 did you forget to create/push some tags?
EOF2
      exit 1
    ;;
  esac

  case "${v_description}" in
    *'-'*)
      grep \
        '^v[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}-[0-9]\{1,\}-g[0-9a-f]\{7,\}$' \
        0<<EOF2 \
        1>/dev/null \
      ;
${v_description}
EOF2
      case "${?}" in
        '0')
        ;;
        '1')
          exit 1
        ;;
        *)
          exit 1
        ;;
      esac
    ;;
    *)
      grep \
        '^v[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}$' \
        0<<EOF2 \
        1>/dev/null \
      ;
${v_description}
EOF2
      case "${?}" in
        '0')
        ;;
        '1')
          exit 1
        ;;
        *)
          exit 1
        ;;
      esac
    ;;
  esac
  grep \
    '^v0[0-9]' \
    0<<EOF2 \
    1>/dev/null \
  ;
${v_description}
EOF2
  case "${?}" in
    '0')
      exit 1
    ;;
    '1')
    ;;
    *)
      exit 1
    ;;
  esac
  grep \
    '^v.*[-.]0[0-9]' \
    0<<EOF2 \
    1>/dev/null \
  ;
${v_description}
EOF2
  case "${?}" in
    '0')
      exit 1
    ;;
    '1')
    ;;
    *)
      exit 1
    ;;
  esac
  case "${v_description}" in
    *'-'*)
      u_description=`
        git \
          'describe' \
          '--candidates=1' \
          '--long' \
          '--match=u[0-9]*.[0-9]*.[0-9]*' \
          '--tags' \
        ;
      `
      case "${?}" in
        '0')
        ;;
        *)
          exit 1
        ;;
      esac
      'readonly' 'u_description'
      grep \
        '^u[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}-[0-9]\{1,\}-g[0-9a-f]\{7,\}$' \
        0<<EOF2 \
        1>/dev/null \
      ;
${u_description}
EOF2
      case "${?}" in
        '0')
        ;;
        '1')
          exit 1
        ;;
        *)
          exit 1
        ;;
      esac
      grep \
        '^u0[0-9]' \
        0<<EOF2 \
        1>/dev/null \
      ;
${u_description}
EOF2
      case "${?}" in
        '0')
          exit 1
        ;;
        '1')
        ;;
        *)
          exit 1
        ;;
      esac
      grep \
        '^u.*[-.]0[0-9]' \
        0<<EOF2 \
        1>/dev/null \
      ;
${u_description}
EOF2
      case "${?}" in
        '0')
          exit 1
        ;;
        '1')
        ;;
        *)
          exit 1
        ;;
      esac
      v_tag=`
        git \
          'describe' \
          '--abbrev=0' \
          '--candidates=1' \
          '--match=v[0-9]*.[0-9]*.[0-9]*' \
          '--tags' \
        ;
      `
      case "${?}" in
        '0')
        ;;
        *)
          exit 1
        ;;
      esac
      'readonly' 'v_tag'
      u_tag=`
        git \
          'describe' \
          '--abbrev=0' \
          '--candidates=1' \
          '--match=u[0-9]*.[0-9]*.[0-9]*' \
          '--tags' \
        ;
      `
      case "${?}" in
        '0')
        ;;
        *)
          exit 1
        ;;
      esac
      'readonly' 'u_tag'
      git \
        'merge-base' \
        '--is-ancestor' \
        "${v_tag}" \
        "${u_tag}" \
      ;
      case "${?}" in
        '0')
        ;;
        '1')
          exit 1
        ;;
        *)
          exit 1
        ;;
      esac
      sed '
        s/^u//
        s/-g/+g/
      ' 0<<EOF2
${u_description}
EOF2
      case "${?}" in
        '0')
        ;;
        *)
          exit 1
        ;;
      esac
    ;;
    *)
      sed '
        s/^v//
      ' 0<<EOF2
${v_description}
EOF2
      case "${?}" in
        '0')
        ;;
        *)
          exit 1
        ;;
      esac
    ;;
  esac

else

  cat <<EOF2 >&2
VERSION.sh: no cache file or repository found
EOF2
  exit 1

fi

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
