#
# This file was generated by GATBPS 0.1.0-5581+g298786dc, which was
# released on 2021-04-10. Before changing it, make sure
# you're doing the right thing. Depending on how GATBPS
# is being used, your changes may be automatically lost.
# A short description of this file follows.
#
# Special file: VERSION.sh
#
# For more information, see the GATBPS manual.
#



#
# With LC_ALL=C, locale-aware programs use the C locale instead of the
# current locale. This is generally the best approach for code that is
# not deliberately designed to work in other locales, as other locales
# may have surprising behavior. The locale affects many programs, like
# awk, grep, sed, and this shell instance itself. For more information,
# see the C standard, the POSIX standard, and the GNU C Library manual.
#

LC_ALL=C
readonly LC_ALL
export LC_ALL

#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

readonly nl='
'

readonly sh_quote_script="
  s/'/'\\\\''/g
  1 s/^/'/
  \$ s/\$/'/
"

parse_options=:

unknown_option() {
  case $1 in

    --*)
      x="
        s/'/'\\\\''/g
        1 s/^/'/
        /=/ {
          s/=.*/'/
          q
        }
        \$ s/\$/'/
      "
      x=`sed "$x" <<EOF2
$1
EOF2
      ` || exit
      eval x="$x"
      cat <<EOF2 >&2
$0: unknown option: $x
EOF2
      exit 1
    ;;

    -"$nl"*)
      cat <<EOF2 >&2
$0: unknown option: -

EOF2
      exit 1
    ;;

    -?*)
      option=`head -c 2 <<EOF2
$1
EOF2
      ` || exit
      cat <<EOF2 >&2
$0: unknown option: $option
EOF2
      exit 1
    ;;

  esac
}



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

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
