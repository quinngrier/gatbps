changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.ac.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|

m4_ignore([

  TODO: Use gatbps_readonly

  Some versions of Autoconf temporarily unset all variables containing
  newline characters when outputting the cache, so we avoid making any
  such variables readonly. Doing so could interfere with Autoconf and
  possibly break things. These spots are notated with comments of the
  form "Avoid: readonly foo". Also see [1].

  [1] https://lists.gnu.org/archive/html/bug-autoconf/2016-08/msg00000.html

])

dnl#--------------------------------------------------------------------
dnl# Embed a subset of the GATBPS shell library
dnl#--------------------------------------------------------------------
[

# :r !src/sh/subset.sh gatbps_quote

#-----------------------------------------------------------------------
# gatbps_readonly
#-----------------------------------------------------------------------
#
# The authors of this section have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
# For documentation, please see
# <https://gatbps.quinngrier.com/manual/#sh-gatbps-readonly>.
#

: ${gatbps_readonly=readonly}
${gatbps_readonly?} gatbps_readonly

#-----------------------------------------------------------------------
# gatbps_quote
#-----------------------------------------------------------------------
#
# The authors of this section have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

#
# We use awk instead of sed because there's no way to print the
# enclosing quotes with sed when stdin is empty. We can't print the
# enclosing quotes with separate commands either, as sed will append a
# newline to the last line of output if a newline is not already there,
# causing an extraneous newline before the closing quote.
#

gatbps_quote() {

  case ${gatbps_quote_script+x} in '')
    gatbps_quote_script='
      BEGIN {
        q = "'\''";
        printf q;
      }
      {
        if (NR > 1) {
          printf "\n";
        }
        gsub(/'\''/, q "\\" q q);
        printf "%s", $0;
      }
      END {
        print q;
      }
    '
    ${gatbps_readonly?} gatbps_quote_script
  esac

  case $# in 0)
    eval LC_ALL=C "${AWK:-awk}" ' \
      "${gatbps_quote_script?}" \
    ' || exit $?
  ;; *)
    eval LC_ALL=C "${AWK:-awk}" ' \
      "${gatbps_quote_script?}" \
    ' <<gatbps_eof || exit $?
$@
gatbps_eof
  esac

}

#-----------------------------------------------------------------------

# end subset

]

dnl---------------------------------------------------------------------

[

gatbps_nl='
'
# Avoid: readonly gatbps_nl

gatbps_default_IFS=" 	$gatbps_nl"
# Avoid: readonly gatbps_default_IFS

#-----------------------------------------------------------------------
# gatbps_root_tmp
#-----------------------------------------------------------------------

]AS_TMPDIR([gat])[
gatbps_root_tmp=${tmp?}
case ${gatbps_root_tmp?} in [!/]*)
  case ${PWD?} in */)
    gatbps_root_tmp=${PWD?}${gatbps_root_tmp?}
  ;; *)
    gatbps_root_tmp=${PWD?}/${gatbps_root_tmp?}
  esac
esac
case ${gatbps_root_tmp?} in *[!/])
  gatbps_root_tmp=${gatbps_root_tmp?}/
esac
${gatbps_readonly?} gatbps_root_tmp

#-----------------------------------------------------------------------
# gatbps_root_tmpdir
#-----------------------------------------------------------------------

gatbps_root_tmpdir=${gatbps_root_tmp?}gatbps_root_tmpdir
${gatbps_readonly?} gatbps_root_tmpdir
mkdir "${gatbps_root_tmpdir?}" || exit $?

# TODO: Cleanup on exit with rm -f -r

#-----------------------------------------------------------------------
# gatbps_root_stmpdir
#-----------------------------------------------------------------------

gatbps_root_stmpdir=${gatbps_root_tmp?}gatbps_root_stmpdir
${gatbps_readonly?} gatbps_root_stmpdir
mkdir "${gatbps_root_stmpdir?}" || exit $?

# TODO: Cleanup on exit with shred if possible, then rm -f -r

#-----------------------------------------------------------------------
# gatbps_tmpdir
#-----------------------------------------------------------------------

gatbps_tmpdir=${gatbps_root_tmpdir?}/gatbps_tmpdir
${gatbps_readonly?} gatbps_tmpdir
mkdir "${gatbps_tmpdir?}" || exit $?

#-----------------------------------------------------------------------
# gatbps_stmpdir
#-----------------------------------------------------------------------

gatbps_stmpdir=${gatbps_root_stmpdir?}/gatbps_stmpdir
${gatbps_readonly?} gatbps_stmpdir
mkdir "${gatbps_stmpdir?}" || exit $?

#-----------------------------------------------------------------------

]

dnl---------------------------------------------------------------------
dnl GATBPS_DEFINE_UNIQUE
dnl---------------------------------------------------------------------

m4_ifdef(
  [GATBPS_DEFINE_UNIQUE],
  [
    m4_errprintn(m4_location[: Error: GATBPS_DEFINE_UNIQUE is already defined as a macro.])
    m4_exit([1])
  ])

m4_define([GATBPS_DEFINE_UNIQUE], [dnl
m4_if(
  m4_eval([$# == 1 || $# == 2]),
  [0],
  [
    m4_errprintn(m4_location[: Error: $0: Invalid argument count: $#.])
    m4_exit([1])
  ])dnl
m4_if(
  m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
  [-1],
  [
    m4_errprintn(m4_location[: Error: $0: Invalid <name>: "$1".])
    m4_exit([1])
  ])dnl
m4_ifdef(
  [$1],
  [
    m4_errprintn(m4_location[: Error: $1 is already defined as a macro.])
    m4_exit([1])
  ])dnl
m4_define([$1], [$2])dnl
])

dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_1Q], [$@])
GATBPS_DEFINE_UNIQUE([GATBPS_2Q], [[$@]])
GATBPS_DEFINE_UNIQUE([GATBPS_3Q], [[[$@]]])

dnl---------------------------------------------------------------------
dnl GATBPS_CALL_COMMENT(<macro>, <arg>...?)
dnl---------------------------------------------------------------------
dnl
dnl You can call this macro from another macro as follows:
dnl
dnl    GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))
dnl

GATBPS_DEFINE_UNIQUE([GATBPS_CALL_COMMENT],
  [[# $1]m4_if(
    m4_eval([$# > 1]),
    [1],
    [[(]m4_bpatsubst(m4_dquote(m4_dquote(m4_shift($@))), [
], [\&# ])[)]])])

dnl#--------------------------------------------------------------------
dnl# GATBPS_SQUISH(<text>)
dnl#--------------------------------------------------------------------
[

]GATBPS_DEFINE_UNIQUE([GATBPS_SQUISH], [dnl
m4_if(
  m4_eval([$# == 1]),
  [0],
  [
    m4_errprintn(m4_location[: Error: $0: Invalid argument count: $#.])
    m4_exit([1])
  ])dnl
m4_bpatsubsts(
  [[$1]],
  [[
	 ]+], [ ],
  [^\(..\) ], [\1],
  [ \(..\)$], [\1])dnl
])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_AC_BARF
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_AC_BARF], [
  m4_errprintn(m4_location: GATBPS_SQUISH([Error: $1]).)
  m4_exit(1)
])

dnl---------------------------------------------------------------------
dnl GATBPS_AC_WARN
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_AC_WARN], [
  m4_errprintn(m4_location: GATBPS_SQUISH([Warning: $1]).)
])

dnl---------------------------------------------------------------------
dnl GATBPS_AC_INFO
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_AC_INFO], [
  m4_errprintn(m4_location: GATBPS_SQUISH([$1]).)
])

dnl---------------------------------------------------------------------
dnl GATBPS_BARF
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_BARF], [{ :
  AC_MSG_ERROR(m4_dquote(GATBPS_SQUISH([$1]).), 1)
}])

dnl---------------------------------------------------------------------
dnl GATBPS_BUG
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_BUG], [
  GATBPS_BARF([
    Bug: ]GATBPS_SQUISH([$1])[.
    Please report this error to <]AC_PACKAGE_BUGREPORT[>, as it
    indicates a bug in ]AC_PACKAGE_NAME[
  ])
])

dnl---------------------------------------------------------------------
dnl GATBPS_WARN
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_WARN], [{ :
  AC_MSG_WARN(m4_dquote(GATBPS_SQUISH([$1]).))
}])

dnl---------------------------------------------------------------------
dnl GATBPS_INFO
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_INFO], [{ :
  AC_MSG_NOTICE(m4_dquote(GATBPS_SQUISH([$1]).))
}])

[

#-----------------------------------------------------------------------
# build-aux
#-----------------------------------------------------------------------

case ${ac_aux_dir-} in build-aux \
  | build-aux/ \
  | "${srcdir?}"/build-aux \
  | "${srcdir?}"/build-aux/ \
)
  :
;; *)
  case ${ac_aux_dir+x} in ?*)
    ]GATBPS_BUG([
      You must call AC@&t@_CONFIG_AUX_DIR([build-aux]) before including
      gatbps.ac.
      It looks like you called it with a different parameter
      (ac_aux_dir="${ac_aux_dir?}")
    ])[
  ;; *)
    ]GATBPS_BUG([
      You must call AC@&t@_CONFIG_AUX_DIR([build-aux]) before including
      gatbps.ac.
      It looks like you forgot to call it (ac_aux_dir is unset)
    ])[
  esac
esac

#-----------------------------------------------------------------------
# DISTCUT
#-----------------------------------------------------------------------

: ${DISTCUT=}
${gatbps_readonly?} DISTCUT

]AC_ARG_VAR([DISTCUT], GATBPS_SQUISH([
  By default, any distributed file whose make graph is nontrivial will
  have its edges cut so the graph becomes trivial and the file will
  always be considered up to date as long as it exists.
  Set this variable to empty to leave the edges uncut.
  In the source repository, the default is instead to leave the edges
  uncut, and you can set this variable to a nonempty value to cut them
  (typically DISTCUT=/DISTCUT).
]))[

#-----------------------------------------------------------------------
# Source directory copying
#-----------------------------------------------------------------------

case ${srcdir?} in .)
  ]GATBPS_INFO([
    Not copying source directory (non-VPATH build)
  ])[
;; *)
  case ${GATBPS_DONE_COPYING_SOURCE_DIRECTORY+:} in ?*)
    ]GATBPS_INFO([
      Not copying source directory (non-root configure)
    ])[
  ;; *)
    ]GATBPS_INFO([
      Copying source directory
    ])[

    unset gatbps_x

    case ${gatbps_x+x} in "")
      gatbps_y="tar -c --exclude-vcs"
      printf '%s\n' \
        "  Checking if \"${gatbps_y?}\" works." \
      >&]AS_MESSAGE_LOG_FD[
      (
        cd -- "${srcdir?}" || exit $?
        ${gatbps_y?} configure || exit $?
      ) >/dev/null 2>/dev/null && :
      case $? in 0)
        gatbps_x=${gatbps_y?}
        printf '%s\n' \
          "    Yes. Will use it." \
        >&]AS_MESSAGE_LOG_FD[
      ;; *)
        printf '%s\n' \
          "    No. Will try the next variant." \
        >&]AS_MESSAGE_LOG_FD[
      esac
    esac

    case ${gatbps_x+x} in "")
      gatbps_x="tar c"
      printf '%s\n' \
        "  Falling back to \"${gatbps_x?}\"." \
      >&]AS_MESSAGE_LOG_FD[
    esac

    (
      cd -- "${srcdir?}" || exit $?
      ${gatbps_x?} . || exit $?
    ) >"${gatbps_root_stmpdir?}/srcdir.tar" || exit $?

    tar xf "${gatbps_root_stmpdir?}/srcdir.tar" || exit $?
    chmod -R u+w . || exit $?
    mkdir -p build-aux || exit $?
    tar tf "${gatbps_root_stmpdir?}/srcdir.tar" >build-aux/gatbps_clean_copied_source_directory || exit $?

  esac
esac
GATBPS_DONE_COPYING_SOURCE_DIRECTORY=
readonly GATBPS_DONE_COPYING_SOURCE_DIRECTORY
export GATBPS_DONE_COPYING_SOURCE_DIRECTORY

#-----------------------------------------------------------------------
# Timestamp normalization
#-----------------------------------------------------------------------
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

if ${GATBPS_DONE_NORMALIZING_TIMESTAMPS+:} false; then
  ]GATBPS_INFO([
    Not normalizing timestamps (non-root configure)
  ])[
elif test -s config.status; then
  ]GATBPS_INFO([
    Not normalizing timestamps (nonempty config.status)
  ])[
else
  ]GATBPS_INFO([
    Normalizing timestamps
  ])[
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
    case $x in ?*)
      exit 1
    esac
  }
fi
GATBPS_DONE_NORMALIZING_TIMESTAMPS=
readonly GATBPS_DONE_NORMALIZING_TIMESTAMPS
export GATBPS_DONE_NORMALIZING_TIMESTAMPS

]
dnl---------------------------------------------------------------------
dnl GATBPS_PROTECT
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_PROTECT],
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

GATBPS_DEFINE_UNIQUE([GATBPS_UNPROTECT],
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
dnl GATBPS_BEFORE
dnl---------------------------------------------------------------------

dnl TODO: Violating the order should always be a fatal error.

GATBPS_DEFINE_UNIQUE([GATBPS_BEFORE], [dnl
AC_BEFORE([$1], [$2])dnl
])

dnl#--------------------------------------------------------------------
dnl# GATBPS_REQUIRE
dnl#--------------------------------------------------------------------
dnl#
dnl# The reason we define a macro with AC_DEFUN that calls AC_REQUIRE is
dnl# because this allows GATBPS_REQUIRE to be called from the top level.
dnl# If we were to just call AC_REQUIRE directly, GATBPS_REQUIRE could
dnl# only be called from within an AC_DEFUN body.
dnl#
dnl# The reason we use m4_if(,, x) instead of m4_expand(x) is to work
dnl# around a diversion limitation in M4. See [1].
dnl#
dnl# [1] https://manuals.quinngrier.com/autoconf/2.71/autoconf.html?qref=3090-3094
dnl#

GATBPS_DEFINE_UNIQUE([GATBPS_REQUIRE_N], 0)

GATBPS_DEFINE_UNIQUE([GATBPS_REQUIRE], [
  m4_if(m4_eval([$# < 1]), 1, [
    GATBPS_AC_BARF([
      $0: Too few parameters
    ])
  ])
  m4_if(m4_eval([$# > 2]), 1, [
    GATBPS_AC_BARF([
      $0: Too many parameters
    ])
  ])
  m4_if(m4_bregexp([$1], [^[a-zA-Z_][a-zA-Z_0-9]*$]), -1, [
    GATBPS_AC_BARF([
      $0: <name> must be a valid macro name
    ])
  ])
  AC_DEFUN([GATBPS_REQUIRE_]GATBPS_REQUIRE_N, [AC_REQUIRE([$1])])
  m4_if([$2], [], [
    m4_if(,, [GATBPS_REQUIRE_]GATBPS_REQUIRE_N)
  ], [$2], [soft], [
    m4_ifdef([$1], [m4_if(,, [GATBPS_REQUIRE_]GATBPS_REQUIRE_N)])
  ], [
    GATBPS_AC_BARF([
      $0: <options> must be either "" or "soft"
    ])
  ])
  m4_define([GATBPS_REQUIRE_N], m4_incr(GATBPS_REQUIRE_N))
])

dnl---------------------------------------------------------------------
dnl GATBPS_DEFINE_GATBPS_DOCKER_BUILD_FLAGS
dnl---------------------------------------------------------------------

AC_DEFUN_ONCE([GATBPS_DEFINE_GATBPS_DOCKER_BUILD_FLAGS], [

  [
    readonly GATBPS_DOCKER_BUILD_FLAGS
  ]

  AC_ARG_VAR(
    [GATBPS_DOCKER_BUILD_FLAGS],
    [
      Flags to use with "docker build" commands (default:
      GATBPS_DOCKER_BUILD_FLAGS='').
      For example, you might use GATBPS_DOCKER_BUILD_FLAGS='--no-cache'
      to disable the image cache.
    ])

])

dnl---------------------------------------------------------------------
dnl GATBPS_PROG
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_PROG], [

  AC_DEFUN_ONCE([GATBPS_PROG_][$1], [

    GATBPS_PROTECT(
      $@,
      [$1_LATER],
      [HAVE_$1])

    m4_ifdef([AC_PROG_$1], [

      GATBPS_REQUIRE([AC_PROG_$1])

    ], [

      AC_CHECK_PROGS(
        [$1],
        m4_normalize([$2 $3]),
        m4_normalize([$2]))

    ])

    AC_ARG_VAR(
      [$1],
      m4_normalize([$2])[ command])

    [
      $1_LATER=`sed 's/@/{@}AT{@}/g' <<EOF2
$$1
EOF2
      ` || exit $?
      readonly $1_LATER
    ]

    AC_SUBST([$1_LATER])
    AM_SUBST_NOTMAKE([$1_LATER])

    AC_DEFINE_UNQUOTED(
      [$1],
      ["$$1"],
      m4_normalize([$2])[ command])

    [
      if command -v "$$1" >/dev/null; then
        HAVE_$1=1
      else
        HAVE_$1=0
      fi
      readonly HAVE_$1
    ]

    AC_SUBST([HAVE_$1])

    AC_DEFINE_UNQUOTED(
      [HAVE_$1],
      [$HAVE_$1],
      m4_normalize([$2])[ command availability])

    AM_CONDITIONAL(
      [HAVE_$1],
      [[(if (exit $HAVE_$1); then exit 1; else exit 0; fi)]])

    GATBPS_UNPROTECT(
      $@,
      [$1_LATER],
      [HAVE_$1])

    $4

  ])

])

dnl#--------------------------------------------------------------------
dnl#
dnl# Some uppercase-ified utility names may cause name collision
dnl# problems, in which case they should be adjusted, typically by
dnl# appending _CLI to them. For example, CURL cannot be used as the
dnl# uppercase-ified name for the curl utility since it collides with
dnl# libcurl's CURL type.
dnl#

GATBPS_PROG(
  [ASCIIDOCTOR],
  [asciidoctor],
  GATBPS_SQUISH([
    adock
    build-aux/adock
  ]))

GATBPS_PROG([AWK], [awk])

GATBPS_PROG(
  [CMP],
  [cmp],
  GATBPS_SQUISH([
  ]))

GATBPS_PROG([CURL_CLI], [curl])

GATBPS_PROG([CYGPATH], [cygpath])

GATBPS_PROG([DOCKER], [docker], [], [
  GATBPS_REQUIRE([GATBPS_DEFINE_GATBPS_DOCKER_BUILD_FLAGS])
])

GATBPS_PROG([GIT], [git])

GATBPS_PROG([GREP], [grep])

GATBPS_PROG([GUNZIP], [gunzip])

GATBPS_PROG([GZIP], [gzip])

GATBPS_PROG([INSTALL], [install])

GATBPS_PROG([JAR], [jar])

GATBPS_PROG([JAVA], [java])

GATBPS_PROG([JAVAC], [javac])

GATBPS_PROG([JAVADOC], [javadoc])

GATBPS_PROG([JDEPS], [jdeps])

GATBPS_PROG([LN_S], [ln -s])

GATBPS_PROG([M4], [m4])

GATBPS_PROG([MKDIR_P], [mkdir -p])

GATBPS_PROG([NATIVE_IMAGE], [native-image])

GATBPS_PROG([OPENSSL], [openssl])

GATBPS_PROG([SED], [sed])

GATBPS_PROG([SQLITE3], [sqlite3])

GATBPS_PROG([TAR], [tar])

GATBPS_PROG([UNZIP], [unzip])

GATBPS_PROG([VCVARS], [vcvars64])

GATBPS_PROG([WGET], [wget])

GATBPS_PROG([XZ], [xz])

GATBPS_PROG([ZIP], [zip])

dnl#--------------------------------------------------------------------
dnl# Utilities that are always required
dnl#--------------------------------------------------------------------
[

]GATBPS_REQUIRE([GATBPS_PROG_CMP])[
case ${HAVE_CMP?} in 1)
  :
;; *)
  ]GATBPS_BARF([
    The cmp utility must be installed
  ])[
esac

]
dnl---------------------------------------------------------------------
dnl PACKAGE_NAME_UNDERSCORE_SLUG
dnl---------------------------------------------------------------------

m4_pushdef(
  [GATBPS_F],
  [m4_bmatch(
    [$1],
    [^...*[][].*[][].*..$],
    [GATBPS_F(
      m4_bpatsubst(
        [[$1]],
        [^\(....*\)[][]\(.*\)[][]\(.*...\)$],
        [\1_\2_\3]))],
    [m4_bpatsubst([$1], [[^][0-9A-Z_a-z]], [_])])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_PACKAGE_NAME_UNDERSCORE_SLUG],
  GATBPS_F(GATBPS_3Q(AC_PACKAGE_NAME)))

m4_popdef([GATBPS_F])

[
  PACKAGE_NAME_UNDERSCORE_SLUG=']GATBPS_PACKAGE_NAME_UNDERSCORE_SLUG['
  readonly PACKAGE_NAME_UNDERSCORE_SLUG
]

AC_SUBST([PACKAGE_NAME_UNDERSCORE_SLUG])

AC_DEFINE_UNQUOTED(
  [PACKAGE_NAME_UNDERSCORE_SLUG],
  ["$][{PACKAGE_NAME_UNDERSCORE_SLUG?}"],
  GATBPS_SQUISH([
    The package name with every non-alphanumeric non-underscore
    character replaced with an underscore character.
  ]))

dnl---------------------------------------------------------------------
dnl PACKAGE_NAME_LOWER_UNDERSCORE_SLUG
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE(
  [AC_PACKAGE_NAME_LOWER_UNDERSCORE_SLUG],
  m4_tolower(GATBPS_2Q(GATBPS_PACKAGE_NAME_UNDERSCORE_SLUG)))

[
  PACKAGE_NAME_LOWER_UNDERSCORE_SLUG=']AC_PACKAGE_NAME_LOWER_UNDERSCORE_SLUG['
  readonly PACKAGE_NAME_LOWER_UNDERSCORE_SLUG
]

AC_SUBST([PACKAGE_NAME_LOWER_UNDERSCORE_SLUG])

AC_DEFINE_UNQUOTED(
  [PACKAGE_NAME_LOWER_UNDERSCORE_SLUG],
  ["$][{PACKAGE_NAME_LOWER_UNDERSCORE_SLUG?}"],
  GATBPS_SQUISH([
    The package name with every non-alphanumeric non-underscore
    character replaced with an underscore character and every uppercase
    letter converted to lowercase.
  ]))

dnl---------------------------------------------------------------------
dnl PACKAGE_NAME_UPPER_UNDERSCORE_SLUG
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE(
  [AC_PACKAGE_NAME_UPPER_UNDERSCORE_SLUG],
  m4_toupper(GATBPS_2Q(GATBPS_PACKAGE_NAME_UNDERSCORE_SLUG)))

[
  PACKAGE_NAME_UPPER_UNDERSCORE_SLUG=']AC_PACKAGE_NAME_UPPER_UNDERSCORE_SLUG['
  readonly PACKAGE_NAME_UPPER_UNDERSCORE_SLUG
]

AC_SUBST([PACKAGE_NAME_UPPER_UNDERSCORE_SLUG])

AC_DEFINE_UNQUOTED(
  [PACKAGE_NAME_UPPER_UNDERSCORE_SLUG],
  ["$][{PACKAGE_NAME_UPPER_UNDERSCORE_SLUG?}"],
  GATBPS_SQUISH([
    The package name with every non-alphanumeric non-underscore
    character replaced with an underscore character and every lowercase
    letter converted to uppercase.
  ]))

dnl---------------------------------------------------------------------
dnl PACKAGE_LOWER_C_PREFIX
dnl---------------------------------------------------------------------

m4_ifndef(
  [GATBPS_PACKAGE_LOWER_C_PREFIX],
  [GATBPS_DEFINE_UNIQUE(
    [GATBPS_PACKAGE_LOWER_C_PREFIX],
    AC_PACKAGE_NAME_LOWER_UNDERSCORE_SLUG)])

[
  PACKAGE_LOWER_C_PREFIX=']GATBPS_PACKAGE_LOWER_C_PREFIX['
  readonly PACKAGE_LOWER_C_PREFIX
]

AC_SUBST([PACKAGE_LOWER_C_PREFIX])

AC_DEFINE_UNQUOTED(
  [PACKAGE_LOWER_C_PREFIX],
  ["$][{PACKAGE_LOWER_C_PREFIX?}"],
  GATBPS_SQUISH([
    The lowercase identifier prefix to use for the package's C API, not
    including the trailing underscore character.
  ]))

dnl---------------------------------------------------------------------
dnl PACKAGE_UPPER_C_PREFIX
dnl---------------------------------------------------------------------

m4_ifndef(
  [GATBPS_PACKAGE_UPPER_C_PREFIX],
  [GATBPS_DEFINE_UNIQUE(
    [GATBPS_PACKAGE_UPPER_C_PREFIX],
    AC_PACKAGE_NAME_UPPER_UNDERSCORE_SLUG)])

[
  PACKAGE_UPPER_C_PREFIX=']GATBPS_PACKAGE_UPPER_C_PREFIX['
  readonly PACKAGE_UPPER_C_PREFIX
]

AC_SUBST([PACKAGE_UPPER_C_PREFIX])

AC_DEFINE_UNQUOTED(
  [PACKAGE_UPPER_C_PREFIX],
  ["$][{PACKAGE_UPPER_C_PREFIX?}"],
  GATBPS_SQUISH([
    The uppercase identifier prefix to use for the package's C API, not
    including the trailing underscore character.
  ]))

dnl---------------------------------------------------------------------
dnl GATBPS_PUSH_VAR
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_PUSH_VAR], [[
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

GATBPS_DEFINE_UNIQUE([GATBPS_POP_VAR], [[
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

GATBPS_DEFINE_UNIQUE([GATBPS_KEEP_VAR], [[
  gatbps_d=$][{gatbps_var_depth_$1-1}
  case $gatbps_d in 1)
    ]GATBPS_BUG([GATBPS_KEEP_VAR([$1], ...) was called
                 without a matching GATBPS_PUSH_VAR([$1]) call.])[
  esac
  gatbps_d=`expr $gatbps_d - 1` || exit $?
  gatbps_var_depth_$1=$gatbps_d
]])

dnl---------------------------------------------------------------------
dnl GATBPS_ARG_WITH
dnl---------------------------------------------------------------------
dnl
dnl TODO: This probably shouldn't be user-facing. The user should really
dnl       only be using GATBPS_ARG_WITH_*.
dnl

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH], [[{

]m4_pushdef(
  [gatbps_x],
  with_[]m4_bpatsubst([$1], [[^0-9A-Z_a-z]], [_]))[]dnl
[

]AC_ARG_WITH(
  [[$1]],
  [[$2]],
  [{
    ]gatbps_x[_was_given='yes'
  :;}],
  [{
    ]gatbps_x[_was_given='no'
    ]gatbps_x[='$3'
  :;}])[

]m4_popdef([gatbps_x])[

:;}]])

dnl---------------------------------------------------------------------
dnl GATBPS_ARG_WITH_BOOL
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH_BOOL], [[{

]m4_pushdef(
  [gatbps_x],
  [with_]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))[]dnl
[

]GATBPS_ARG_WITH(
  [$3],
  [
]AS_HELP_STRING(
  [--with-$3 omitted],
  [same as --with-$3=$4])[
]AS_HELP_STRING(
  [--with-$3],
  [same as --with-$3=yes])[
]AS_HELP_STRING(
  [--without-$3],
  [same as --with-$3=no])[
]AS_HELP_STRING(
  [--with-$3=yes],
  [$5])[
]AS_HELP_STRING(
  [--with-$3=no],
  [$6]),
  [$4])

case "$[]{gatbps_x}" in
  'yes'|'no')
  ;;
  *)
    AC_MSG_ERROR([invalid --with-$3 value: $[]{]gatbps_x[}], [1])
  ;;
esac

GATBPS_CHECK_EXPR([$1], [$2], gatbps_x)

[

case $$2_was_cached in
  yes)
    printf 'note: --with-$3=%s was given but overridden by the cache\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
  ;;
  no)
    case $]gatbps_x[_was_given in
      yes)
        printf 'note: --with-$3=%s was given\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
      ;;
      no)
        printf 'note: --with-$3=%s was implied\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
      ;;
    esac
  ;;
esac

]

m4_popdef([gatbps_x])

:;}])

dnl---------------------------------------------------------------------
dnl GATBPS_ARG_WYNA
dnl---------------------------------------------------------------------
[

GATBPS_WYNA_PAIRS=

]m4_define([GATBPS_ARG_WYNA], [[
]GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))[
{ :

  ]m4_if(
    m4_eval([$# == 4 || $# == 5]),
    [0],
    [GATBPS_AC_BARF([
      GATBPS_ARG_WYNA: Invalid argument count: "$#".
    ])],
    m4_bregexp([$1], [^--with-[0-9A-Z_a-z-]+$]),
    [-1],
    [GATBPS_AC_BARF([
      GATBPS_ARG_WYNA: Invalid <option>: "$1".
    ])],
    m4_bregexp([$5], [^\([
	 ]*--with-[0-9A-Z_a-z-]+\([
	 ]+--with-[0-9A-Z_a-z-]+\)*\)?[
	 ]*$]),
    [-1],
    [GATBPS_AC_BARF([
      GATBPS_ARG_WYNA: Invalid <prerequisites>: "$5".
    ])])[

  ]m4_pushdef([gatbps_wo],
    m4_bpatsubst([[[[$1]]]], [^...--with], [\&out]))[

  ]m4_pushdef([gatbps_x],
    m4_dquote(m4_bpatsubsts(
      [[$1]],
      [[^]0-9A-Z[_a-z]], [_],
      [^\(..\)__with_], [\1])))[

  ]m4_pushdef([gatbps_X],
    m4_dquote(m4_translit(m4_dquote(gatbps_x), [a-z], [A-Z])))[

  ]m4_pushdef([gatbps_Ys],
    m4_dquote(m4_bpatsubsts(
      m4_translit([[[ $5]]], [a-z], [A-Z]),
      [[
	 ]+], [ ],
      [[^] 0-9A-Z[_a-z]], [_],
      [ __WITH_], [ ])))[

  case $][{GATBPS_DEDUCE_WYNAS_HAS_BEEN_CALLED-} in ?*)
    ]GATBPS_BUG([
      GATBPS_ARG_WYNA must not be called after GATBPS_DEDUCE_WYNAS.
    ])[
  esac

  ]GATBPS_ARG_WITH(
    m4_bpatsubsts([[$1]], [^\(..\)--with-], [\1]),
    []
AS_HELP_STRING([[$1 omitted]], [Same as $1=auto.])
AS_HELP_STRING([[$1]], [Same as $1=yes.])
AS_HELP_STRING(gatbps_wo, [Same as $1=no.])
AS_HELP_STRING([[$1=yes]], [$2])
AS_HELP_STRING([[$1=no]], [$3])
AS_HELP_STRING([[$1=auto]], [$4]),
    [auto])[

  case $][{with_]gatbps_x[?} in yes | no | auto)
    :
  ;; *)
    ]GATBPS_BARF([
      Invalid $1 value: "$][{with_]gatbps_x[?}".
    ])[
  esac

  WYNA_]gatbps_X[=$][{with_]gatbps_x[?}

  for gatbps_Y in : ]gatbps_Ys[; do
    case $][{gatbps_Y?} in :)
      continue
    esac
    GATBPS_WYNA_PAIRS="$][{GATBPS_WYNA_PAIRS?}
WYNA_]gatbps_X[ WYNA_$][{gatbps_Y?}"
  done

  ]m4_popdef([gatbps_Ys])[
  ]m4_popdef([gatbps_X])[
  ]m4_popdef([gatbps_x])[
  ]m4_popdef([gatbps_wo])[

}]])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_DEDUCE_WYNAS
dnl---------------------------------------------------------------------
[

]m4_define([GATBPS_DEDUCE_WYNAS], [[
]GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))[
{ :

  ]m4_if(
    m4_eval([$# == 0]),
    [0],
    [GATBPS_AC_BARF([
      GATBPS_DEDUCE_WYNAS: Invalid argument count: "$#".
    ])])[

  case $][{GATBPS_DEDUCE_WYNAS_HAS_BEEN_CALLED-} in ?*)
    ]GATBPS_BUG([
      GATBPS_DEDUCE_WYNAS must not be called more than once.
    ])[
  esac

  ]GATBPS_PUSH_VAR([IFS], [$][{gatbps_default_IFS?}])[

  gatbps_changed=:
  while $][{gatbps_changed?}; do
    gatbps_changed=false
    unset gatbps_x
    for gatbps_y in $][{GATBPS_WYNA_PAIRS?}; do
      case $][{gatbps_x+x} in '')
        gatbps_x=$][{gatbps_y?}
        continue
      esac
      eval gatbps_xv='$][{'$][{gatbps_x?}'-}'
      eval gatbps_yv='$][{'$][{gatbps_y?}'-}'
      case $][{gatbps_xv?},$][{gatbps_yv?} in yes,auto)
        eval $][{gatbps_y?}=yes
        gatbps_changed=:
      ;; auto,no)
        eval $][{gatbps_x?}=no
        gatbps_changed=:
      esac
      unset gatbps_x
    done
  done

  ]GATBPS_POP_VAR([IFS])[

  GATBPS_DEDUCE_WYNAS_HAS_BEEN_CALLED=x
  readonly GATBPS_DEDUCE_WYNAS_HAS_BEEN_CALLED

}]])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_FINISH_WYNA
dnl---------------------------------------------------------------------
[

]m4_define([GATBPS_FINISH_WYNA], [[
]GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))[
{ :

  ]m4_if(
    m4_eval([$# < 2 || $# > 3]),
    [1],
    [GATBPS_AC_BARF([
      GATBPS_FINISH_WYNA: Invalid argument count: "$#".
    ])])[

  ]m4_if(
    m4_bregexp([$2], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
    [-1],
    [GATBPS_AC_BARF([
      GATBPS_FINISH_WYNA: Invalid <name>: "$2".
    ])])[

  ]m4_pushdef(
    [gatbps_option],
    m4_if(m4_eval([$# >= 3]), [1], [[[$3]]], [[[$1]]]))[

  ]m4_if(
    m4_bregexp(gatbps_option, [^--with-[0-9A-Z_a-z-]+$]),
    [-1],
    [GATBPS_AC_BARF([
      GATBPS_FINISH_WYNA: Invalid <option>: "]gatbps_option[".
    ])])[

  ]m4_pushdef([gatbps_x],
    m4_dquote(m4_bpatsubsts(
      m4_dquote(gatbps_option),
      [[^]0-9A-Z[_a-z]], [_],
      [^\(..\)__with_], [\1])))[

  ]m4_pushdef([gatbps_X],
    m4_dquote(m4_translit(m4_dquote(gatbps_x), [a-z], [A-Z])))[

  case $][{GATBPS_DEDUCE_WYNAS_HAS_BEEN_CALLED-} in '')
    ]GATBPS_BUG([
      GATBPS_DEDUCE_WYNAS must be called before GATBPS_FINISH_WYNA.
    ])[
  esac

  ]GATBPS_CHECK(
    [$1],
    [$2:notbool],
    [gatbps_cv_$2=$][{WYNA_]gatbps_X[?}])[

  case $][{]gatbps_cv_$2[?} in yes | no | auto)
    :
  ;; *)
    ]GATBPS_BARF([
      Invalid gatbps_cv_$2 value: "$][{gatbps_cv_$2?}".
    ])[
  esac

  $2_IS_YES=0
  $2_IS_YES_SH=false
  $2_IS_NO=0
  $2_IS_NO_SH=false
  $2_IS_AUTO=0
  $2_IS_AUTO_SH=false
  case $][{$2?} in yes)
    $2_IS_YES=1
    $2_IS_YES_SH=:
  ;; no)
    $2_IS_NO=1
    $2_IS_NO_SH=:
  ;; auto)
    $2_IS_AUTO=1
    $2_IS_AUTO_SH=:
  esac
  readonly $2_IS_YES
  readonly $2_IS_YES_SH
  readonly $2_IS_NO
  readonly $2_IS_NO_SH
  readonly $2_IS_AUTO
  readonly $2_IS_AUTO_SH

  ]AC_SUBST([$2_IS_YES])[
  ]AC_SUBST([$2_IS_NO])[
  ]AC_SUBST([$2_IS_AUTO])[

  ]m4_popdef([gatbps_X])[
  ]m4_popdef([gatbps_x])[
  ]m4_popdef([gatbps_option])[

}]])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_ARG_WITH_ENUM
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_ARG_WITH_ENUM_foo1], [dnl
m4_if(
  m4_eval([$# >= 2]),
  [1],
  [[
  '$1')
  ;;]])[]dnl
m4_if(
  m4_eval([$# >= 4]),
  [1],
  [GATBPS_ARG_WITH_ENUM_foo1(m4_shift2($@))])[]dnl
])[]dnl

AC_DEFUN([GATBPS_ARG_WITH_ENUM_foo2], [dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [[
]AS_HELP_STRING(
  [$1=$2],
  [$3])])[]dnl
m4_if(
  m4_eval([$# >= 5]),
  [1],
  [GATBPS_ARG_WITH_ENUM_foo2([$1], m4_shift3($@))])[]dnl
])[]dnl

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH_ENUM_foo3], [[
  ]m4_pushdef(
    [gatbps_x],
    m4_bpatsubst([[[$2]]], [[^]0-9A-Z[_a-z]], [_]))[
  ]m4_if(
    m4_eval([$# >= 3]),
    [1],
    [[
      $1_is_]gatbps_x[=0
      $1_is_]gatbps_x[_sh=false
      ]GATBPS_ARG_WITH_ENUM_foo3([$1], m4_shiftn([3], $@))[
    ]])[
  ]m4_popdef([gatbps_x])[
]])

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH_ENUM_foo4], [[
  ]m4_pushdef(
    [gatbps_x],
    m4_bpatsubst([[[$2]]], [[^]0-9A-Z[_a-z]], [_]))[
  ]m4_pushdef(
    [gatbps_y],
    m4_bpatsubst([[[$2]]], ['], ['\\'']))[
  ]m4_if(
    m4_eval([$# >= 3]),
    [1],
    [[
      ']gatbps_y[')
        $1_is_]gatbps_x[=1
        $1_is_]gatbps_x[_sh=:
      ;;
      ]GATBPS_ARG_WITH_ENUM_foo4([$1], m4_shiftn([3], $@))[
    ]])[
  ]m4_popdef([gatbps_y])[
  ]m4_popdef([gatbps_x])[
]])

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH_ENUM_foo5], [[
  ]m4_pushdef(
    [gatbps_x],
    m4_bpatsubst([[[$2]]], [[^]0-9A-Z[_a-z]], [_]))[
  ]m4_if(
    m4_eval([$# >= 3]),
    [1],
    [[
      readonly $1_is_]gatbps_x[
      readonly $1_is_]gatbps_x[_sh
      ]GATBPS_ARG_WITH_ENUM_foo5([$1], m4_shiftn([3], $@))[
    ]])[
  ]m4_popdef([gatbps_x])[
]])

GATBPS_DEFINE_UNIQUE([GATBPS_ARG_WITH_ENUM], [[
# GATBPS_ARG_WITH_ENUM $2
{ :

  ]m4_pushdef(
    [gatbps_x],
    [with_]m4_bpatsubst([$3], [[^0-9A-Z_a-z]], [_]))[]dnl
  [

  ]GATBPS_ARG_WITH(
    [$3],
    [
]AS_HELP_STRING(
  [--with-$3 omitted],
  [same as --with-$3=$4])[
]AS_HELP_STRING(
  [--with-$3],
  [same as --with-$3=yes])[
]AS_HELP_STRING(
  [--without-$3],
  [same as --with-$3=no])[]dnl
GATBPS_ARG_WITH_ENUM_foo2([--with-$3], $5),
    [$4])[

  case "$][{]gatbps_x[}" in]dnl
  GATBPS_ARG_WITH_ENUM_foo1($5)[
    *)
      ]AC_MSG_ERROR([invalid --with-$3 value: $[]{]gatbps_x[}], [1])[
    ;;
  esac

  ]GATBPS_CHECK(
    [$1],
    [$2:notbool],
    [gatbps_cv_$2=$][{]gatbps_x[?}])[

  case $$2_was_cached in
    yes)
      printf 'note: --with-$3=%s was given but overridden by the cache\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
    ;;
    no)
      case $]gatbps_x[_was_given in
        yes)
          printf 'note: --with-$3=%s was given\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
        ;;
        no)
          printf 'note: --with-$3=%s was implied\n' "$]gatbps_x[" >&]AS_MESSAGE_LOG_FD[
        ;;
      esac
    ;;
  esac

  case "$][{]gatbps_cv_$2[}" in]dnl
  GATBPS_ARG_WITH_ENUM_foo1($5)[
    *)
      ]AC_MSG_ERROR([invalid gatbps_cv_$2 value: $[]{]gatbps_cv_$2[}], [1])[
    ;;
  esac

  ]GATBPS_ARG_WITH_ENUM_foo3([$2], $5)[
  case $][{$2?} in
    ]GATBPS_ARG_WITH_ENUM_foo4([$2], $5)[
    *)
      ]GATBPS_BUG([
        Unknown $2 value: '$][{$2?}'.
      ])[
    ;;
  esac
  ]GATBPS_ARG_WITH_ENUM_foo5([$2], $5)[

  ]m4_popdef([gatbps_x])[

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK], [[{ :

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

  ]m4_ignore([
    Do not unset the gatbps_cv_<name> variable, as that would break
    caching. The way caching works is that gatbps_cv_<name> will be set
    to the cached value early on in ./configure, and we should let that
    get fed into AC_CACHE_CHECK.

    Do not unset the <name> variable, as sometimes a caller may have
    already set it themselves and will use it in <code> to "finish" it.
  ])[

  unset ]gatbps_name[_sh
  unset ]gatbps_name[_is_guess
  unset ]gatbps_name[_is_guess_sh
  unset ]gatbps_name[_was_cached
  unset ]gatbps_name[_was_cached_sh

  ]gatbps_name[_was_cached=1
  ]gatbps_name[_was_cached_sh=:

  ]AC_CACHE_CHECK(
    [[$1]],
    [[gatbps_cv_]gatbps_name],
    [[{ :

      ]m4_if([$4], [], [$3], [[

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
        ;; *[!10\&\|\(\)=\ ]*)
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
          ]$3[
        ;; 1)
          gatbps_cv_]gatbps_name[=]m4_if([$5], [], [[no]], [[$5]])[
        ;; *)
          exit $gatbps_x
        esac

        ]GATBPS_POP_VAR([IFS])[

      ]])[

      ]gatbps_name[_was_cached=0
      ]gatbps_name[_was_cached_sh=false

    }]])[

  if $][{gatbps_cv_]gatbps_name[+:} false; then
    :
    ]m4_if(gatbps_bool, 1, [[
      case $][{gatbps_cv_]gatbps_name[?} in \
          yes | no | 'yes (guess)' | 'no (guess)')
        :
      ;; *)
        ]GATBPS_BUG([
          Invalid gatbps_cv_]gatbps_name[ value:
          "$gatbps_cv_]gatbps_name[".
        ])[
      esac
    ]])[
  else
    ]GATBPS_BUG([
      gatbps_cv_]gatbps_name[ must be set.
    ])[
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

  ]m4_if(gatbps_bool[]gatbps_notbool, [01], [], [[
    case $]gatbps_name[ in yes)
      ]gatbps_name[=1
      ]gatbps_name[_sh=:
      ]gatbps_name[_is_guess=0
      ]gatbps_name[_is_guess_sh=false
      ]AC_DEFINE([gatbps_name], 1, [Result of checking $1.])[
    ;; 'yes (guess)')
      ]gatbps_name[=1
      ]gatbps_name[_sh=:
      ]gatbps_name[_is_guess=1
      ]gatbps_name[_is_guess_sh=:
      ]AC_DEFINE([gatbps_name], 1, [Result of checking $1.])[
    ;; no)
      ]gatbps_name[=0
      ]gatbps_name[_sh=false
      ]gatbps_name[_is_guess=0
      ]gatbps_name[_is_guess_sh=false
      ]AC_DEFINE([gatbps_name], 0, [Result of checking $1.])[
    ;; 'no (guess)')
      ]gatbps_name[=0
      ]gatbps_name[_sh=false
      ]gatbps_name[_is_guess=1
      ]gatbps_name[_is_guess_sh=:
      ]AC_DEFINE([gatbps_name], 0, [Result of checking $1.])[
    ;; *)
      ]gatbps_name[_sh=false
    esac
    ]AM_CONDITIONAL(gatbps_name, [[$]gatbps_name[_sh]])[
  ]])[

  readonly ]gatbps_name[
  readonly ]gatbps_name[_sh
  readonly ]gatbps_name[_is_guess
  readonly ]gatbps_name[_is_guess_sh
  readonly ]gatbps_name[_was_cached
  readonly ]gatbps_name[_was_cached_sh

  ]m4_popdef([gatbps_notmake])[
  ]m4_popdef([gatbps_notbool])[
  ]m4_popdef([gatbps_bool])[
  ]m4_popdef([gatbps_name])[

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_COMPILE
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK_COMPILE], [
GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))
{ :

  GATBPS_CHECK(
    [$1],
    [$2:bool],
    [[
      ]AC_COMPILE_IFELSE(
        [[
          ]GATBPS_LANG_PROGRAM([$3], [$4])[
        ]],
        [[
          gatbps_cv_$2=yes
        ]],
        [[
          gatbps_cv_$2=no
        ]])[
    ]],
    [$5])

}])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_EXPR
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK_EXPR], [{ :

  GATBPS_CHECK(
    [$1],
    [$2],
    [[gatbps_cv_$2=yes]],
    [$3])

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

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK_JAR], [[{ :

  ]GATBPS_CHECK(
    [$1 (path)],
    [$3:notbool],
    [[
      while :; do

        for gatbps_x in \
          /usr/local/share/java \
          /usr/local/java \
        ; do
          for gatbps_y in . \
            ]GATBPS_SQUISH([$2])[ \
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
    ]],
    [$5],
    [/usr/local/share/java/]m4_car(
      m4_map_args_w(GATBPS_SQUISH([$2]), [], [], [,])))[

  ]GATBPS_CONFIG_LATER_VAR([$3])[

  ]GATBPS_CHECK(
    [$1 (have)],
    [$4:bool],
    [[
      if test -f $$3; then
        gatbps_cv_$4=yes
      else
        gatbps_cv_$4=no
      fi
    ]],
    [$5])[

}]])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_LINK
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK_LINK], [
GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))
{ :

  GATBPS_CHECK(
    [$1],
    [$2:bool],
    [[
      ]AC_LINK_IFELSE(
        [[
          ]GATBPS_LANG_PROGRAM([$3], [$4])[
        ]],
        [[
          gatbps_cv_$2=yes
        ]],
        [[
          gatbps_cv_$2=no
        ]])[
    ]],
    [$5])

}])

dnl---------------------------------------------------------------------
dnl GATBPS_CHECK_RUN
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_CHECK_RUN], [[
]GATBPS_CALL_COMMENT([$0]m4_if(m4_eval([$# > 0]), [1], [, $@]))[
{ :

  ]GATBPS_CHECK(
    [$1],
    [$2:bool],
    [[
      ]AC_RUN_IFELSE(
        [[
          ]GATBPS_LANG_PROGRAM([$3], [$4])[
        ]],
        [[
          gatbps_cv_$2=yes
        ]],
        [[
          gatbps_cv_$2=no
        ]],
        [[
          gatbps_cv_$2=$5' (guess)'
        ]])[
    ]],
    [$6])[

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
            ]GATBPS_BARF([
              cat failed
            ])[
          ;;
        esac

        'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_BARF([
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
                ]GATBPS_BARF([
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
                ]GATBPS_BARF([
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
            ]GATBPS_BARF([
              cat failed
            ])[
          ;;
        esac

        'rm' '-f' 'conftest-GATBPS_CHECK_SOFT_MAKEFILE_INCLUDE-2.mk'
        case "$][{?}" in
          '0')
          ;;
          *)
            ]GATBPS_BARF([
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
                ]GATBPS_BARF([
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
                ]GATBPS_BARF([
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
    ]GATBPS_BARF([
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
    ]GATBPS_BARF([
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

dnl#--------------------------------------------------------------------
dnl# GATBPS_CONFIG_FILE
dnl#--------------------------------------------------------------------

dnl# TODO: Rename GATBPS_CONFIG_FILE to GATBPS_SUBST_IN

AC_DEFUN([GATBPS_CONFIG_FILE], [[{

  ]GATBPS_REQUIRE([GATBPS_PROG_CMP])[

#
# The block that contains this comment is an expansion of the
# GATBPS_CONFIG_FILE macro.
#]dnl
m4_if(
  m4_eval([$# < 1 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_CONFIG_FILE requires 1 to 6 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_eval([$# >= 3]),
  [1],
  [m4_case(
    [$3],
    [distclean], [],
    [maintainer-clean], [],
    [gatbps_fatal([
      GATBPS_CONFIG_FILE requires its third argument to be either
      "distclean" or "maintainer-clean"
    ])])])[]dnl
m4_pushdef(
  [gatbps_output],
  [$1])[]dnl
m4_pushdef(
  [input_file],
  [$2])[]dnl
m4_pushdef(
  [input_file],
  m4_ifval(input_file, [input_file], [gatbps_output.in]))[]dnl
m4_pushdef(
  [gatbps_suffix],
  m4_if(m4_eval([$# < 4]), [1], [.out], [$4]))[]dnl
[

  ]AC_CONFIG_FILES(
    gatbps_output[]gatbps_suffix[:]input_file,
    [[{

      gatbps_dst_=']]gatbps_output[['
      gatbps_src_=']]gatbps_output[[]]gatbps_suffix[['
      gatbps_inp_=']]input_file[['
      gatbps_cur_=$][{gatbps_dst_?}

      case $][{gatbps_src_?} in /* | ./*)
        :
      ;; *)
        gatbps_src_=./$][{gatbps_src_?}
      esac

      case $][{gatbps_inp_?} in /* | ./*)
        :
      ;; *)
        gatbps_inp_=./$][{gatbps_inp_?}
      esac

      case $][{gatbps_cur_?} in /* | ./*)
        :
      ;; *)
        gatbps_cur_=./$][{gatbps_cur_?}
      esac

      env test -e "$][{gatbps_inp_?}"
      gatbps_s_=$?
      case $][{gatbps_s_?} in 0)
        :
      ;; 1)
        case $][{srcdir?} in .)
          ]GATBPS_BARF([
            File "$][{gatbps_inp_?}" does not exist
          ])[
        ;; *)
          gatbps_x_=$][{srcdir?}/$][{gatbps_inp_?}
          env test -e "$][{gatbps_x_?}"
          gatbps_s_=$?
          case $][{gatbps_s_?} in 0)
            :
          ;; 1)
            ]GATBPS_BARF([
              File "$][{gatbps_inp_?}" and file "$][{gatbps_x_?}" both
              do not exist
            ])[
          ;; *)
            exit $][{gatbps_s_?}
          esac
          gatbps_inp_=$][{gatbps_x_?}
        esac
      ;; *)
        exit $][{gatbps_s_?}
      esac

      test -f "$][{gatbps_inp_?}"
      gatbps_s_=$?
      case $][{gatbps_s_?} in 0)
        :
      ;; 1)
        ]GATBPS_BARF([
          File "$][{gatbps_inp_?}" is not a file
        ])[
      ;; *)
        exit $][{gatbps_s_?}
      esac

      gatbps_skip_=x

      case $][{gatbps_skip_?} in ?*)
        env test -e "$][{gatbps_cur_?}"
        gatbps_s_=$?
        case $][{gatbps_s_?} in 0)
          :
        ;; 1)
          case $][{srcdir?} in .)
            gatbps_skip_=
          ;; *)
            gatbps_cur_=$][{srcdir?}/$][{gatbps_cur_?}
            env test -e "$][{gatbps_cur_?}"
            gatbps_s_=$?
            case $][{gatbps_s_?} in 0)
              :
            ;; 1)
              gatbps_skip_=
            ;; *)
              exit $][{gatbps_s_?}
            esac
          esac
        ;; *)
          exit $][{gatbps_s_?}
        esac
      esac

      case $][{gatbps_skip_?} in ?*)
        test -f "$][{gatbps_cur_?}"
        gatbps_s_=$?
        case $][{gatbps_s_?} in 0)
          :
        ;; 1)
          ]GATBPS_BARF([
            File "$][{gatbps_cur_?}" is not a file
          ])[
        ;; *)
          exit $][{gatbps_s_?}
        esac
      esac

      case $][{gatbps_skip_?} in ?*)

        test -x "$][{gatbps_cur_?}"
        gatbps_s1_=$?
        case $][{gatbps_s1_?} in 0 | 1)
          :
        ;; *)
          exit $][{gatbps_s1_?}
        esac

        test -x "$][{gatbps_inp_?}"
        gatbps_s2_=$?
        case $][{gatbps_s2_?} in 0 | 1)
          :
        ;; *)
          exit $][{gatbps_s2_?}
        esac

        case $][{gatbps_s1_?} in $][{gatbps_s2_?})
          :
        ;; *)
          gatbps_skip_=
        esac

      esac

      case $][{gatbps_skip_?} in ?*)
        # configure will always have CMP set because gatbps.ac always
        # calls GATBPS_PROG_CMP, but config.status won't have CMP set
        # unless it's in the environment, so we set it here if needed.
        case $][{CMP+x} in "")
          if command -v cmp >/dev/null 2>/dev/null; then
            CMP=cmp
          else
            ]GATBPS_BARF([
              The cmp utility must be installed
            ])[
          fi
        esac
        $][{CMP?} \
          "$][{gatbps_cur_?}" \
          "$][{gatbps_src_?}" \
          >/dev/null \
          2>/dev/null \
        ;
        gatbps_s_=$?
        case $][{gatbps_s_?} in 0)
          :
        ;; 1)
          gatbps_skip_=
        ;; *)
          exit $][{gatbps_s_?}
        esac
      esac

      ]m4_ignore([
      #
      # Note that we use AC_MSG_NOTICE instead of GATBPS_INFO below.
      # This is because its formatting works better in this context.
      #
      # AC_MSG_NOTICE yields a message stream like this:
      #
      #       config.status: creating foo.out
      #       config.status: skipping foo
      #       config.status: creating bar.out
      #       config.status: updating bar
      #       ...
      #
      # GATBPS_INFO would yield a message stream like this:
      #
      #       config.status: creating foo.out
      #       config.status: skipping foo.
      #       config.status: creating bar.out
      #       config.status: updating bar.
      #       ...
      #
      ])[

      case ${gatbps_skip_?} in ?*)

        ]AC_MSG_NOTICE([[skipping $][{gatbps_dst_?}]])[

      ;; *)

        ]AC_MSG_NOTICE([[updating $][{gatbps_dst_?}]])[

        case $][{gatbps_dst_?} in /* | ./*)
          :
        ;; *)
          gatbps_dst_=./$][{gatbps_dst_?}
        esac

        env test -e "$][{gatbps_dst_?}"
        gatbps_s_=$?
        case $][{gatbps_s_?} in 0)
          test -f "$][{gatbps_dst_?}"
          gatbps_s_=$?
          case $][{gatbps_s_?} in 0)
            :
          ;; 1)
            ]GATBPS_BARF([
              File "$][{gatbps_dst_?}" is not a file
            ])[
          ;; *)
            exit $][{gatbps_s_?}
          esac
          rm "$][{gatbps_dst_?}" || exit $?
        ;; 1)
          :
        ;; *)
          exit $][{gatbps_s_?}
        esac
        cp "$][{gatbps_inp_?}" "$][{gatbps_dst_?}" || exit $?
        chmod +w "$][{gatbps_dst_?}" || exit $?
        cat "$][{gatbps_src_?}" >"$][{gatbps_dst_?}" || exit $?

        ]$5[

      esac

    }]],
    [$6])

gatbps_new_rules='.PHONY: clean-gatbps_output

clean-gatbps_output:
	-rm -f gatbps_output

[

]m4_if([$3], [], [[distclean]], [[$3]])[-local: clean-]gatbps_output[

]gatbps_output[: ]input_file[
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_STARTING)
	$][(GATBPS_V_SUBST_IN)$][(GATBPS_RECIPE_NOOP)
	$][(AM@&t@_V_at)rm \
  -f \
  ./]gatbps_output[ \
;
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  ./$][(@D) \
;
	$][(AM@&t@_V_at)$][(SHELL) \
  '\''-'\'' \
  '\''./config.status'\'' \
  ]gatbps_output[]gatbps_suffix[ \
;
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

'

]

case "$[]{GATBPS_CONFIG_FILE_RULES}" in
  ?*)
    GATBPS_CONFIG_FILE_RULES="$[]{GATBPS_CONFIG_FILE_RULES}

$[]{gatbps_new_rules}"
  ;;
  *)
    GATBPS_CONFIG_FILE_RULES="$[]{gatbps_new_rules}"
  ;;
esac

m4_popdef([gatbps_suffix])[]dnl
m4_popdef([input_file])[]dnl
m4_popdef([input_file])[]dnl
m4_popdef([gatbps_output])[]dnl
[:;}]])[]dnl

[

]AC_SUBST([GATBPS_CONFIG_FILE_RULES])[
]AM_SUBST_NOTMAKE([GATBPS_CONFIG_FILE_RULES])[

]
dnl#--------------------------------------------------------------------
dnl# GATBPS_CONFIG_LATER
dnl#--------------------------------------------------------------------

dnl# TODO: Rename GATBPS_CONFIG_LATER to GATBPS_SUBST_IM

AC_DEFUN([GATBPS_CONFIG_LATER], [[{

#
]m4_text_wrap(
  [
    The block that contains this comment is the expansion of the
    GATBPS_CONFIG_LATER macro for the $1 target.
  ],
  [# ],
  [# ],
  [72])[
#]dnl
m4_if(
  m4_eval([$# < 1 || $# > 4]),
  [1],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER requires 1 to 4 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])[]dnl
m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument for GATBPS_CONFIG_LATER:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])[]dnl
m4_if(
  [$2],
  [],
  [],
  [m4_if(
    m4_bregexp([$2], [[^
	 ]]),
    [-1],
    [gatbps_fatal([
      invalid second argument for GATBPS_CONFIG_LATER:
    [--VERBATIM--] "$2"], [
      the second argument must contain at least one character that is
      not a space, tab, or newline character
    ])])])[]dnl
m4_case(
  [$3],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid third argument for GATBPS_CONFIG_LATER:
  [--VERBATIM--] "$3"], [
    the third argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])[]dnl
m4_pushdef(
  [list_4],
  m4_bpatsubst([[[$4]]], [^\(..\)[
	 ]+], [\1]))[]dnl
]m4_ifdef(
  [GATBPS_CONFIG_LATER_check_4],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_check_4 is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CONFIG_LATER_check_4],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the fourth GATBPS_CONFIG_LATER argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the fourth GATBPS_CONFIG_LATER argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_CONFIG_LATER_check_4(m4_shift($@))])])])[dnl
GATBPS_CONFIG_LATER_check_4(m4_if(,,list_4))[]dnl
m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl
m4_pushdef(
  [input_file],
  m4_if(
    [$2],
    [],
    [m4_bpatsubst([[[$1.im]]], ['], ['\\''])],
    [m4_bpatsubst([[[$2]]], ['], ['\\''])]))[]dnl
m4_pushdef(
  [child_prerequisites],
  m4_if(
    [$2],
    [],
    [[[[$1.im]]]],
    [[[[$2]]]]))[]dnl
m4_pushdef(
  [clean_target],
  m4_if(
    [$3],
    [],
    [[[mostlyclean]]],
    [[[$3]]]))[]dnl
m4_pushdef(
  [leaf_prerequisites],
  m4_dquote(list_4))[]dnl
m4_pushdef(
  [rule_prerequisites],
  m4_if(
    leaf_prerequisites,
    [],
    [m4_dquote(child_prerequisites)],
    [m4_dquote(leaf_prerequisites)]))[]dnl
]m4_ifdef(
  [GATBPS_CONFIG_LATER_rule_lines],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_rule_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CONFIG_LATER_rule_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
]output_file[: ]dnl
m4_bpatsubst([[$1]], ['], ['\\''])[]dnl
GATBPS_CONFIG_LATER_rule_lines(m4_shift($@))])])[dnl
]m4_ifdef(
  [GATBPS_CONFIG_LATER_make_lines],
  [gatbps_fatal([
    GATBPS_CONFIG_LATER_make_lines is already defined
  ])])[dnl
]m4_define(
  [GATBPS_CONFIG_LATER_make_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
  ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_CONFIG_LATER_make_lines(m4_shift($@))])])[dnl
[

case "$][{GATBPS_CONFIG_LATER_SCRIPT_MID+is_set}" in
  ?*)
  ;;
  *)
    ]GATBPS_CONFIG_LATER_VAR([bindir])[
  ;;
esac

GATBPS_CONFIG_LATER_RULES="$][{GATBPS_CONFIG_LATER_RULES}"'

]GATBPS_CONFIG_LATER_rule_lines(m4_if(,,rule_prerequisites))[]dnl
m4_if(
  leaf_prerequisites,
  [],
  [],
  [[
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_STARTING)
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \]dnl
GATBPS_CONFIG_LATER_make_lines(m4_if(,,child_prerequisites))[
;]])[
	$][(GATBPS_V_SUBST_IM)$][(GATBPS_RECIPE_NOOP)
	$][(AM@&t@_V_at)rm \
  -f \
  ./]output_file[ \
  ./]output_file['\''.tmp'\'' \
;
	$][(AM@&t@_V_at)$][(MKDIR_P) \
  ./$][(@D) \
;
	$][(AM@&t@_V_at){ \
  ( \
    x=]input_file[; \
    $][(GATBPS_VPATH_SEARCH_TOP) \
      "$][$][{x}" \
    $][(GATBPS_VPATH_SEARCH_BOT); \
    d=$][(GATBPS_VPATH_SEARCH_RESULT); \
    x="$][$][{d}"'/'"$][$][{x}"; \
    readonly '\''x'\''; \
    cp "$$x" $][@.tmp || exit $$?; \
    chmod +w $][@.tmp || exit $$?; \
    $][(AWK) \
      $][(GATBPS_CONFIG_LATER_SCRIPT) \
      0<"$][$][{x}" \
      1>./]output_file['\''.tmp'\'' \
    || exit $][$][?; \
    mv \
      -f \
      ./]output_file['\''.tmp'\'' \
      ./]output_file[ \
    || exit $][$][?; \
    exit '\''0'\''; \
  :;); \
  exit_status=$][$][?; \
  readonly '\''exit_status'\''; \
  case "$][$][{exit_status}" in \
    '\''0'\'') \
    ;; \
    *) \
      rm \
        -f \
        ./]output_file[ \
        ./]output_file['\''.tmp'\'' \
      ; \
    ;; \
  esac; \
  exit "$][$][{exit_status}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

.PHONY: clean-]output_file[

clean-]output_file[:
	-rm \
  -f \
  ./]output_file[ \
  ./]output_file['\''.tmp'\'' \
;

]clean_target[-local: clean-]output_file[

'

]dnl
m4_popdef([rule_prerequisites])[]dnl
m4_popdef([leaf_prerequisites])[]dnl
m4_popdef([clean_target])[]dnl
m4_popdef([child_prerequisites])[]dnl
m4_popdef([input_file])[]dnl
m4_popdef([output_file])[]dnl
m4_popdef([list_4])[]dnl
[:;}]])[]dnl

[

]AC_SUBST([GATBPS_CONFIG_LATER_RULES])[
]AM_SUBST_NOTMAKE([GATBPS_CONFIG_LATER_RULES])[

]AC_SUBST([GATBPS_CONFIG_LATER_SCRIPT_MID])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_DOCKER_BUILD
dnl---------------------------------------------------------------------

AC_DEFUN([GATBPS_DOCKER_BUILD], [

  GATBPS_REQUIRE([GATBPS_PROG_DOCKER])

m4_if(
  m4_eval([$# < 2 || $# > 6]),
  [1],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD requires 2 to 6 arguments
    ($# ]m4_if([$#], [1], [[was]], [[were]])[ given)
  ])])

m4_if(
  m4_bregexp([$1], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid first argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$1"], [
    the first argument must contain at least one character that is not a
    space, tab, or newline character
  ])])

m4_if(
  m4_bregexp([$2], [[^
	 ]]),
  [-1],
  [gatbps_fatal([
    invalid second argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$2"], [
    the second argument must contain at least one character that is not
    a space, tab, or newline character
  ])])

m4_pushdef(
  [target_slug],
  m4_bpatsubst(
    m4_bpatsubst([$1], [.], [[[[\&]]]]),
    [\[\[[^0-9@A-Z_a-z]\]\]],
    [[[_]]]))

m4_pushdef(
  [list_3],
  m4_bpatsubst([[[$3]]], [^\(..\)[
	 ]+], [\1]))

]

m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_3],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_3 is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_check_3],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the third GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the third GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_3(m4_shift($@))])])])

[

GATBPS_DOCKER_BUILD_check_3(m4_if(,,list_3))

m4_pushdef(
  [list_4],
  m4_bpatsubst([[[$4]]], [^\(..\)[
	 ]+], [\1]))

]

m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_4],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_4 is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_check_4],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the fourth GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the fourth GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_4(m4_shift($@))])])])

[

GATBPS_DOCKER_BUILD_check_4(m4_if(,,list_4))

m4_case(
  [$5],
  [], [],
  [clean], [],
  [distclean], [],
  [maintainer-clean], [],
  [mostlyclean], [],
  [gatbps_fatal([
    invalid fifth argument for GATBPS_DOCKER_BUILD:
  [--VERBATIM--] "$5"], [
    the fifth argument must be either empty, "clean", "distclean",
    "maintainer-clean", or "mostlyclean"
  ])])

m4_pushdef(
  [list_6],
  m4_bpatsubst([[[$6]]], [^\(..\)[
	 ]+], [\1]))

]

m4_ifdef(
  [GATBPS_DOCKER_BUILD_check_6],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_check_6 is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_check_6],
  [m4_if(
    [$#],
    [1],
    [m4_if(
      m4_bregexp([$1], [^[
	 ]+$]),
      [0],
      [gatbps_fatal([
        invalid last subargument of the sixth GATBPS_DOCKER_BUILD argument:
      [--VERBATIM--] "$1"], [
        the last subargument must either be empty or contain at least
        one character that is not a space, tab, or newline character
      ])])],
    [m4_if(
      m4_bregexp([$1], [[^
	 ]]),
      [-1],
      [gatbps_fatal([
        invalid non-last subargument of the sixth GATBPS_DOCKER_BUILD
        argument:
      [--VERBATIM--] "$1"], [
        each non-last subargument must contain at least one character
        that is not a space, tab, or newline character
      ])],
      [GATBPS_DOCKER_BUILD_check_6(m4_shift($@))])])])

[

GATBPS_DOCKER_BUILD_check_6(m4_if(,,list_6))

m4_pushdef(
  [output_file],
  m4_bpatsubst([[[$1]]], ['], ['\\'']))[]dnl

m4_pushdef(
  [input_directory],
  m4_bpatsubst([[[$2]]], ['], ['\\'']))[]dnl

m4_pushdef(
  [image_names],
  m4_dquote(list_3))[]dnl

m4_pushdef(
  [child_prerequisites],
  m4_if(
    list_4,
    [],
    [[[[$2/Dockerfile]]]],
    [m4_dquote(list_4)]))[]dnl

m4_pushdef(
  [clean_target],
  m4_if(
    [$5],
    [],
    [[[mostlyclean]]],
    [[[$5]]]))[]dnl

m4_pushdef(
  [leaf_prerequisites],
  m4_dquote(list_6))[]dnl

m4_pushdef(
  [rule_prerequisites],
  m4_if(
    leaf_prerequisites,
    [],
    [m4_dquote(child_prerequisites)],
    [m4_dquote(leaf_prerequisites)]))[]dnl

]

m4_ifdef(
  [GATBPS_DOCKER_BUILD_rule_lines],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_rule_lines is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_rule_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
]output_file[.iid: ]dnl
m4_bpatsubst([[$1]], ['], ['\\''])[]dnl
GATBPS_DOCKER_BUILD_rule_lines(m4_shift($@))])])

m4_ifdef(
  [GATBPS_DOCKER_BUILD_word_lines_2],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_word_lines_2 is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_word_lines_2],
  [m4_if(
    [$1],
    [],
    [],
    [[
  ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_word_lines_2(m4_shift($@))])])

m4_ifdef(
  [GATBPS_DOCKER_BUILD_word_lines_6],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_word_lines_6 is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_word_lines_6],
  [m4_if(
    [$1],
    [],
    [],
    [[
      ]m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_shift($@))])])

m4_ifdef(
  [GATBPS_DOCKER_BUILD_tag_lines],
  [gatbps_fatal([
    GATBPS_DOCKER_BUILD_tag_lines is already defined
  ])])

GATBPS_DEFINE_UNIQUE(
  [GATBPS_DOCKER_BUILD_tag_lines],
  [m4_if(
    [$1],
    [],
    [],
    [[
      '\''--tag='\'']m4_bpatsubst([[$1]], ['], ['\\''])[ \]dnl
GATBPS_DOCKER_BUILD_tag_lines(m4_shift($@))])])

[

[

GATBPS_DOCKER_BUILD_RULES="$][{GATBPS_DOCKER_BUILD_RULES}"'

]GATBPS_DOCKER_BUILD_rule_lines(m4_if(,,rule_prerequisites))[]dnl
m4_if(
  leaf_prerequisites,
  [],
  [],
  [[
	$][(AM@&t@_V_at)$][(MAKE) \
  $][(AM@&t@_MAKEFLAGS) \]dnl
GATBPS_DOCKER_BUILD_word_lines_2(m4_if(,,child_prerequisites))[
;]])[
	$][(GATBPS_V_DOCKER)$][(GATBPS_RECIPE_STARTING)
	$][(AM@&t@_V_at)rm -f -r ./$][@ ./$][@$][(TMPEXT).tmp*
	$][(AM@&t@_V_at)$][(MKDIR_P) ./$][(@D)
	$][(AM@&t@_V_at){ \
  ( \
    merge=no; \
    context='\'''\''; \
    for x in \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_if(,,child_prerequisites))[
      $][$][{prevent_an_empty_word_list} \
    ; do \
      if test -r "$][$][{x}"; then \
        test \
          -f \
          "$][$][{x}" \
        || test \
          -d \
          "$][$][{x}" \
        || exit $][$][?; \
        case "$][$][{merge}" in \
          no) \
            case "$][$][{context}" in \
              .) \
              ;; \
              ?*) \
                merge=yes; \
                readonly merge; \
              ;; \
              *) \
                context=.; \
              ;; \
            esac; \
          ;; \
        esac; \
      else \
        test \
          -f \
          $][(srcdir)'\''/'\''"$][$][{x}" \
        || test \
          -d \
          $][(srcdir)'\''/'\''"$][$][{x}" \
        || exit $][$][?; \
        case "$][$][{merge}" in \
          no) \
            case "$][$][{context}" in \
              $][(srcdir)) \
              ;; \
              ?*) \
                merge=yes; \
                readonly merge; \
              ;; \
              *) \
                context=$][(srcdir); \
              ;; \
            esac; \
          ;; \
        esac; \
      fi; \
    done; \
    readonly merge; \
    case "$][$][{merge}" in \
      yes) \
        context=./$][@$][(TMPEXT).tmp.context; \
        readonly '\''context'\''; \
        $][(MKDIR_P) \
          "$][$][{context}" \
        || exit $][$][?; \
        cp \
          -R \
          $][(srcdir)'\''/'\'']input_directory['\''/'\''* \
          "$][$][{context}" \
        || exit $][$][?; \
        cp \
          -R \
          ./]input_directory['\''/'\''* \
          "$][$][{context}" \
        || exit $][$][?; \
      ;; \
      no) \
        context="$][$][{context}"'\''/'\'']input_directory[; \
        readonly '\''context'\''; \
      ;; \
    esac; \
    $(]target_slug[_GATBPS_DOCKER_BUILD_CODE) \
    $][(DOCKER) \
      build \
      --tag=tmp$$$$ \]dnl
GATBPS_DOCKER_BUILD_tag_lines(m4_if(,,image_names))[
      --build-arg DOCKERFILE_THREADS=$(DOCKERFILE_THREADS) \
      $(]target_slug[_GATBPS_DOCKER_BUILD_FLAGS) \
      $(GATBPS_DOCKER_BUILD_FLAGS) \
      "$$context" \
    || exit $$?; \
    $][(DOCKER) \
      images \
      --quiet \
      --no-trunc \
      tmp$$$$ \
      >./$][@$(TMPEXT).tmp \
    || exit $$?; \
    $][(DOCKER) rmi tmp$][$][$][$][ || exit; \
    mv -f ./$][@$][(TMPEXT).tmp ./$][@ || exit; \
  :;); \
  x=$][$][?; \
  exit "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

]output_file[: ]output_file[.iid
	$][(GATBPS_V_DOCKER)$][(GATBPS_RECIPE_STARTING)
	$][(AM@&t@_V_at){ \
	  image=`cat ./$][@.iid` || exit; \
	  $][(DOCKER) save "$][$][image" \]dnl
GATBPS_DOCKER_BUILD_word_lines_6(m4_if(,,image_names))[
	    >./$][@$][(TMPEXT).tmp \
	  || exit; \
	  mv -f ./$][@$][(TMPEXT).tmp ./$][@ || exit; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

.PHONY: ]output_file[/clean

]output_file[/clean: FORCE
	-rm -f -r ./$][(@D).iid ./$][(@D).iid$][(TMPEXT).tmp*
	-rm -f -r ./$][(@D) ./$][(@D)$][(TMPEXT).tmp*

]clean_target[-local: ]output_file[/clean

'

]

m4_popdef([rule_prerequisites])
m4_popdef([leaf_prerequisites])
m4_popdef([clean_target])
m4_popdef([child_prerequisites])
m4_popdef([image_names])
m4_popdef([input_directory])
m4_popdef([output_file])
m4_popdef([list_6])
m4_popdef([list_4])
m4_popdef([list_3])
m4_popdef([target_slug])

])

AC_SUBST([GATBPS_DOCKER_BUILD_RULES])
AM_SUBST_NOTMAKE([GATBPS_DOCKER_BUILD_RULES])

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
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_STARTING)
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
      $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
        $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
          $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(java_]gatbps_y[_dep)
./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(java_]gatbps_y[_extra)
./$][(java_]gatbps_y[_dst)$][(GATBPS_INNER_JAR_SUFFIX): $][(javadoc_]gatbps_y[_src)
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_STARTING)
	$][(GATBPS_V_JAR)$][(GATBPS_RECIPE_NOOP)
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
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_FINISHED)

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
          $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
          $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
            $][(srcdir)/build-aux/gatbps-echo.sh -q \
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
dnl
dnl Be careful to support single-line comments inside $1 and $2. In
dnl general, always put $1 and $2 on their own lines so that any
dnl single-line comments inside them don't interfere with the
dnl surrounding code.
dnl
[

]m4_define([GATBPS_LANG_PROGRAM],
  [AC_LANG_CASE([], [([[

    ]])], [C], [AC_LANG_SOURCE([[
      $1
      #if 0
      #elif __clang__
        __attribute__((__optnone__))
        static void f() {
          $2
        }
      #elif __GNUC__
        __attribute__((__optimize__(0)))
        static void f() {
          $2
        }
      #else
        static void f() {
          $2
        }
      #endif
      int main() { f(); return 0; }

    ]])], [C++], [AC_LANG_SOURCE([[
      $1
      #if 0
      #elif __clang__
        __attribute__((__optnone__))
        static void f() {
          $2
        }
      #elif __GNUC__
        __attribute__((__optimize__(0)))
        static void f() {
          $2
        }
      #else
        static void f() {
          $2
        }
      #endif
      int main() { f(); return 0; }

    ]])],
    [GATBPS_AC_BARF([
      GATBPS_LANG_PROGRAM: Language not supported: ]_AC_LANG[.
    ])])])[

]
dnl---------------------------------------------------------------------
dnl GATBPS_SOFT_VAR
dnl---------------------------------------------------------------------

GATBPS_DEFINE_UNIQUE([GATBPS_SOFT_VAR],
  [m4_if(
    m4_bregexp([$1], [^[A-Z_a-z][0-9A-Z_a-z]*$]),
    [-1],
    [m4_fatal([GATBPS_SOFT_VAR: Invalid <name>: '$1'.])],
    m4_bregexp([$2], [^[01]?$]),
    [-1],
    [m4_fatal([GATBPS_SOFT_VAR: Invalid <default_value>: '$2'.])],
    [m4_ifdef(
      [DEFINE_$1],
      [[$1]],
      m4_if(
        m4_eval([$# == 2]),
        [1],
        [[[$2]]],
        [[[1]]]))])])

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
	$][(GATBPS_V_TAR)$][(GATBPS_RECIPE_STARTING)
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
	$(AM@&t@_V_at)$(GATBPS_RECIPE_FINISHED)

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
	$(GATBPS_V_XZ)$(GATBPS_RECIPE_STARTING)]dnl
m4_if([$4], [], [], [[
	$(GATBPS_at)$(MAKE) \
  $(AM@&t@_MAKEFLAGS) \
  ]source_sh[ \
;]])[
	$(AM@&t@_V_at)$(MKDIR_P) $(@D)
	$(AM@&t@_V_at)]GATBPS_SQUISH([(
	  x=]source_sh[;
	  $(GATBPS_VPATH_SEARCH_TOP)
	    "$$x"
	  $(GATBPS_VPATH_SEARCH_BOT);
	  d=$(GATBPS_VPATH_SEARCH_RESULT);
	  $(XZ)
	    -9
	    -T 0
	    <"$$d/$$x"
	    >$(@)$(TSUF)
	  || exit $$?;
	)])[
	$(AM@&t@_V_at)mv -f $(@)$(TSUF) $(@)
	$(AM@&t@_V_at)$(GATBPS_RECIPE_FINISHED)

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
