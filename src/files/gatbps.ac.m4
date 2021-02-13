changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.ac.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|

dnl---------------------------------------------------------------------
dnl gatbps_protect
dnl---------------------------------------------------------------------

m4_define([gatbps_protect],
  [m4_if(
    m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*]),
    [-1],
    [],
    [m4_ignore(
      m4_pushdef(
        m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*], [[\&]]),
        m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*], [[[\&]]]))
      gatbps_protect(
        m4_bregexp(
          m4_bpatsubst(
            [$*],
            [[^a-zA-Z_]*\([a-zA-Z_][a-zA-Z_0-9]*\)[^a-zA-Z_]*],
            [[[\1]]]),
          [\[[a-zA-Z_][a-zA-Z_0-9]*\]\(.*\)],
          [[\1]]))
    )])])

dnl---------------------------------------------------------------------
dnl gatbps_unprotect
dnl---------------------------------------------------------------------

m4_define([gatbps_unprotect],
  [m4_if(
    m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*]),
    [-1],
    [],
    [m4_ignore(
      gatbps_unprotect(
        m4_bregexp(
          m4_bpatsubst(
            [$*],
            [[^a-zA-Z_]*\([a-zA-Z_][a-zA-Z_0-9]*\)[^a-zA-Z_]*],
            [[[\1]]]),
          [\[[a-zA-Z_][a-zA-Z_0-9]*\]\(.*\)],
          [[\1]]))
      m4_popdef(
        m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*], [[\&]]))
    )])])

dnl---------------------------------------------------------------------
dnl Program checks
dnl---------------------------------------------------------------------

m4_define([GATBPS_PROG_],
  [AC_DEFUN([GATBPS_PROG_]$1, [[{ :

    ]gatbps_protect(
      ]m4_dquote($*)[,
      ]m4_dquote($1)[[_LATER],
      [HAVE_]]m4_dquote($1)[)[

    ]AC_CHECK_PROGS(
      ]m4_dquote($1)[,
      m4_normalize(]m4_dquote($2)[ ]m4_dquote($3)[),
      m4_normalize(]m4_dquote($2)[))[

    ]]m4_dquote($1)[[_LATER=`sed 's/@/{@}AT{@}/g' <<EOF
$]]m4_dquote($1)[[
EOF
` || exit $?
    readonly ]]m4_dquote($1)[[_LATER

    ]AC_SUBST(]m4_dquote($1)[[_LATER])[
    ]AM_SUBST_NOTMAKE(]m4_dquote($1)[[_LATER])[

    ]AC_ARG_VAR(
      ]m4_dquote($1)[,
      m4_normalize(]m4_dquote($2)[)[ command])[

    ]AC_DEFINE_UNQUOTED(
      ]m4_dquote($1)[,
      ["$]]m4_dquote($1)[["],
      m4_normalize(]m4_dquote($2)[)[ command])[

    if command -v "$]]m4_dquote($1)[[" >/dev/null; then
      HAVE_]]m4_dquote($1)[[=1
    else
      HAVE_]]m4_dquote($1)[[=0
    fi
    readonly HAVE_]]m4_dquote($1)[[

    ]AC_SUBST(HAVE_]m4_dquote($1)[)[

    ]AC_DEFINE_UNQUOTED(
      [HAVE_]]m4_dquote($1)[,
      [$HAVE_]]m4_dquote($1)[,
      m4_normalize(]m4_dquote($2)[)[ command availability])[

    ]AM_CONDITIONAL(
      [HAVE_]]m4_dquote($1)[,
      [[(
        if (exit $HAVE_]]m4_dquote($1)[[); then
          exit 1
        else
          exit 0
        fi
      )]])[

    ]gatbps_unprotect(
      ]m4_dquote($*)[,
      ]m4_dquote($1)[[_LATER],
      [HAVE_]]m4_dquote($1)[)[

  }]])])

GATBPS_PROG_([[ASCIIDOCTOR]], [[asciidoctor]])
GATBPS_PROG_([[ASCIIDOCTOR_PDF]], [[asciidoctor-pdf]])
GATBPS_PROG_([[JAR]], [[jar]])
GATBPS_PROG_([[JAVA]], [[java]])
GATBPS_PROG_([[JAVAC]], [[javac]])
GATBPS_PROG_([[JAVADOC]], [[javadoc]])
GATBPS_PROG_([[JDEPS]], [[jdeps]])

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
dnl GATBPS_SOFT_REQUIRE
dnl---------------------------------------------------------------------

m4_define([GATBPS_SOFT_REQUIRE],
  [m4_if(
    m4_bregexp([$1], [[a-zA-Z_]]),
    [-1],
    [m4_fatal([GATBPS_SOFT_REQUIRE: invalid argument])],
    [m4_ifdef(
      m4_bregexp([$1], [[a-zA-Z_][a-zA-Z_0-9]*], [[\&]]),
      [AC_REQUIRE(
        m4_bregexp([$1], [[a-zA-Z_][a-zA-Z_0-9]*], [[\&]]))])])])

dnl---------------------------------------------------------------------

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
