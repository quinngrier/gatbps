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
dnl GATBPS_TAR
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_TAR], [[{

]dnl
m4_if(
  m4_eval([$# < 2 || $# > 5]),
  [1],
  [m4_fatal([
    GATBPS_TAR requires 2 to 5 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [m4_fatal([
    GATBPS_TAR requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [m4_fatal([
    GATBPS_TAR requires its second argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [], [],
    [file_or_directory], [],
    [directory_contents], [],
    [m4_fatal([
      GATBPS_TAR requires its third argument to be either empty,
      "directory_contents", or "file_or_directory"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 4]),
  [1],
  [m4_case(
    [$4],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [m4_fatal([
      GATBPS_TAR requires its fourth argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [list_5],
  m4_bpatsubst([[[$5]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_TAR_check_5],
  [m4_fatal([
    GATBPS_TAR_check_5 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_TAR_check_5],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [m4_fatal([
        invalid last subargument of the fifth GATBPS_TAR argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [m4_fatal([
        invalid non-last subargument of the fifth GATBPS_TAR argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_TAR_check_5(m4_shift($@))])])])[dnl
GATBPS_TAR_check_5(m4_if(,,list_5))[]dnl
m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_mode],
  m4_if(
    [$3],
    [],
    [[[file_or_directory]]],
    [[[$3]]]))[]dnl
m4_pushdef(
  [child_prerequisites],
  [[[$2]]])[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$4],
    [],
    [[[mostlyclean]]],
    [[[$4]]]))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_dquote(list_5))[]dnl
m4_pushdef(
  [rule_prerequisites],
  m4_if(
    leaf_prerequisites,
    [],
    [m4_dquote(child_prerequisites)],
    [m4_dquote(leaf_prerequisites)]))[]dnl
]m4_ifdef(
  [GATBPS_TAR_rule_lines],
  [m4_fatal([
    GATBPS_TAR_rule_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_TAR_rule_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
]output_file[: ]dnl
m4_bpatsubst([[$1]], ['], ['\\''])[]dnl
GATBPS_TAR_rule_lines(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_TAR_make_lines],
  [m4_fatal([
    GATBPS_TAR_make_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_TAR_make_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
  ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_TAR_make_lines(m4_shift($@))])])[dnl
[

GATBPS_TAR_RULES="$][{GATBPS_TAR_RULES}"'

]GATBPS_TAR_rule_lines(m4_if(,,rule_prerequisites))[]dnl
m4_if(
  leaf_prerequisites,
  [],
  [],
  [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \]dnl
GATBPS_TAR_make_lines(m4_if(,,child_prerequisites))[
;]])[
	$][(GATBPS_V_TAR)$][(GATBPS_RECIPE_MARKER_TOP)
	$(AM@&t@_V_at)$(MKDIR_P) $(@D)]dnl
m4_case(input_mode,
[file_or_directory], [[
	$(AM@&t@_V_at){ \
	  x=]input_directory[; \
	  if test -f $$x || test -d $$x; then \
	    d=.; \
	  else \
	    d=$(srcdir); \
	  fi; \
	  b=`basename $$x` || exit $$?; \
	  (cd $$d/$$x/.. && $(TAR) c $$b) >$][@$(TSUF) || exit $$?; \
	}]],
[directory_contents], [[
	$][(AM@&t@_V_at){ \
  x=]input_directory[; \
  if '\''test'\'' '\''-d'\'' "$][$][{x}"; then \
    d='\''.'\''; \
  else \
    d=$][(srcdir); \
    case "$][$][{d}" in \
      '\''/'\''*) \
      ;; \
      *) \
        d=./"$][$][{d}"; \
      ;; \
    esac; \
  fi; \
  ( \
    '\''cd'\'' \
      "$][$][{d}"'\''/'\''"$][$][{x}" \
    || exit $][$][?; \
    $][(TAR) \
      '\''cf'\'' \
      '\''-'\'' \
      * \
    || exit $][$][?; \
    exit '\''0'\''; \
  :;) \
    1>./]output_file[$(TSUF) \
  || exit $][$][?; \
  exit '\''0'\''; \
:;}]],
[m4_fatal([missing case])])[
	$(AM@&t@_V_at)mv -f $][@$(TSUF) $][@
	$(AM@&t@_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]output_file[

clean-]output_file[:
	-rm \
  -f \
  ./]output_file[ \
;

]clean_target[-local: clean-]output_file[

'

]dnl
m4_popdef([rule_prerequisites])[]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([input_mode])[]dnl
m4_popdef([input_directory])[]dnl
m4_popdef([output_file])[]dnl
m4_popdef([list_5])[]dnl
[:;}]])[]dnl

AC_SUBST([GATBPS_TAR_RULES])
AM_SUBST_NOTMAKE([GATBPS_TAR_RULES])

dnl---------------------------------------------------------------------
dnl GATBPS_XZ
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_XZ], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_XZ macro for the $1 target.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# < 2 || $# > 4]),
  [1],
  [gatbps_fatal([
    GATBPS_XZ requires 2 to 4 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_XZ requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_XZ requires its second argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_XZ requires its third argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_if(
  m4_eval([$# >= 4]),
  [1],
  [m4_if(
    m4_bregexp([$4], [[^
	 ]]),
    [-1],
    [gatbps_fatal([
      GATBPS_XZ requires its fourth argument to contain at least one
      character that is not a space, tab, or newline character
    ])])])[]dnl
m4_pushdef(
  [target_sh],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [source_sh],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_bpatsubst([[[$4]]], ['], ['\\'']))[]dnl
[

GATBPS_XZ_RULES="$][{GATBPS_XZ_RULES}"'

]target_sh[: ]m4_if([$4], [], [source_sh], [leaf_prerequisites])[
	$][(AM@&t@_V_at)|%}contains_at_least_one_word_sh(
  {%|MKDIR_P|%}){%||%}dnl
{%|
	$][(GATBPS_V_XZ)$][(GATBPS_RECIPE_MARKER_TOP)]dnl
m4_if([$4], [], [], [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \
  ]source_sh[ \
;]])[
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  ./$][(@D) \
;
	$][(AM@&t@_V_at){ \
  x=]source_sh[; \
  if '\''test'\'' -f "$][$][{x}"; then \
    d='\''.'\''; \
  else \
    d=$][(srcdir); \
    case "$][$][{d}" in \
      '\''/'\''*) \
      ;; \
      *) \
        d=./"$][$][{d}"; \
      ;; \
    esac; \
  fi; \
  $][(XZ) \
    0<"$][$][{d}"'\''/'\''"$][$][{x}" \
    1>./]target_sh['\''.tmp'\'' \
  || exit $][$][?; \
  exit '\''0'\''; \
:;}
	$][(AM@&t@_V_at)mv \
  -f \
  ./]target_sh['\''.tmp'\'' \
  ./]target_sh[ \
;
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-]target_sh[

clean-]target_sh[:
	-rm \
  -f \
  ./]target_sh[ \
;

]m4_if([$3], [], [[mostlyclean]], [[$3]])[-local: clean-]target_sh[

'

]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([target_sh])[]dnl
[:;}]])[]dnl

AC_SUBST([GATBPS_XZ_RULES])
AM_SUBST_NOTMAKE([GATBPS_XZ_RULES])

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
