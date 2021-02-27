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
    m4_bregexp([$*], [[a-zA-Z_]]),
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
    m4_bregexp([$*], [[a-zA-Z_]]),
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
dnl GATBPS_PROG
dnl---------------------------------------------------------------------

m4_define([GATBPS_PROG],
  [AC_DEFUN([GATBPS_PROG_][$1], [[{ :

    ]gatbps_protect(
      $@,
      [$1_LATER],
      [HAVE_$1])[

    ]AC_CHECK_PROGS(
      [$1],
      m4_normalize([$2 $3]),
      m4_normalize([$2]))[

    $1_LATER=`sed 's/@/{@}AT{@}/g' <<EOF
$$1
EOF
` || exit $?
    readonly $1_LATER

    ]AC_SUBST([$1_LATER])[
    ]AM_SUBST_NOTMAKE([$1_LATER])[

    ]AC_ARG_VAR(
      [$1],
      m4_normalize([$2])[ command])[

    ]AC_DEFINE_UNQUOTED(
      [$1],
      ["$$1"],
      m4_normalize([$2])[ command])[

    if command -v "$$1" >/dev/null; then
      HAVE_$1=1
    else
      HAVE_$1=0
    fi
    readonly HAVE_$1

    ]AC_SUBST([HAVE_$1])[

    ]AC_DEFINE_UNQUOTED(
      [HAVE_$1],
      [$HAVE_$1],
      m4_normalize([$2])[ command availability])[

    ]AM_CONDITIONAL(
      [HAVE_$1],
      [[(if (exit $HAVE_$1); then exit 1; else exit 0; fi)]])[

    ]gatbps_unprotect(
      $@,
      [$1_LATER],
      [HAVE_$1])[

  }]])])

dnl---------------------------------------------------------------------

GATBPS_PROG([ASCIIDOCTOR], [asciidoctor])
GATBPS_PROG([ASCIIDOCTOR_PDF], [asciidoctor-pdf])
GATBPS_PROG([GZIP], [gzip])
GATBPS_PROG([JAR], [jar])
GATBPS_PROG([JAVA], [java])
GATBPS_PROG([JAVAC], [javac])
GATBPS_PROG([JAVADOC], [javadoc])
GATBPS_PROG([JDEPS], [jdeps])
GATBPS_PROG([TAR], [tar])
GATBPS_PROG([XZ], [xz])

dnl---------------------------------------------------------------------

GATBPS_PROG_ASCIIDOCTOR
GATBPS_PROG_ASCIIDOCTOR_PDF

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK
dnl---------------------------------------------------------------------

dnl TODO

m4_ignore([GATBPS_CHECK], [[{ :

  $2_was_cached=0

  ]AC_CACHE_CHECK(
    [$1],
    [$2],
    [[{ :

      # TODO: use $4 as prerequisites with expr

      $2_was_cached=false

      ]$3[

    }]])[

  if $][{]$2[+:} false; then
    :
  else
    : # TODO: barf, the caller failed to set $2
  fi

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_LANG_PROGRAM
dnl---------------------------------------------------------------------

m4_define([GATBPS_LANG_PROGRAM],
  [AC_LANG_CASE([], [([[

    ]])], [C], [AC_LANG_SOURCE([[

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
      int main() { f(); return 0; }

    ]])], [C++], [AC_LANG_SOURCE([[

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
      int main() { f(); return 0; }

    ]])],
    [m4_fatal([GATBPS_LANG_PROGRAM does not support ]_AC_LANG)])])

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
