changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.ac.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|

dnl---------------------------------------------------------------------
dnl Program checks
dnl---------------------------------------------------------------------

m4_define(
  [GATBPS_PROG_],
  [[{ :

    ]AC_DEFUN([GATBPS_PROG_]$1, [[{ :

      ]m4_pushdef($1, m4_dquote($1))[

      ]AC_CHECK_PROGS(
        $1,
        m4_dquote(m4_normalize($2 $3)),
        m4_dquote(m4_normalize($2)))[

      ]AC_ARG_VAR(
        $1,
        m4_normalize($2)[ command])[

      ]AC_DEFINE_UNQUOTED(
        $1,
        "$$1",
        m4_normalize($2)[ command])[

      ]AM_CONDITIONAL(
        [HAVE_]$1,
        [[command -v "$]$1[" >/dev/null]])[

      ]m4_popdef($1)[

    }]])[

  }]])

GATBPS_PROG_([[ASCIIDOCTOR]],
  [[asciidoctor]],
  [[
  ]])

GATBPS_PROG_([[ASCIIDOCTOR_PDF]],
  [[asciidoctor-pdf]],
  [[
  ]])

GATBPS_PROG_ASCIIDOCTOR
GATBPS_PROG_ASCIIDOCTOR_PDF

dnl---------------------------------------------------------------------

m4_define(
  [GATBPS_LANG_PROGRAM],
  [[
    ]AC_LANG_SOURCE([[

      ]$1[

      #if 0

      #elif __clang__

        __attribute__((__optnone__))
        static void f() { ]$2[ }

      #elif __GNUC__

        __attribute__((__optimize__(0)))
        static void f() { ]$2[ }

      #else

        static void f() { ]$2[ }

      #endif

      int main() {
        f();
        return 0;
      }

    ]])[
  ]])

dnl---------------------------------------------------------------------

m4_define(
  [GATBPS_SOFT_REQUIRE],
  [m4_ifdef($1, [AC_REQUIRE($1)])])

m4_define(
  [GATBPS_SOFT_VAR_DEP],
  [m4_ifdef([DEFINE_]$1, [$1])])

dnl---------------------------------------------------------------------

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
