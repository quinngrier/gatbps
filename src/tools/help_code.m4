include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/help_code.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|help_code|%},
  {%||%},
  {%|define(
    {%|help_code|%},
    {%|{%|            '--help=$1'|'--help='*'/$1')
              'cat' <<EOF1|%}
changequote({%|`|%}, {%|'|%})`'dnl
include(`doc/help/$1.hd.m4'){%|
EOF1
              case "$|%}{%|{?}" in
                '0')
                ;;
                *)
                  'cat' 0<<EOF1 1>&2;
$|%}{%|{fr2}gatbps!$|%}{%|{fR2} $|%}{%|{fB2}cat$|%}{%|{fR2} failed while reading from:
$|%}{%|{fr2}gatbps!$|%}{%|{fR2}   1. a here-document
$|%}{%|{fr2}gatbps!$|%}{%|{fR2} and writing to: standard output
EOF1
                  exit 1
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
