changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/recursion/math.texi.rc.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/recursion_code.m4|%}){%||%}dnl
recursion_code(
  {%|math.texi|%},
  {%|
            'set' '' "${prefix}"'tprm.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'sps.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'sbs.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'rflo.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'rdarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'rcei.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'rarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'qprm.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'prm.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'nequ.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'msign.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'mdots.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'mdot.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lrdarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lrarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lldarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'llarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lflo.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lequ.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'ldarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lcei.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lbdarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'lbarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'larrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'insertmathjax.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'insertascii.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'gequ.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'dslash.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'dprm.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'bdots.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'bdarrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'barrow.texi' "${@}"; 'shift'
            'set' '' "${prefix}"'CC0-1.0.txt' "${@}"; 'shift'
|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
