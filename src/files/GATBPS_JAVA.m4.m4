changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_JAVA.m4.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_DAY_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_MONTH_ZPAD.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_YEAR.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word_sh.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_JAVA.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
#serial |%}dnl
PACKAGE_DATE_YEAR{%||%}dnl
PACKAGE_DATE_MONTH_ZPAD{%||%}dnl
PACKAGE_DATE_DAY_ZPAD{%||%}dnl
{%|
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

$][(java_]gatbps_y[_dst) java.dummy_1.]gatbps_x[: java.FORCE
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(AM@&t@_V_at){ \
  ( \
    x='\'''\''; \
    x="$][$][{x}"'\''./'\''; \
    x="$][$][{x}"$][(java_]gatbps_y[_sourcepath); \
    x="$][$][{x}"$][(CLASSPATH_SEPARATOR); \
    x="$][$][{x}"$][(srcdir)'\''/'\''$][(java_]gatbps_y[_sourcepath); \
    case '\'''\''$][(CLASSPATH) in \
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
      $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
      '\''--'\'' \
      "$][$][{x}" \
      >'\''java-]gatbps_x[.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    classpath=` \
      '\''cat'\'' '\''java-]gatbps_x[.tmp'\'' \
    ` || '\''exit'\'' "$][$][{?}"; \
    x='\''x'\''; \
    for if_not_blank in \
      $][(java_]gatbps_y[_JAVACFLAGS) \
      $][$][{prevent_an_empty_word_list} \
    ; do \
      $][(SHELL) \
        '\''-'\'' \
        $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
        '\''--'\'' \
        $][(java_]gatbps_y[_JAVACFLAGS) \
        >'\''java-]gatbps_x[.tmp'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      x='\'''\''; \
      '\''break'\''; \
    done; \
    case "$][$][{x}" in \
      ?*) \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
          '\''--'\'' \
          $][(GATBPS_JAVACFLAGS) \
          >'\''java-]gatbps_x[.tmp'\'' \
        || '\''exit'\'' "$][$][{?}"; \
      ;; \
    esac; \
    javacflags=` \
      '\''cat'\'' '\''java-]gatbps_x[.tmp'\'' \
    ` || '\''exit'\'' "$][$][{?}"; \
    $][(SHELL) \
      '\''-'\'' \
      $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
      '\''--'\'' \
      '\''./'\''$][(java_]gatbps_y[_sourcepath) \
      >'\''java-]gatbps_x[.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    sourcepath=` \
      '\''cat'\'' '\''java-]gatbps_x[.tmp'\'' \
    ` || '\''exit'\'' "$][$][{?}"; \
    $][(MAKE) \
      $][(AM@&t@_MAKEFLAGS) \
      '\''GATBPS_RECURSIVE_CLASSPATH='\''"$][$][{classpath}" \
      '\''GATBPS_RECURSIVE_JAVACFLAGS='\''"$][$][{javacflags}" \
      '\''GATBPS_RECURSIVE_PACKAGE=$][(java_]gatbps_y[_package)'\'' \
      '\''GATBPS_RECURSIVE_SOURCEPATH='\''"$][$][{sourcepath}" \
      '\''./'\''$][(java_]gatbps_y[_dst)'\''/recursive'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$][$][{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''java-]gatbps_x[.tmp'\'' \
  ; \
  '\''exit'\'' "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

./$][(java_]gatbps_y[_dst)/recursive: $][(java_]gatbps_y[_dep)
./$][(java_]gatbps_y[_dst)/recursive: $][(java_]gatbps_y[_extra)
./$][(java_]gatbps_y[_dst)/recursive: $][(java_]gatbps_y[_src)
./$][(java_]gatbps_y[_dst)/recursive: $][(javadoc_]gatbps_y[_src)
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_TOP)
	$][(GATBPS_V_JAR_RECURSIVE)$][(GATBPS_V_NOP)
	$][(AM@&t@_V_at){ \
  ( \
    '\''rm'\'' \
      '\''-f'\'' \
      '\''-r'\'' \
      '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    $][(MKDIR_P) \
      '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp/x'\'' \
    || '\''exit'\'' "$][$][{?}"; \
    c='\''cf'\''; \
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
      if '\''test'\'' '\''-f'\'' "$][$][{x}"; then \
        d='\''.'\''; \
      else \
        d=$][(srcdir); \
        case "$][$][{d}" in \
          '\''/'\''*) \
          ;; \
          *) \
            d='\''./'\''"$][$][{d}"; \
          ;; \
        esac; \
      fi; \
      $][(JAR) \
        "$][$][{c}" \
        '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp/x.jar'\'' \
        '\''-C'\'' \
        "$][$][{d}" \
        '\''./'\''"$][$][{x}" \
      || '\''exit'\'' "$][$][{?}"; \
      c='\''uf'\''; \
    done; \
    ( \
      '\''cd'\'' \
        '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp/x'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      $][(JAR) \
        '\''xf'\'' \
        '\''../x.jar'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      '\''exit'\'' '\''0'\''; \
    :;) || '\''exit'\'' "$][$][{?}"; \
    x='\''x'\''; \
    for if_not_blank in \
      $][(java_]gatbps_y[_JARFLAGS) \
      $][$][{prevent_an_empty_word_list} \
    ; do \
      $][(JAR) \
        '\''cf'\'' \
        '\''./'\''$][(java_]gatbps_y[_dst) \
        '\''-C'\'' \
        '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp/x/'\''$][(GATBPS_RECURSIVE_SOURCEPATH) \
        $][(java_]gatbps_y[_JARFLAGS) \
        $][(JARFLAGS) \
        '\''.'\'' \
      || '\''exit'\'' "$][$][{?}"; \
      x='\'''\''; \
      '\''break'\''; \
    done; \
    case "$][$][{x}" in \
      ?*) \
        $][(JAR) \
          '\''cf'\'' \
          '\''./'\''$][(java_]gatbps_y[_dst) \
          '\''-C'\'' \
          '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp/x/'\''$][(GATBPS_RECURSIVE_SOURCEPATH) \
          $][(GATBPS_JARFLAGS) \
          $][(JARFLAGS) \
          '\''.'\'' \
        || '\''exit'\'' "$][$][{?}"; \
      ;; \
    esac; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$][$][{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''-r'\'' \
    '\''./'\''$][(java_]gatbps_y[_dst)'\''.tmp'\'' \
  ; \
  '\''exit'\'' "$][$][{x}"; \
:;}
	$][(AM@&t@_V_at)$][(GATBPS_RECIPE_MARKER_BOT)

.PHONY: ./$][(java_]gatbps_y[_dst)/recursive
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
    '\''rm'\'' \
      '\''-f'\'' \
      '\''./'\''"$][$][{x}" \
    ; \
  done; \
  '\''exit'\'' '\''0'\''; \
:;}

install-java: install-java-]gatbps_x[

install-java-]gatbps_x[: java-]gatbps_x[
install-java-]gatbps_x[: java.FORCE
	@$][(NORMAL_INSTALL)
	$][(AM@&t@_V_at)|%}contains_exactly_one_word_sh(
  {%|java_]gatbps_y[_dst|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at)|%}contains_exactly_one_word_sh(
  {%|javadir|%}){%||%}dnl
{%|
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
          d='\''./'\''"$][$][{d}"; \
        ;; \
      esac; \
      if $][(AM@&t@_V_P); then \
        '\'':'\''; \
      else \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
          '\''--'\'' \
          $][(MKDIR_P) \
          "$][$][{d}" \
        ; \
      fi; \
      $][(MKDIR_P) \
        "$][$][{d}" \
      || '\''exit'\'' "$][$][{?}"; \
      if '\''test'\'' '\''-f'\'' $][(java_]gatbps_y[_dst); then \
        x='\''.'\''; \
      else \
        x=$][(srcdir); \
        case "$][$][{x}" in \
          '\''/'\''*) \
          ;; \
          *) \
            x='\''./'\''"$][$][{x}"; \
          ;; \
        esac; \
      fi; \
      x="$][$][{x}"'\''/'\''$][(java_]gatbps_y[_dst); \
      if $][(AM@&t@_V_P); then \
        '\'':'\''; \
      else \
        $][(SHELL) \
          '\''-'\'' \
          $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
          '\''--'\'' \
          $][(INSTALL_DATA) \
          "$][$][{x}" \
          "$][$][{d}" \
        ; \
      fi; \
      $][(INSTALL_DATA) \
        "$][$][{x}" \
        "$][$][{d}" \
      || '\''exit'\'' "$][$][{?}"; \
    ;; \
  esac; \
  '\''exit'\'' '\''0'\''; \
:;}

java: java-]gatbps_x[

java-]gatbps_x[: $][(java_]gatbps_y[_dst)
java-]gatbps_x[: java.FORCE

uninstall-java: uninstall-java-]gatbps_x[

uninstall-java-]gatbps_x[: java.FORCE
	@$][(NORMAL_UNINSTALL)
	$][(AM@&t@_V_at)|%}contains_exactly_one_word_sh(
  {%|java_]gatbps_y[_dst|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at)|%}contains_exactly_one_word_sh(
  {%|javadir|%}){%||%}dnl
{%|
	$][(AM@&t@_V_at){ \
  x='\''x'\''; \
  for y in $][(java_]gatbps_y[_noinst); do \
    x='\'''\''; \
    '\''break'\''; \
  done; \
  case "$][$][{x}" in \
    ?*) \
      ( \
        '\''expr'\'' \
          '\''X/'\''$][(java_]gatbps_y[_dst) \
          '\'':'\'' \
          '\''X.*/\(.*\)'\'' \
          >'\''uninstall-java-]gatbps_x[.tmp'\'' \
        || '\''exit'\'' "$][$][{?}"; \
        x=$][(srcdir); \
        x=` \
          $][(SHELL) \
            '\''-'\'' \
            "$][$][{x}"'\''/build-aux/sh-form.sh'\'' \
            '\''--stdin'\'' \
            <'\''uninstall-java-]gatbps_x[.tmp'\'' \
          ; \
        ` || '\''exit'\'' "$][$][{?}"; \
        '\''eval'\'' '\''x='\''"$][$][{x}"; \
        x=$][(DESTDIR)$][(javadir)'\''/'\''"$][$][{x}"; \
        case "$][$][{x}" in \
          '\''/'\''*) \
          ;; \
          *) \
            x='\''./'\''"$][$][{x}"; \
          ;; \
        esac; \
        if $][(AM@&t@_V_P); then \
          '\'':'\''; \
        else \
          $][(SHELL) \
            '\''-'\'' \
            $][(srcdir)'\''/build-aux/sh-form.sh'\'' \
            '\''--'\'' \
            '\''rm'\'' \
            '\''-f'\'' \
            "$][$][{x}" \
          ; \
        fi; \
        '\''rm'\'' \
          '\''-f'\'' \
          "$][$][{x}" \
        ; \
        '\''exit'\'' '\''0'\''; \
      :;); \
      x="$][$][{?}"; \
      '\''rm'\'' \
        '\''-f'\'' \
        '\''uninstall-java-]gatbps_x[.tmp'\'' \
      ; \
      '\''exit'\'' "$][$][{x}"; \
    ;; \
  esac; \
  '\''exit'\'' '\''0'\''; \
:;}

'

]

    m4_popdef([gatbps_y])[]dnl
    m4_popdef([gatbps_x])[]dnl

:;}])[]dnl
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
