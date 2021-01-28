changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/recursion/java.am.rc.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/recursion_code.m4|%}){%||%}dnl
recursion_code(
  {%|java.am|%},
  {%|sh-form.sh|%},
  {%|echo.sh|%},
  {%|GATBPS_V_PAD.am|%},
  {%|GATBPS_RECIPE_MARKER.am|%},
  {%|GATBPS_PROG_MKDIR_P.m4|%},
  {%|GATBPS_PROG_JDEPS.m4|%},
  {%|GATBPS_PROG_JAVAC.m4|%},
  {%|GATBPS_PROG_JAR.m4|%},
  {%|GATBPS_PROG_AWK.m4|%},
  {%|GATBPS_DEFINE_javadir.m4|%},
  {%|GATBPS_DEFINE_JAVACFLAGS.m4|%},
  {%|GATBPS_DEFINE_JARFLAGS.m4|%},
  {%|GATBPS_DEFINE_CLASSPATH.m4|%},
  {%|GATBPS_CHECK_CLASSPATH_SEPARATOR.m4|%},
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
