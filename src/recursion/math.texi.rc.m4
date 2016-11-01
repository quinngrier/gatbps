changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/recursion/math.texi.rc.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/recursion_code.m4|%}){%||%}dnl
recursion_code(
  {%|math.texi|%},
  {%|tprm.texi|%},
  {%|sps.texi|%},
  {%|sbs.texi|%},
  {%|rflo.texi|%},
  {%|rdarrow.texi|%},
  {%|rcei.texi|%},
  {%|rarrow.texi|%},
  {%|qprm.texi|%},
  {%|prm.texi|%},
  {%|nequ.texi|%},
  {%|msign.texi|%},
  {%|mdots.texi|%},
  {%|mdot.texi|%},
  {%|lrdarrow.texi|%},
  {%|lrarrow.texi|%},
  {%|lldarrow.texi|%},
  {%|llarrow.texi|%},
  {%|lflo.texi|%},
  {%|lequ.texi|%},
  {%|ldarrow.texi|%},
  {%|lcei.texi|%},
  {%|lbdarrow.texi|%},
  {%|lbarrow.texi|%},
  {%|larrow.texi|%},
  {%|insertmathjax.texi|%},
  {%|insertascii.texi|%},
  {%|gequ.texi|%},
  {%|dslash.texi|%},
  {%|dprm.texi|%},
  {%|bdots.texi|%},
  {%|bdarrow.texi|%},
  {%|barrow.texi|%},
  {%|CC0-1.0.txt|%},
  {%||%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
