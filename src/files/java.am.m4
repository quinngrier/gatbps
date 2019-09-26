changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/java.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: java.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_INNER_JAR_SUFFIX = /inner

GATBPS_JDEPS_TO_RULES_SCRIPT = ' \
  { \
    if ($$1 == "->" && $$2 !~ /\$$/) { \
      rule = "$@"; \
      rule = rule ": "; \
      rule = rule "'$(GATBPS_INNER_SOURCEPATH)'"; \
      rule = rule "/"; \
      gsub(/\./, "/", $$2); \
      rule = rule $$2; \
      rule = rule ".java"; \
      print rule; \
    } \
  } \
'

GATBPS_OUTER_JAR_SUFFIX =

GATBPS_V_JAR = $(GATBPS_V_JAR_@AM_V@)

GATBPS_V_JAR_ = $(GATBPS_V_JAR_@AM_DEFAULT_V@)

GATBPS_V_JAR_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'JAR'$(GATBPS_V_PAD_RIGHT_3) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_JAR_1 =

GATBPS_V_JAVAC = $(GATBPS_V_JAVAC_@AM_V@)

GATBPS_V_JAVAC_ = $(GATBPS_V_JAVAC_@AM_DEFAULT_V@)

GATBPS_V_JAVAC_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'JAVAC'$(GATBPS_V_PAD_RIGHT_5) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_JAVAC_1 =

SUFFIXES += .class
SUFFIXES += .java

## end_variables

## begin_rules

$(java_dst)$(GATBPS_OUTER_JAR_SUFFIX) java.dummy_1.main: java.FORCE
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  ( \
    x=''; \
    x="$${x}"'./'; \
    x="$${x}"$(java_sourcepath); \
    x="$${x}"$(CLASSPATH_SEPARATOR); \
    x="$${x}"$(srcdir)'/'$(java_sourcepath); \
    case ''$(CLASSPATH) in \
      ?*) \
        x="$${x}"$(CLASSPATH_SEPARATOR)$(CLASSPATH); \
      ;; \
    esac; \
    case ''$(java_CLASSPATH) in \
      ?*) \
        x="$${x}"$(CLASSPATH_SEPARATOR)$(java_CLASSPATH); \
      ;; \
    esac; \
    $(SHELL) \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      "$${x}" \
      1>'java-main.tmp' \
    || 'exit' "$${?}"; \
    classpath=` \
      'cat' 'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    x='x'; \
    for if_not_blank in \
      $(java_JAVACFLAGS) \
      $${prevent_an_empty_word_list} \
    ; do \
      $(SHELL) \
        '-' \
        $(srcdir)'/build-aux/sh-form.sh' \
        '--' \
        $(java_JAVACFLAGS) \
        1>'java-main.tmp' \
      || 'exit' "$${?}"; \
      x=''; \
      'break'; \
    done; \
    case "$${x}" in \
      ?*) \
        $(SHELL) \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(GATBPS_JAVACFLAGS) \
          1>'java-main.tmp' \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    javacflags=` \
      'cat' 'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    $(SHELL) \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      './'$(java_sourcepath) \
      1>'java-main.tmp' \
    || 'exit' "$${?}"; \
    sourcepath=` \
      'cat' 'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_INNER_CLASSPATH='"$${classpath}" \
      'GATBPS_INNER_JAR_SUFFIX=' \
      'GATBPS_INNER_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_INNER_PACKAGE=$(java_package)' \
      'GATBPS_INNER_SOURCEPATH='"$${sourcepath}" \
      'GATBPS_OUTER_JAR_SUFFIX=/outer' \
      './'$(java_dst) \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;); \
  x="$${?}"; \
  'rm' \
    '-f' \
    'java-main.tmp' \
  ; \
  'exit' "$${x}"; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

./$(java_dst)$(GATBPS_INNER_JAR_SUFFIX): $(java_dep)
./$(java_dst)$(GATBPS_INNER_JAR_SUFFIX): $(java_extra)
./$(java_dst)$(GATBPS_INNER_JAR_SUFFIX): $(javadoc_src)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(GATBPS_V_JAR)$(GATBPS_V_NOP)
	$(AM_V_at){ \
  ( \
    'rm' \
      '-f' \
      '-r' \
      './'$(java_dst)'.tmp' \
    || 'exit' "$${?}"; \
    $(MKDIR_P) \
      './'$(java_dst)'.tmp/x' \
    || 'exit' "$${?}"; \
    c='cf'; \
 \
    : \
    : Compile the .class files in conservatively sized groups. This \
    : prevents us from exceeding any command line length limits and \
    : still lets make -j do some parallelization. \
    ; \
 \
    max=50; \
    xs=; \
    n=0; \
    for x in $(java_src); do \
      xs="$$xs $$x"; \
      n=`expr $$n + 1` || exit $$?; \
      case $$n in \
        $$max) \
          $(MAKE) $(AM_MAKEFLAGS) $$xs || exit $$?; \
          xs=; \
          n=0; \
        ;; \
      esac; \
    done; \
    case $$n in \
      0) \
      ;; \
      *) \
        $(MAKE) $(AM_MAKEFLAGS) $$xs || exit $$?; \
      ;; \
    esac; \
 \
    for x in \
      $(java_extra) \
      $(java_nested) \
      $(java_src) \
    ; do \
      case "$${x}" in \
        *'*'*) \
          continue; \
        ;; \
      esac; \
      if 'test' '-f' "$${x}"; then \
        d='.'; \
      else \
        d=$(srcdir); \
        case "$${d}" in \
          '/'*) \
          ;; \
          *) \
            d='./'"$${d}"; \
          ;; \
        esac; \
      fi; \
      $(JAR) \
        "$${c}" \
        './'$(java_dst)'.tmp/x.jar' \
        '-C' \
        "$${d}" \
        './'"$${x}" \
      || 'exit' "$${?}"; \
      c='uf'; \
    done; \
    ( \
      'cd' \
        './'$(java_dst)'.tmp/x' \
      || 'exit' "$${?}"; \
      $(JAR) \
        'xf' \
        '../x.jar' \
      || 'exit' "$${?}"; \
      'exit' '0'; \
    :;) || 'exit' "$${?}"; \
    x='x'; \
    for if_not_blank in \
      $(java_JARFLAGS) \
      $${prevent_an_empty_word_list} \
    ; do \
      $(JAR) \
        'cf' \
        './'$(java_dst) \
        '-C' \
        './'$(java_dst)'.tmp/x/'$(GATBPS_INNER_SOURCEPATH) \
        $(java_JARFLAGS) \
        $(JARFLAGS) \
        '.' \
      || 'exit' "$${?}"; \
      x=''; \
      'break'; \
    done; \
    case "$${x}" in \
      ?*) \
        $(JAR) \
          'cf' \
          './'$(java_dst) \
          '-C' \
          './'$(java_dst)'.tmp/x/'$(GATBPS_INNER_SOURCEPATH) \
          $(GATBPS_JARFLAGS) \
          $(JARFLAGS) \
          '.' \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    'exit' '0'; \
  :;); \
  x="$${?}"; \
  'rm' \
    '-f' \
    '-r' \
    './'$(java_dst)'.tmp' \
  ; \
  'exit' "$${x}"; \
:;}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

.PHONY: clean-java
.PHONY: clean-java-main
.PHONY: install-java
.PHONY: install-java-main
.PHONY: java
.PHONY: java-main
.PHONY: java.FORCE
.PHONY: uninstall-java
.PHONY: uninstall-java-main

.java.class:
	$(GATBPS_V_JAVAC)$(MKDIR_P) \
  $(GATBPS_INNER_SOURCEPATH) \
;
	$(AM_V_at)$(JAVAC) |%}dnl
{%|-Xprefer:source |%}dnl
{%|-cp |%}dnl
{%|$(GATBPS_INNER_CLASSPATH) |%}dnl
{%|-d |%}dnl
{%|$(GATBPS_INNER_SOURCEPATH) |%}dnl
{%|-implicit:none |%}dnl
{%|-sourcepath |%}dnl
{%|$(GATBPS_INNER_SOURCEPATH)$(CLASSPATH_SEPARATOR)$(srcdir)/$(GATBPS_INNER_SOURCEPATH) |%}dnl
{%|$(GATBPS_INNER_JAVACFLAGS) |%}dnl
{%|$(JAVACFLAGS) |%}dnl
{%|$<
	$(AM_V_at){ \
  ( \
    have_jdeps='no'; \
    for if_not_blank in \
      $(JDEPS) \
      $${prevent_an_empty_word_list} \
    ; do \
      have_jdeps='yes'; \
      'break'; \
    done; \
    'readonly' 'have_jdeps'; \
    case "$${have_jdeps}" in \
      'yes') \
        $(JDEPS) \
          '-filter:none' \
          '-package' \
          $(GATBPS_INNER_PACKAGE) \
          '-verbose:class' \
          './'$@ \
          0</dev/null \
          1>'./'$@'.d.tmp1' \
        || 'exit' "$${?}"; \
        $(AWK) \
          $(GATBPS_JDEPS_TO_RULES_SCRIPT) \
          0<'./'$@'.d.tmp1' \
          1>'./'$@'.d.tmp2' \
        || 'exit' "$${?}"; \
        'mv' \
          '-f' \
          './'$@'.d.tmp2' \
          './'$@'.d' \
        || 'exit' "$${?}"; \
        'touch' \
          './'$@ \
          0</dev/null \
        || 'exit' "$${?}"; \
      ;; \
      'no') \
        $(SHELL) \
          '-' \
          $(srcdir)'/build-aux/echo.sh' \
          '--' \
          'warning: automatic dependency' \
          'tracking is not available for Java' \
          0</dev/null \
          1>&2 \
        || 'exit' "$${?}"; \
        'touch' \
          './'$@'.d' \
          0</dev/null \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    'exit' '0'; \
  :;); \
  exit_status="$${?}"; \
  'readonly' 'exit_status'; \
  'rm' \
    '-f' \
    './'$@'.d.tmp1' \
  ; \
  case "$${exit_status}" in \
    '0') \
    ;; \
    *) \
      'rm' \
        '-f' \
        './'$@'.d' \
        './'$@'.d.tmp2' \
      ; \
    ;; \
  esac; \
  'exit' "$${exit_status}"; \
:;}

clean-java: clean-java-main
clean-java: java.FORCE

clean-java-main: java.FORCE
	-{ \
  for x in \
    $(java_dst) \
    $(java_nested) \
    $(java_src) \
  ; do \
    'rm' \
      '-f' \
      './'"$${x}" \
    ; \
  done; \
  'exit' '0'; \
:;}

clean-local: clean-java

install-java: install-java-main
install-java: java.FORCE

install-java-main: java-main
install-java-main: java.FORCE
	@$(NORMAL_INSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|java_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(java_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      d=$(DESTDIR)$(javadir); \
      case "$${d}" in \
        '/'*) \
        ;; \
        *) \
          d='./'"$${d}"; \
        ;; \
      esac; \
      if $(AM_V_P); then \
        ':'; \
      else \
        $(SHELL) \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(MKDIR_P) \
          "$${d}" \
        ; \
      fi; \
      $(MKDIR_P) \
        "$${d}" \
      || 'exit' "$${?}"; \
      if 'test' '-f' $(java_dst); then \
        x='.'; \
      else \
        x=$(srcdir); \
        case "$${x}" in \
          '/'*) \
          ;; \
          *) \
            x='./'"$${x}"; \
          ;; \
        esac; \
      fi; \
      x="$${x}"'/'$(java_dst); \
      if $(AM_V_P); then \
        ':'; \
      else \
        $(SHELL) \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(INSTALL_DATA) \
          "$${x}" \
          "$${d}" \
        ; \
      fi; \
      $(INSTALL_DATA) \
        "$${x}" \
        "$${d}" \
      || 'exit' "$${?}"; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

java: java-main
java: java.FORCE

java-main: $(java_dst)
java-main: java.FORCE

java.FORCE:

uninstall-java: java.FORCE
uninstall-java: uninstall-java-main

uninstall-java-main: java.FORCE
	@$(NORMAL_UNINSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|java_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(java_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      ( \
        'expr' \
          'X/'$(java_dst) \
          ':' \
          'X.*/\(.*\)' \
          1>'uninstall-java-main.tmp' \
        || 'exit' "$${?}"; \
        x=$(srcdir); \
        x=` \
          $(SHELL) \
            '-' \
            "$${x}"'/build-aux/sh-form.sh' \
            '--stdin' \
            0<'uninstall-java-main.tmp' \
          ; \
        ` || 'exit' "$${?}"; \
        'eval' 'x='"$${x}"; \
        x=$(DESTDIR)$(javadir)'/'"$${x}"; \
        case "$${x}" in \
          '/'*) \
          ;; \
          *) \
            x='./'"$${x}"; \
          ;; \
        esac; \
        if $(AM_V_P); then \
          ':'; \
        else \
          $(SHELL) \
            '-' \
            $(srcdir)'/build-aux/sh-form.sh' \
            '--' \
            'rm' \
            '-f' \
            "$${x}" \
          ; \
        fi; \
        'rm' \
          '-f' \
          "$${x}" \
        ; \
        'exit' '0'; \
      :;); \
      x="$${?}"; \
      'rm' \
        '-f' \
        'uninstall-java-main.tmp' \
      ; \
      'exit' "$${x}"; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
