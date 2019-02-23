include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/tools/generation_code.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
ifdef(
  {%|generation_code|%},
  {%||%},
  {%|define(
    {%|generation_code|%},
    {%|{%|          'no,$1'|'no,'*'/$1')
            cat >"$|%}{%|{safe_1}" <<'EOF1'|%}
changequote({%|`|%}, {%|'|%})`'dnl
include(`src/files/$1.m4'){%||%}dnl
{%|EOF1
            case "$|%}{%|{?}" in
              '0')
              ;;
              *)
                'cat' 0<<EOF1 1>&2;
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} $|%}{%|{fB2}cat$|%}{%|{fR2} failed while reading from:
$|%}{%|{fy2}gatbps:$|%}{%|{fR2}   1. a here-document
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} and writing to: $|%}{%|{fB2}$|%}{%|{1}$|%}{%|{fR2}
$|%}{%|{fy2}gatbps:$|%}{%|{fR2} generation failed: $|%}{%|{fB2}$|%}{%|{1}$|%}{%|{fR2}
EOF1
                exit_status='1'
                'break'
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
