changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.ac.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|

m4_ignore([

  Some versions of Autoconf temporarily unset all variables containing
  newline characters when outputting the cache, so we avoid making any
  such variables readonly. Doing so could interfere with Autoconf and
  possibly break things. These spots are notated with comments of the
  form "Avoid: readonly foo". Also see
  <https://lists.gnu.org/archive/html/bug-autoconf/2016-08/msg00000.html>.

])

dnl---------------------------------------------------------------------

[

gatbps_nl='
'
# Avoid: readonly gatbps_nl

gatbps_default_IFS=" 	$gatbps_nl"
# Avoid: readonly gatbps_default_IFS

]

dnl---------------------------------------------------------------------
dnl GATBPS_SQUISH
dnl---------------------------------------------------------------------

m4_define([GATBPS_SQUISH], [m4_bpatsubst(m4_bpatsubst(
m4_bpatsubst([[[[$1]]]], [[
	 ]+], [ ]), [^\(..\) ], [\1]), [ \(.\)$], [\1])])

dnl---------------------------------------------------------------------
dnl Timestamp normalization
dnl---------------------------------------------------------------------

[

#
# Sometimes the file timestamps from a distribution archive will have
# been modified, which can cause make to mistakenly think that certain
# distributed targets are out of date and try to rebuild them. Some of
# these targets are built with unusual utilities that a user might not
# have, causing the build to fail. For example, this can happen if the
# content of a distribution archive is stored in a Git repository, as
# Git does not store timestamps.
#
# We work around this problem by making the first run of the root
# ./configure give all files the same timestamp. To detect the first
# run, we check if the config.status file does not exist or if it is
# empty. Emptiness must be checked because an empty config.status file
# is sometimes used to indicate a dirty working tree before ./configure
# is ever run. To detect the root ./configure, we export a variable so
# that only the root ./configure will observe it to be unset.
#

if ${GATBPS_TIMESTAMPS_NORMALIZED+:} false; then
  ]AC_MSG_NOTICE(
    [[not normalizing timestamps (non-root ./configure)]])[
  :
elif test -s config.status; then
  ]AC_MSG_NOTICE(
    [[not normalizing timestamps (nonempty config.status)]])[
  :
else
  ]AC_MSG_NOTICE([[normalizing timestamps]])[
  t='touch -t '`date '+%Y%m%d%H%M.%S'`' {}' || exit $?
  p='( -name /
    -o -name .bzr
    -o -name .git
    -o -name .hg
    -o -name .svn
  ) -prune'
  # Try -exec + first and fall back to -exec ; if needed. Note that
  # -exec + bubbles its error status up to find nicely, whereas for
  # -exec ; we need to bubble it up ourselves.
  find . -exec $t + $p || {
    x=`find . '(' -exec $t ';' -o -print ')' $p` || exit $?
    case $x in ?*) exit 1 ;; esac
  }
fi
GATBPS_TIMESTAMPS_NORMALIZED=
readonly GATBPS_TIMESTAMPS_NORMALIZED
export GATBPS_TIMESTAMPS_NORMALIZED

]

dnl---------------------------------------------------------------------
dnl GATBPS_PROTECT
dnl---------------------------------------------------------------------

m4_define([GATBPS_PROTECT],
  [m4_if(
    m4_bregexp([$*], [[a-zA-Z_]]),
    [-1],
    [],
    [m4_ignore(
      m4_pushdef(
        m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*], [[\&]]),
        m4_bregexp([$*], [[a-zA-Z_][a-zA-Z_0-9]*], [[[\&]]]))
      GATBPS_PROTECT(
        m4_bregexp(
          m4_bpatsubst(
            [$*],
            [[^a-zA-Z_]*\([a-zA-Z_][a-zA-Z_0-9]*\)[^a-zA-Z_]*],
            [[[\1]]]),
          [\[[a-zA-Z_][a-zA-Z_0-9]*\]\(.*\)],
          [[\1]]))
    )])])

dnl---------------------------------------------------------------------
dnl GATBPS_UNPROTECT
dnl---------------------------------------------------------------------

m4_define([GATBPS_UNPROTECT],
  [m4_if(
    m4_bregexp([$*], [[a-zA-Z_]]),
    [-1],
    [],
    [m4_ignore(
      GATBPS_UNPROTECT(
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
dnl GATBPS_REQUIRE
dnl---------------------------------------------------------------------

m4_define([GATBPS_REQUIRE_N], 0)

m4_define([GATBPS_REQUIRE], [
  AC_DEFUN([GATBPS_REQUIRE_]GATBPS_REQUIRE_N, [AC_REQUIRE([$1])])
  m4_if(,, [GATBPS_REQUIRE_]GATBPS_REQUIRE_N)
  m4_define([GATBPS_REQUIRE_N], m4_incr(GATBPS_REQUIRE_N))
])

dnl---------------------------------------------------------------------
dnl GATBPS_PROG
dnl---------------------------------------------------------------------

m4_define([GATBPS_PROG], [

  AC_DEFUN([GATBPS_INNER_PROG_][$1], [[{ :

    ]GATBPS_PROTECT(
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

    ]GATBPS_UNPROTECT(
      $@,
      [$1_LATER],
      [HAVE_$1])[

  }]])

  AC_DEFUN([GATBPS_PROG_][$1], [
    AC_REQUIRE([GATBPS_INNER_PROG_$1])
  ])

])

dnl---------------------------------------------------------------------

GATBPS_PROG([ASCIIDOCTOR], [asciidoctor])
GATBPS_PROG([ASCIIDOCTOR_PDF], [asciidoctor-pdf])
GATBPS_PROG([GIT], [git])
GATBPS_PROG([GZIP], [gzip])
GATBPS_PROG([JAR], [jar])
GATBPS_PROG([JAVA], [java])
GATBPS_PROG([JAVAC], [javac])
GATBPS_PROG([JAVADOC], [javadoc])
GATBPS_PROG([JDEPS], [jdeps])
GATBPS_PROG([M4], [m4])
GATBPS_PROG([SQLITE3], [sqlite3])
GATBPS_PROG([TAR], [tar])
GATBPS_PROG([UNZIP], [unzip])
GATBPS_PROG([XZ], [xz])
GATBPS_PROG([ZIP], [zip])

dnl---------------------------------------------------------------------
dnl GATBPS_ERROR
dnl---------------------------------------------------------------------

m4_define([GATBPS_ERROR], [[{ :
  ]AC_MSG_ERROR(m4_dquote(GATBPS_SQUISH([$1])), 1)[
}]])

dnl---------------------------------------------------------------------
dnl GATBPS_BUG
dnl---------------------------------------------------------------------

m4_define([GATBPS_BUG], [[{ :
  ]GATBPS_ERROR([
    $1 (This is a bug. Please report it to <]AC_PACKAGE_BUGREPORT[>.)
  ])[
}]])

dnl---------------------------------------------------------------------
dnl GATBPS_PUSH_VAR
dnl---------------------------------------------------------------------

m4_define([GATBPS_PUSH_VAR], [[
  gatbps_d=$][{gatbps_var_depth_$1-1}
  case $][{$1+x} in '')
    eval gatbps_var_unset_$][{gatbps_d}_$1=:
  ;; *)
    eval gatbps_var_unset_$][{gatbps_d}_$1=false
    eval gatbps_var_value_$][{gatbps_d}_$1=\$$1
  esac
  gatbps_d=`expr $gatbps_d + 1` || exit $?
  gatbps_var_depth_$1=$gatbps_d
  $1=$2
]])

dnl---------------------------------------------------------------------
dnl GATBPS_POP_VAR
dnl---------------------------------------------------------------------

m4_define([GATBPS_POP_VAR], [[
  gatbps_d=$][{gatbps_var_depth_$1-1}
  case $gatbps_d in 1)
    ]GATBPS_BUG([GATBPS_POP_VAR([$1], ...) was called
                 without a matching GATBPS_PUSH_VAR([$1]) call.])[
  esac
  gatbps_d=`expr $gatbps_d - 1` || exit $?
  gatbps_var_depth_$1=$gatbps_d
  eval gatbps_u=\$gatbps_var_unset_$][{gatbps_d}_$1
  if $gatbps_u; then
    unset $1
  else
    eval $1=\$gatbps_var_value_$][{gatbps_d}_$1
  fi
]])

dnl---------------------------------------------------------------------
dnl GATBPS_KEEP_VAR
dnl---------------------------------------------------------------------

m4_define([GATBPS_KEEP_VAR], [[
  gatbps_d=$][{gatbps_var_depth_$1-1}
  case $gatbps_d in 1)
    ]GATBPS_BUG([GATBPS_KEEP_VAR([$1], ...) was called
                 without a matching GATBPS_PUSH_VAR([$1]) call.])[
  esac
  gatbps_d=`expr $gatbps_d - 1` || exit $?
  gatbps_var_depth_$1=$gatbps_d
]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK
dnl---------------------------------------------------------------------

m4_define([GATBPS_CHECK], [[{ :

  ]m4_pushdef(
    [gatbps_name],
    m4_bpatsubst([[[$2]]], [:.*\(..\)$], [\1]))[

  ]m4_pushdef(
    [gatbps_bool],
    m4_eval(m4_bregexp([$2:], [:bool:]) >= 0))[

  ]m4_pushdef(
    [gatbps_notbool],
    m4_eval(m4_bregexp([$2:], [:notbool:]) >= 0))[

  ]m4_pushdef(
    [gatbps_notmake],
    m4_eval(m4_bregexp([$2:], [:notmake:]) >= 0))[

  unset ]gatbps_name[
  unset ]gatbps_name[_sh
  unset ]gatbps_name[_was_cached
  unset gatbps_cv_]gatbps_name[

  ]gatbps_name[_was_cached=:

  ]AC_CACHE_CHECK(
    [[$1]],
    [[gatbps_cv_]gatbps_name],
    [[{ :

      ]m4_if([$4], [], [[$3]], [[

        ]GATBPS_PUSH_VAR([IFS], [$gatbps_default_IFS])[

        gatbps_e='$4'

        gatbps_s='
          s/[!&|()]/ /g
          s/^[10]/ /g
          s/[ 	][10]/ /g
        '
        gatbps_xs=`sed "$gatbps_s" <<gatbps_EOF
$gatbps_e
gatbps_EOF
        ` || exit $?
        for gatbps_x in $gatbps_xs; do
          eval gatbps_y=\$$gatbps_x
          case $gatbps_y in 1 | 0 | yes | no)
            :
          ;; *)
            ]GATBPS_BUG([
              GATBPS_CHECK(@<:@]gatbps_name[@:>@): Expression variable
              $gatbps_x is set to something other than 1, 0, yes, or no:
              $gatbps_y
            ])[
          esac
        done

        gatbps_x=$gatbps_e
        gatbps_s='s/[A-Z_a-z][0-9A-Z_a-z]*/$&/g'
        gatbps_x=`sed "$gatbps_s" <<gatbps_EOF
$gatbps_x
gatbps_EOF
        ` || exit $?
        eval "gatbps_x=\"$gatbps_x\""
        gatbps_s='
          s/yes/1/g
          s/no/0/g
          s/!/ 0 = /g
          s/&&/\&/g
          s/||/|/g
          s/[&|()]/ & /g
        '
        gatbps_x=`sed "$gatbps_s" <<gatbps_EOF
$gatbps_x
gatbps_EOF
        ` || exit $?
        gatbps_s=' \t\n'
        gatbps_x=`tr -s "$gatbps_s" '   ' <<gatbps_EOF
$gatbps_x
gatbps_EOF
        ` || exit $?
        case $gatbps_x in ' ')
          gatbps_x=0
        ;; *[!10\&\|\(\)= ]*)
          ]GATBPS_BUG([
            GATBPS_CHECK(@<:@]gatbps_name[@:>@): Expression to be given
            to expr contains a non-[10&|()= ] character: $gatbps_x
          ])[
        ;; *)
          expr $gatbps_x >/dev/null
          gatbps_x=$?
        esac
        case $gatbps_x in 0)
          :
          $3
        ;; 1)
          gatbps_cv_]gatbps_name[=]m4_if([$5], [], [[no]], [[$5]])[
        ;; *)
          exit $gatbps_x
        esac

        ]GATBPS_POP_VAR([IFS])[

      ]])[

      ]gatbps_name[_was_cached=false

    }]])[

  if $][{gatbps_cv_]gatbps_name[+:} false; then
    :
    ]m4_if(gatbps_bool, 1, [[
      case $gatbps_cv_]gatbps_name[ in yes | no)
        :
      ;; *)
        ]GATBPS_BUG([gatbps_cv_]gatbps_name[ is set to something
                     other than yes or no: $gatbps_cv_]gatbps_name)[
      esac
    ]])[
  else
    ]GATBPS_BUG([gatbps_cv_]gatbps_name[ is unset])[
  fi

  ]gatbps_name[=$gatbps_cv_]gatbps_name[

  ]AC_SUBST(gatbps_name)[
  ]m4_if(gatbps_notmake, 1, [AM_SUBST_NOTMAKE(gatbps_name)])[

  ]m4_ignore([
    When :notbool is not specified, we must always call AM_CONDITIONAL,
    even if a boolean is not detected, as the Automake manual states the
    following:

          Note that you must arrange for every AM_CONDITIONAL to be
          invoked every time configure is run. If AM_CONDITIONAL is
          run conditionally (e.g., in a shell if statement), then
          the result will confuse automake.

    To do this, we simply set ]gatbps_name[_sh to false if a boolean is
    not detected.
  ])[

  ]m4_if(gatbps_bool[]gatbps_notbool, 01, [], [[
    case $]gatbps_name[ in yes)
      ]gatbps_name[=1
      ]gatbps_name[_sh=:
      ]AC_DEFINE([gatbps_name], 1, [Result of checking $1.])[
    ;; no)
      ]gatbps_name[=0
      ]gatbps_name[_sh=false
      ]AC_DEFINE([gatbps_name], 0, [Result of checking $1.])[
    ;; *)
      ]gatbps_name[_sh=false
    esac
    ]AM_CONDITIONAL(gatbps_name, [[$]gatbps_name[_sh]])[
  ]])[

  readonly ]gatbps_name[
  readonly ]gatbps_name[_sh
  readonly ]gatbps_name[_was_cached

  ]m4_popdef([gatbps_notmake])[
  ]m4_popdef([gatbps_notbool])[
  ]m4_popdef([gatbps_bool])[
  ]m4_popdef([gatbps_name])[

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_EXPR
dnl---------------------------------------------------------------------

m4_define([GATBPS_CHECK_EXPR], [{ :

  GATBPS_CHECK(
    [$1],
    [$2],
    [gatbps_cv_$2=yes],
    [$3])

}])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_COMPILE
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_CHECK_COMPILE], [{ :

  GATBPS_CHECK_BASIC(
    [$1],
    [$2],
    [{ :
      AC_COMPILE_IFELSE(
        [GATBPS_LANG_PROGRAM([$3], [$4])],
        [gatbps_cv_$2='yes'],
        [gatbps_cv_$2='no'])
    }],
    [$5])

}])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_JAR
dnl---------------------------------------------------------------------
dnl
dnl GATBPS_CHECK_JAR(<message>, <jar_names>,
dnl                  <path_var>, <have_var>, [<condition>])
dnl
dnl The second and later JAR names may be patterns.
dnl The first should be a specific default name.
dnl

m4_define([GATBPS_CHECK_JAR], [[{ :

  ]GATBPS_CHECK(
    [$1 (path)],
    [$3:notbool],
    [
      while :; do

        for gatbps_x in \
          /usr/local/share/java \
          /usr/local/java \
        ; do
          for gatbps_y in . \
            ]m4_map_args_sep(['], ['], [ ], m4_unquote(m4_cdr(
              m4_map_args_w(GATBPS_SQUISH([$2]), [], [], [,]))))[ \
          ; do
            for gatbps_z in $gatbps_x/$gatbps_y; do
              if test -f $gatbps_z; then
                gatbps_cv_$3=$gatbps_z
                break 4
              fi
            done
          done
        done

        gatbps_cv_$3=/usr/local/share/java/]m4_car(
          m4_map_args_w(GATBPS_SQUISH([$2]), [], [], [,]))[
        break

      done
    ],
    [$5],
    [/usr/local/share/java/]m4_car(
      m4_map_args_w(GATBPS_SQUISH([$2]), [], [], [,])))[

  ]GATBPS_CONFIG_LATER_VAR([$3])[

  ]GATBPS_CHECK(
    [$1 (have)],
    [$4:bool],
    [
      if test -f $$3; then
        gatbps_cv_$4=yes
      else
        gatbps_cv_$4=no
      fi
    ],
    [$5])[

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE], [[{

#
# The block that contains this comment is the expansion of the
# GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE macro.
#]dnl
m4_ifdef(
  [GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_HAS_BEEN_CALLED],
  [gatbps_fatal([
    GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE has already been called
  ])],
  [m4_define([GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_HAS_BEEN_CALLED])])[]dnl
m4_if(
  m4_eval([$# != 0]),
  [1],
  [gatbps_fatal([
    GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE requires exactly 0 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
[

]GATBPS_CACHE_CHECK(
  [the soft makefile include syntax],
  [SOFT_INCLUDE],
  [[{

    gatbps_cv_SOFT_INCLUDE='#'

    case "$][{gatbps_cv_SOFT_INCLUDE}" in
      '#')

        'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' <<'EOF'
-include conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk
1:
	'exit' '0'
EOF
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              cat failed
            ])[
          ;;
        esac

        'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              rm failed
            ])[
          ;;
        esac

        'make' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' >/dev/null 2>&1
        case "$][{?}" in
          '0')

            'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' <<'EOF'
-include conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk
1:
	exit 1
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]GATBPS_MSG_ERROR([
                  cat failed
                ])[
              ;;
            esac

            'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk' <<'EOF'
2:
	'exit' '0'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]GATBPS_MSG_ERROR([
                  cat failed
                ])[
              ;;
            esac

            'make' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' >/dev/null 2>&1
            case "$][{?}" in
              '0')
                gatbps_cv_SOFT_INCLUDE='-include'
              ;;
            esac

          ;;
        esac

      ;;
    esac

    case "$][{gatbps_cv_SOFT_INCLUDE}" in
      '#')

        'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' <<'EOF'
sinclude conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk
1:
	'exit' '0'
EOF
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              cat failed
            ])[
          ;;
        esac

        'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_MSG_ERROR([
              rm failed
            ])[
          ;;
        esac

        'make' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' >/dev/null 2>&1
        case "$][{?}" in
          '0')

            'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' <<'EOF'
sinclude conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk
1:
	exit 1
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]GATBPS_MSG_ERROR([
                  cat failed
                ])[
              ;;
            esac

            'cat' >'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk' <<'EOF'
2:
	'exit' '0'
EOF
            case "$][{?}" in
              '0')
              ;;
              *)
                ]GATBPS_MSG_ERROR([
                  cat failed
                ])[
              ;;
            esac

            'make' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk' >/dev/null 2>&1
            case "$][{?}" in
              '0')
                gatbps_cv_SOFT_INCLUDE='sinclude'
              ;;
            esac

          ;;
        esac

      ;;
    esac

    'readonly' 'gatbps_cv_SOFT_INCLUDE'

    'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-1.mk'
    'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk'

  :;}]])[

case "$][{SOFT_INCLUDE+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{SOFT_INCLUDE} is already set
    ])[
  ;;
esac
SOFT_INCLUDE="$][{gatbps_cv_SOFT_INCLUDE}"
'readonly' 'SOFT_INCLUDE'

]AC_SUBST([SOFT_INCLUDE])[
]AM_SUBST_NOTMAKE([SOFT_INCLUDE])[

case "$][{GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have+is_set}" in
  ?*)
    ]GATBPS_MSG_ERROR([
      \$][{GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have} is already set
    ])[
  ;;
esac
case "$][{SOFT_INCLUDE}" in
  '#')
    GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have='0'
  ;;
  *)
    GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have='1'
  ;;
esac
'readonly' 'GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have'

]GATBPS_CHECK_EXPR(
  [for soft makefile include support],
  [HAVE_SOFT_INCLUDE],
  [GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE_have])[

:;}]])[]dnl

dnl---------------------------------------------------------------------
dnl GATBPS_JAVA
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_JAVA], [{

#
# The block that contains this comment is an expansion of the
# GATBPS_JAVA macro.
#
m4_pushdef([gatbps_x], [$1])
    m4_pushdef(
      [gatbps_y],
      m4_bpatsubst(gatbps_x, [[^0-9A-Z_a-z]], [_]))[]dnl
[

GATBPS_JAVA_RULES="$][{GATBPS_JAVA_RULES}"'

$][(java_]gatbps_y[_dst)$][(GATBPS_OUTER_JAR_SUFFIX) java.dummy_1.]gatbps_x[: java.FORCE
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(AM@&t@_V_at){ \
  ( \
    x=$][(java_]gatbps_y[_sourcepath); \
    x=$][$][{x}$][(CLASSPATH_SEPARATOR); \
    x=$][$][{x}$][(srcdir)/$][(java_]gatbps_y[_sourcepath); \
    case ""$][(CLASSPATH) in \
      ?*) \
        x="$][$][{x}"$][(CLASSPATH_SEPARATOR)$][(CLASSPATH); \
      ;; \
    esac; \
    case '\'''\''$][(java_]gatbps_y[_CLASSPATH) in \
      ?*) \
        x="$][$][{x}"$][(CLASSPATH_SEPARATOR)$][(java_]gatbps_y[_CLASSPATH); \
      ;; \
    esac; \
    $][(SHELL) \
      '\''-'\'' \
      $][(srcdir)/build-aux/echo.sh -q \
      -- \
      "$][$][{x}" \
      1>'\''java-]gatbps_x[.tmp'\'' \
    || exit $][$][?; \
    classpath=` \
      '\''cat'\'' '\''java-]gatbps_x[.tmp'\'' \
    ` || exit $][$][?; \
    x='\''x'\''; \
    for if_not_blank in \
      $][(java_]gatbps_y[_JAVACFLAGS) \
      $][$][{prevent_an_empty_word_list} \
    ; do \
      $][(SHELL) \
        '\''-'\'' \
        $][(srcdir)/build-aux/echo.sh -q \
        -- \
        $][(java_]gatbps_y[_JAVACFLAGS) \
        1>'\''java-]gatbps_x[.tmp'\'' \
      || exit $][$][?; \
      x='\'''\''; \
      '\''break'\''; \
    done; \
    case "$][$][{x}" in \
      ?*) \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)/build-aux/echo.sh -q \
          -- \
          $][(GATBPS_JAVACFLAGS) \
          1>'\''java-]gatbps_x[.tmp'\'' \
        || exit $][$][?; \
      ;; \
    esac; \
    javacflags=` \
      '\''cat'\'' '\''java-]gatbps_x[.tmp'\'' \
    ` || exit $][$][?; \
    $][(MAKE) \
      $][(AM@&t@_MAKEFLAGS) \
      '\''GATBPS_INNER_CLASSPATH='\''"$][$][{classpath}" \
      '\''GATBPS_INNER_JAR_SUFFIX='\'' \
      '\''GATBPS_INNER_JAVACFLAGS='\''"$][$][{javacflags}" \
      '\''GATBPS_INNER_PACKAGE=$][(java_]gatbps_y[_package)'\'' \
      GATBPS_INNER_SOURCEPATH=$][(java_]gatbps_y[_sourcepath) \
      '\''GATBPS_OUTER_JAR_SUFFIX=/outer'\'' \
      ./$][(java_]gatbps_y[_dst) \
    || exit $][$][?; \
    exit '\''0'\''; \
  :;); \
  x=$][$][?; \
  rm \
    -f \
    '\''java-]gatbps_x[.tmp'\'' \
  ; \
  exit "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(java_]gatbps_y[_dep)
./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(java_]gatbps_y[_extra)
./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(javadoc_]gatbps_y[_src)
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(GATBPS_V_JAR)$][(GATBPS_V_NOP)
	$][(AM@&t@_V_at){ \
  ( \
\
    srcdir='\''$(srcdir)'\''; \
    case $$srcdir in \
      [!/]*) \
        srcdir=./$$srcdir; \
      ;; \
    esac; \
    readonly srcdir; \
\
    case '\''$(PARALLEL_JAVAC)'\'' in \
      ?*) parallel=: ;; \
      "") parallel=false ;; \
    esac; \
    readonly parallel; \
\
    class_files='\''$(java_]gatbps_y[_src)'\''; \
    readonly class_files; \
\
    if $$parallel; then \
      :; \
    else \
      for a in $$class_files; do \
        a=./$$a; \
        if test -f "$$a"; then \
          b=$$][{a%.class}.java; \
          if test -f "$$b"; then \
            c=`find "$$b" -newer "$$a"` || exit $$?; \
          elif test -f "$$srcdir/$$b"; then \
            c=`find "$$srcdir/$$b" -newer "$$a"` || exit $$?; \
          else \
            c=x; \
          fi; \
          case $$c in ?*) rm -f "$$a.d" || exit $$? ;; esac; \
        fi; \
      done; \
    fi; \
\
    rm \
      -f \
      '\''-r'\'' \
      ./$][(java_]gatbps_y[_dst)'\''.tmp'\'' \
    || exit $][$][?; \
    $][(MKDIR_P) \
      ./$][(java_]gatbps_y[_dst)'\''.tmp/x'\'' \
    || exit $][$][?; \
    c='\''cf'\''; \
 \
    : \
    : Compile the .class files in conservatively sized groups. This \
    : prevents us from exceeding any command line length limits and \
    : still lets make -j do some parallelization. \
    ; \
 \
    case '\''$(PARALLEL_JAVAC)'\'' in \
      ?*) \
        max=50; \
      ;; \
      '\'''\'') \
        max=1; \
      ;; \
    esac; \
    xs=; \
    n=0; \
    for x in $$class_files; do \
      xs="$][$][xs $][$][x"; \
      n=`expr $][$][n + 1` || exit $][$][?; \
      case $][$][n in \
        $][$][max) \
          $][(MAKE) $][(AM_MAKEFLAGS) $][$][xs || exit $][$][?; \
          xs=; \
          n=0; \
        ;; \
      esac; \
    done; \
    case $][$][n in \
      0) \
      ;; \
      *) \
        $][(MAKE) $][(AM_MAKEFLAGS) $][$][xs || exit $][$][?; \
      ;; \
    esac; \
 \
    for x in \
      $][(java_]gatbps_y[_extra) \
      $][(java_]gatbps_y[_nested) \
      $][(java_]gatbps_y[_src) \
    ; do \
      case "$][$][{x}" in \
        *'\''*'\''*) \
          continue; \
        ;; \
      esac; \
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
      $][(JAR) \
        "$][$][{c}" \
        ./$][(java_]gatbps_y[_dst)'\''.tmp/x.jar'\'' \
        '\''-C'\'' \
        "$][$][{d}" \
        ./"$][$][{x}" \
      || exit $][$][?; \
      c='\''uf'\''; \
    done; \
    ( \
      '\''cd'\'' \
        ./$][(java_]gatbps_y[_dst)'\''.tmp/x'\'' \
      || exit $][$][?; \
      $][(JAR) \
        '\''xf'\'' \
        '\''../x.jar'\'' \
      || exit $][$][?; \
      exit '\''0'\''; \
    :;) || exit $][$][?; \
    x='\''x'\''; \
    for if_not_blank in \
      $][(java_]gatbps_y[_JARFLAGS) \
      $][$][{prevent_an_empty_word_list} \
    ; do \
      $][(JAR) \
        '\''cf'\'' \
        ./$][(java_]gatbps_y[_dst) \
        '\''-C'\'' \
        ./$][(java_]gatbps_y[_dst)'\''.tmp/x/'\''$][(GATBPS_INNER_SOURCEPATH) \
        $][(java_]gatbps_y[_JARFLAGS) \
        $][(JARFLAGS) \
        '\''.'\'' \
      || exit $][$][?; \
      x='\'''\''; \
      '\''break'\''; \
    done; \
    case "$][$][{x}" in \
      ?*) \
        $][(JAR) \
          '\''cf'\'' \
          ./$][(java_]gatbps_y[_dst) \
          '\''-C'\'' \
          ./$][(java_]gatbps_y[_dst)'\''.tmp/x/'\''$][(GATBPS_INNER_SOURCEPATH) \
          $][(GATBPS_JARFLAGS) \
          $][(JARFLAGS) \
          '\''.'\'' \
        || exit $][$][?; \
      ;; \
    esac; \
    exit '\''0'\''; \
  :;); \
  x=$][$][?; \
  rm \
    -f \
    '\''-r'\'' \
    ./$][(java_]gatbps_y[_dst)'\''.tmp'\'' \
  ; \
  exit "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-java-]gatbps_x[
.PHONY: install-java-]gatbps_x[
.PHONY: java-]gatbps_x[
.PHONY: uninstall-java-]gatbps_x[

clean-java: clean-java-]gatbps_x[

clean-java-]gatbps_x[: java.FORCE
	-{ \
  for x in \
    $][(java_]gatbps_y[_dst) \
    $][(java_]gatbps_y[_nested) \
    $][(java_]gatbps_y[_src) \
  ; do \
    rm \
      -f \
      ./"$][$][{x}" \
    ; \
  done; \
  exit '\''0'\''; \
:;}

install-java: install-java-]gatbps_x[

install-java-]gatbps_x[: java-]gatbps_x[
install-java-]gatbps_x[: java.FORCE
	@$][(NORMAL_INSTALL)
	$][(AM@&t@_V_at){ \
  x='\''x'\''; \
  for y in $][(java_]gatbps_y[_noinst); do \
    x='\'''\''; \
    '\''break'\''; \
  done; \
  case "$][$][{x}" in \
    ?*) \
      d=$][(DESTDIR)$][(javadir); \
      case "$][$][{d}" in \
        '\''/'\''*) \
        ;; \
        *) \
          d=./"$][$][{d}"; \
        ;; \
      esac; \
      if $][(AM@&t@_V_P); then \
        '\'':'\''; \
      else \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)/build-aux/echo.sh -q \
          -- \
          $][(MKDIR_P) \
          "$][$][{d}" \
        ; \
      fi; \
      $][(MKDIR_P) \
        "$][$][{d}" \
      || exit $][$][?; \
      if '\''test'\'' -f $][(java_]gatbps_y[_dst); then \
        x='\''.'\''; \
      else \
        x=$][(srcdir); \
        case "$][$][{x}" in \
          '\''/'\''*) \
          ;; \
          *) \
            x=./"$][$][{x}"; \
          ;; \
        esac; \
      fi; \
      x="$][$][{x}"'\''/'\''$][(java_]gatbps_y[_dst); \
      if $][(AM@&t@_V_P); then \
        '\'':'\''; \
      else \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)/build-aux/echo.sh -q \
          -- \
          $][(INSTALL_DATA) \
          "$][$][{x}" \
          "$][$][{d}" \
        ; \
      fi; \
      $][(INSTALL_DATA) \
        "$][$][{x}" \
        "$][$][{d}" \
      || exit $][$][?; \
    ;; \
  esac; \
  exit '\''0'\''; \
:;}

java: java-]gatbps_x[

java-]gatbps_x[: $][(java_]gatbps_y[_dst)
java-]gatbps_x[: java.FORCE

uninstall-java: uninstall-java-]gatbps_x[

uninstall-java-]gatbps_x[: java.FORCE
	@$][(NORMAL_UNINSTALL)
	$][(AM@&t@_V_at){ \
  x='\''x'\''; \
  for y in $][(java_]gatbps_y[_noinst); do \
    x='\'''\''; \
    '\''break'\''; \
  done; \
  case "$][$][{x}" in \
    ?*) \
      ( \
        x=$][(java_]gatbps_y[_dst); \
        x=$][$][{x##*/}; \
        x=$][(DESTDIR)$][(javadir)'\''/'\''"$][$][{x}"; \
        case "$][$][{x}" in \
          '\''/'\''*) \
          ;; \
          *) \
            x=./"$][$][{x}"; \
          ;; \
        esac; \
        if $][(AM@&t@_V_P); then \
          '\'':'\''; \
        else \
          $][(SHELL) \
            '\''-'\'' \
            $][(srcdir)/build-aux/echo.sh -q \
            -- \
            rm \
            -f \
            "$][$][{x}" \
          ; \
        fi; \
        rm \
          -f \
          "$][$][{x}" \
        ; \
        exit '\''0'\''; \
      :;); \
      x=$][$][?; \
      rm \
        -f \
        '\''uninstall-java-]gatbps_x[.tmp'\'' \
      ; \
      exit "$][$][{x}"; \
    ;; \
  esac; \
  exit '\''0'\''; \
:;}

'

]

    m4_popdef([gatbps_y])[]dnl
    m4_popdef([gatbps_x])[]dnl

:;}])[]dnl

AC_SUBST([GATBPS_JAVA_RULES])
AM_SUBST_NOTMAKE([GATBPS_JAVA_RULES])

dnl---------------------------------------------------------------------
dnl GATBPS_JAVA_CLASS
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_JAVA_CLASS], [{ :

  AC_REQUIRE([GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE])

m4_if(
  m4_eval([$# < 1 || $# > 2]),
  [1],
  [gatbps_fatal([
    GATBPS_JAVA_CLASS requires 1 to 2 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_JAVA_CLASS requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])[]dnl
m4_if(
  m4_eval([$# >= 2]),
  [1],
  [m4_case(
    [$2],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_JAVA_CLASS requires its second argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])[]dnl
m4_pushdef(
  [dst],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
[

GATBPS_JAVA_CLASS_RULES="$][{GATBPS_JAVA_CLASS_RULES}"'

]dst[: ]dst[.d

#
# The following rule causes the .d file to be treated as up-to-date if
# it does not exist. This causes the output file to be remade when the
# .d file does not exist, which generates the .d file as a side-effect.
#
# Here is the relevant part of the description of the make utility in
# the 2001 edition of the POSIX standard:
#
#       After make has ensured that all of the prerequisites of a
#       target are up-to-date and if the target is out-of-date,
#       the commands associated with the target entry shall be
#       executed. If there are no commands listed for the target,
#       the target shall be treated as up-to-date.
#
# Here is the relevant part of the GNU make 3.81 manual:
#
#       If a rule has no prerequisites or commands, and the target
#       of the rule is a nonexistent file, then make imagines this
#       target to have been updated whenever its rule is run.
#

]dst[.d:

.PRECIOUS: ]dst[.d

.PHONY: clean-]dst[

clean-]dst[:
	-rm -f ]dst[ ]dst[.d ]dst[.d.tmp ]dst[.tmp

]m4_if([$2], [], [[mostlyclean]], [[$2]])[-local: clean-]dst[

'"$][{SOFT_INCLUDE}"' ]dst[.d

'

]dnl
m4_popdef([dst])[]dnl

}])

AC_SUBST([GATBPS_JAVA_CLASS_RULES])
AM_SUBST_NOTMAKE([GATBPS_JAVA_CLASS_RULES])

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
    m4_bregexp([$1], [^[a-zA-Z_][a-zA-Z_0-9]*$]),
    -1,
    [m4_fatal([GATBPS_SOFT_REQUIRE: invalid <name>: $1])],
    [m4_ifdef([$1], [AC_REQUIRE([$1])])])])

dnl---------------------------------------------------------------------
dnl GATBPS_SOFT_VAR_DEP
dnl---------------------------------------------------------------------
dnl
dnl TODO: This can be removed after GATBPS_CHECK_BASIC is removed
dnl (GATBPS_CHECK is the new replacement).
dnl

m4_define(
  [GATBPS_SOFT_VAR_DEP],
  [m4_ifdef([DEFINE_]$1, [$1])])

dnl---------------------------------------------------------------------
dnl GATBPS_SOFT_VAR
dnl---------------------------------------------------------------------

m4_define([GATBPS_SOFT_VAR],
  [m4_if(
    m4_bregexp([$1], [^[a-zA-Z_][a-zA-Z_0-9]*$]),
    -1,
    [m4_fatal([GATBPS_SOFT_VAR: invalid <name>: $1])],
    [m4_ifdef([DEFINE_$1], [[$1]], 1)])])

dnl---------------------------------------------------------------------
dnl GATBPS_M4
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_M4], [{ :

  AC_REQUIRE([GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE])
  AC_REQUIRE([GATBPS_PROG_M4])

m4_if(
  m4_eval([$# < 1 || $# > 2]),
  [1],
  [gatbps_fatal([
    GATBPS_M4 requires 1 to 2 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])

m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    GATBPS_M4 requires its first argument to contain at least one
    character that is not a space, tab, or newline character
  ])])

m4_if(
  m4_eval([$# >= 2]),
  [1],
  [m4_case(
    [$2],
    [clean], [],
    [distclean], [],
    [maintainer-clean], [],
    [mostlyclean], [],
    [gatbps_fatal([
      GATBPS_M4 requires its second argument to be either "clean",
      "distclean", "maintainer-clean", or "mostlyclean"
    ])])])

m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl

  GATBPS_CP([$1], [$1.m4out])

[

GATBPS_M4_RULES="$][{GATBPS_M4_RULES}"'

]output_file[.m4out: ]output_file[.m4out.d

#
# The following rule causes the .d file to be treated as up-to-date if
# it does not exist. This causes the output file to be remade when the
# .d file does not exist, which generates the .d file as a side-effect.
#
# Here is the relevant part of the description of the make utility in
# the 2001 edition of the POSIX standard:
#
#       After make has ensured that all of the prerequisites of a
#       target are up-to-date and if the target is out-of-date,
#       the commands associated with the target entry shall be
#       executed. If there are no commands listed for the target,
#       the target shall be treated as up-to-date.
#
# Here is the relevant part of the GNU make 3.81 manual:
#
#       If a rule has no prerequisites or commands, and the target
#       of the rule is a nonexistent file, then make imagines this
#       target to have been updated whenever its rule is run.
#

]output_file[.m4out.d:

.PRECIOUS: ]output_file[.m4out.d

.PHONY: clean-]output_file[.m4out

clean-]output_file[.m4out:
	-rm \
  -f \
  ./]output_file['\''.m4out'\'' \
  ./]output_file['\''.m4out.d'\'' \
  ./]output_file['\''.m4out.d.tmp'\'' \
  ./]output_file['\''.m4out.tmp'\'' \
;

]m4_if([$2], [], [[mostlyclean]], [[$2]])[-local: clean-]output_file[.m4out

'"$][{SOFT_INCLUDE}"' ]output_file[.m4out.d

'

]

  m4_popdef([output_file])

}])

AC_SUBST([GATBPS_M4_RULES])
AM_SUBST_NOTMAKE([GATBPS_M4_RULES])

dnl---------------------------------------------------------------------
dnl GATBPS_TAR
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_TAR], [{ :

  AC_REQUIRE([GATBPS_PROG_TAR])

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

]output_file[/clean: FORCE
	-rm -f -r ./$(@D) ./$(@D)$(TSUF)*

]clean_target[-local: ]output_file[/clean

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

AC_DEFUN([GATBPS_XZ], [{ :

  AC_REQUIRE([GATBPS_PROG_XZ])

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

]target_sh[/clean: FORCE
	-rm -f -r ./$(@D) ./$(@D)$(TSUF)*

]m4_if([$3], [], [[mostlyclean]], [[$3]])[-local: ]target_sh[/clean

'

]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([source_sh])[]dnl
m4_popdef([target_sh])[]dnl
[
}]])

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
