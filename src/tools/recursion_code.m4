include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/recursion_code.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/recursion_code_helper.m4|%}){%||%}dnl
ifdef(
  {%|recursion_code|%},
  {%||%},
  {%|define(
    {%|recursion_code|%},
    {%|{%|          '$1' | *'/$1')

            case "$|%}{%|{1}" in
              '$1')
                prefix=''
              ;;
              *'/$1')
                x=`'eval' "$|%}{%|{sed}"' "
                  s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
                  1s/^/prefix='\\''/
                  \\$|%}{%|s/$1\\$|%}{%|/'\\''/
                "' <<EOF1
$|%}{%|{1}
EOF1
`
                case "$|%}{%|{?}" in
                  '0')
                  ;;
                  *)
                    'cat' 0<<EOF1 1>&2;
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} $|%}{%|{fB2}$|%}{%|{sed}$|%}{%|{fR2} failed while reading from:
$|%}{%|{fy2}gatbps:$|%}{%|{fR2}   1. a here-document
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} and writing to: a command substitution
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} recursion failed: $|%}{%|{fB2}$|%}{%|{1}$|%}{%|{fR2}
EOF1
                    exit_status='1'
                    'break' # recursion
                  ;;
                esac
                'eval' "$|%}{%|{x}"
              ;;
            esac

            'shift'|%}dnl
recursion_code_helper(shift($@)){%||%}dnl
{%|

            case "$|%}{%|{#}" in
              '0')
                'set' 'dummy'
              ;;
              *)
                'set' 'dummy' "$|%}{%|{@}"
              ;;
            esac

          ;;|%}|%})|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
