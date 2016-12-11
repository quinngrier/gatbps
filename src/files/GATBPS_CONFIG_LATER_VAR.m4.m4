changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_CONFIG_LATER_VAR.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CONFIG_LATER_VAR.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
AC_DEFUN([GATBPS_CONFIG_LATER_ADD], [dnl
[GATBPS_CONFIG_LATER_SCRIPT=]dnl
["$][{GATBPS_CONFIG_LATER_SCRIPT}"]dnl
[''\'';s'\''\'\'''\''{@}$1{@}'\''\'\'''\''$2'\''\'\'''\''g'\''']dnl
])[]dnl
AC_DEFUN([GATBPS_CONFIG_LATER_VAR], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_CONFIG_LATER_VAR macro for the $1 variable.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# != 1]),
  [1],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_VAR requires exactly 1 argument
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

case "$][{GATBPS_CONFIG_LATER_SCRIPT+is_set}" in
  ?*)
  ;;
  *)
    GATBPS_CONFIG_LATER_SCRIPT=''\''s/@\([A-Z_a-z][0-9A-Z_a-z]*\)@/{@}\1{@}/g'\'''
    ]GATBPS_CONFIG_LATER_ADD([AT], [@])[
    ]GATBPS_CONFIG_LATER_ADD([bindir], [$][(bindir)])[
    ]GATBPS_CONFIG_LATER_ADD([datadir], [$][(datadir)])[
    ]GATBPS_CONFIG_LATER_ADD([datarootdir], [$][(datarootdir)])[
    ]GATBPS_CONFIG_LATER_ADD([docdir], [$][(docdir)])[
    ]GATBPS_CONFIG_LATER_ADD([dvidir], [$][(dvidir)])[
    ]GATBPS_CONFIG_LATER_ADD([htmldir], [$][(htmldir)])[
    ]GATBPS_CONFIG_LATER_ADD([includedir], [$][(includedir)])[
    ]GATBPS_CONFIG_LATER_ADD([infodir], [$][(infodir)])[
    ]GATBPS_CONFIG_LATER_ADD([javadir], [$][(javadir)])[
    ]GATBPS_CONFIG_LATER_ADD([libdir], [$][(libdir)])[
    ]GATBPS_CONFIG_LATER_ADD([libexecdir], [$][(libexecdir)])[
    ]GATBPS_CONFIG_LATER_ADD([localedir], [$][(localedir)])[
    ]GATBPS_CONFIG_LATER_ADD([localstatedir], [$][(localstatedir)])[
    ]GATBPS_CONFIG_LATER_ADD([mandir], [$][(mandir)])[
    ]GATBPS_CONFIG_LATER_ADD([oldincludedir], [$][(oldincludedir)])[
    ]GATBPS_CONFIG_LATER_ADD([pdfdir], [$][(pdfdir)])[
    ]GATBPS_CONFIG_LATER_ADD([pkgdatadir], [$][(pkgdatadir)])[
    ]GATBPS_CONFIG_LATER_ADD([pkgincludedir], [$][(pkgincludedir)])[
    ]GATBPS_CONFIG_LATER_ADD([pkglibdir], [$][(pkglibdir)])[
    ]GATBPS_CONFIG_LATER_ADD([pkglibexecdir], [$][(pkglibexecdir)])[
    ]GATBPS_CONFIG_LATER_ADD([psdir], [$][(psdir)])[
    ]GATBPS_CONFIG_LATER_ADD([sbindir], [$][(sbindir)])[
    ]GATBPS_CONFIG_LATER_ADD([sharedstatedir], [$][(sharedstatedir)])[
    ]GATBPS_CONFIG_LATER_ADD([srcdir], [$][(srcdir)])[
    ]GATBPS_CONFIG_LATER_ADD([sysconfdir], [$][(sysconfdir)])[
  ;;
esac

]GATBPS_CONFIG_LATER_ADD([$1], [$][($1)])[

]dnl
[:;}]])[]dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
