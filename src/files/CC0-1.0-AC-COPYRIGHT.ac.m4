changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/CC0-1.0-AC-COPYRIGHT.ac|%})dnl
rules_code({%|src/tools/rules_code|%})dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: CC0-1.0-AC-COPYRIGHT.ac
dnl
dnl The CC0-1.0-AC-COPYRIGHT.ac special file calls the AC_COPYRIGHT
dnl Autoconf macro with a message stating that some parts of the script
dnl are from the package and that the authors of those parts have waived
dnl their rights to them by referencing the CC0-1.0.txt special file. It
dnl can be included in an Autoconf file where the AC_COPYRIGHT call is
dnl desired to occur.
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_COPYRIGHT(
[[Some parts of this file are from ]AC_PACKAGE_NAME[,
namely those with significant content from <configure.ac>.
The authors of these parts have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. You should have received a copy of the full
dedication along with this file, typically as a file
named <CC0-1.0.txt>. If not, it may be available at
<https://creativecommons.org/publicdomain/zero/1.0/>.
]])
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
