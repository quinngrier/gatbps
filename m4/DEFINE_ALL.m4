AC_DEFUN([DEFINE_ALL], [[{

#
# The block that contains this comment is the expansion of the
# DEFINE_ALL macro.
#]dnl
m4_ifdef(
  [DEFINE_ALL_HAS_BEEN_CALLED],
  [gatbps_fatal([
    DEFINE_ALL has already been called
  ])],
  [m4_define([DEFINE_ALL_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    DEFINE_ALL requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]AC_REQUIRE([DEFINE_docbookdir])[
]AC_REQUIRE([DEFINE_plaintextdir])[
]AC_REQUIRE([DEFINE_xmldir])[

]AC_REQUIRE([DEFINE_AWK])[
]AC_REQUIRE([DEFINE_MAKEINFO])[
]AC_REQUIRE([DEFINE_MKDIR_P])[
]AC_REQUIRE([DEFINE_SED])[
]AC_REQUIRE([DEFINE_TEXI2ANY])[
]AC_REQUIRE([DEFINE_TEXI2DVIFLAGS])[
]AC_REQUIRE([DEFINE_enable_SHEBANG_LINES])[

]AC_REQUIRE([DEFINE_AT])[
]AC_REQUIRE([DEFINE_AWK_SH])[
]AC_REQUIRE([DEFINE_EXEEXT])[
]AC_REQUIRE([DEFINE_SED_SH])[
]AC_REQUIRE([DEFINE_SHEBANG_LINE])[

:;}]])[]dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
