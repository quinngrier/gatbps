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

GATBPS_V_JAR = $(GATBPS_V_JAR_@AM_V@)

GATBPS_V_JAR_ = $(GATBPS_V_JAR_@AM_DEFAULT_V@)

GATBPS_V_JAR_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'JAR'$(GATBPS_V_PAD_RIGHT_3) \
  $@ \
|| 'exit' "$${?}";

GATBPS_V_JAR_1 =

GATBPS_V_JAR_RECURSIVE = $(GATBPS_V_JAR_RECURSIVE_@AM_V@)

GATBPS_V_JAR_RECURSIVE_ = $(GATBPS_V_JAR_RECURSIVE_@AM_DEFAULT_V@)

GATBPS_V_JAR_RECURSIVE_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'JAR'$(GATBPS_V_PAD_RIGHT_3) \
  $(@D) \
|| 'exit' "$${?}";

GATBPS_V_JAR_RECURSIVE_1 =

GATBPS_V_JAVAC = $(GATBPS_V_JAVAC_@AM_V@)

GATBPS_V_JAVAC_ = $(GATBPS_V_JAVAC_@AM_DEFAULT_V@)

GATBPS_V_JAVAC_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'JAVAC'$(GATBPS_V_PAD_RIGHT_5) \
  $@ \
|| 'exit' "$${?}";

GATBPS_V_JAVAC_1 =

SUFFIXES += .class
SUFFIXES += .java

gatbps_jdeps_to_rules = ' \
  { \
    if ($$1 == "->" && $$2 !~ /\$$/) { \
      rule = "$@"; \
      rule = rule ": "; \
      rule = rule "'$(GATBPS_RECURSIVE_SOURCEPATH)'"; \
      rule = rule "/"; \
      gsub(/\./, "/", $$2); \
      rule = rule $$2; \
      rule = rule ".java"; \
      print rule; \
    } \
  } \
'

## end_variables

## begin_rules

$(java_dst) java.dummy_1.main: java.FORCE
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
      >'java-main.tmp' \
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
        >'java-main.tmp' \
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
          >'java-main.tmp' \
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
      >'java-main.tmp' \
    || 'exit' "$${?}"; \
    sourcepath=` \
      'cat' 'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_RECURSIVE_CLASSPATH='"$${classpath}" \
      'GATBPS_RECURSIVE_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_RECURSIVE_PACKAGE=$(java_package)' \
      'GATBPS_RECURSIVE_SOURCEPATH='"$${sourcepath}" \
      './'$(java_dst)'/recursive' \
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

./$(java_dst)/recursive: $(java_dep)
./$(java_dst)/recursive: $(java_extra)
./$(java_dst)/recursive: $(java_src)
./$(java_dst)/recursive: $(javadoc_src)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(GATBPS_V_JAR_RECURSIVE)$(GATBPS_V_NOP)
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
        './'$(java_dst)'.tmp/x/'$(GATBPS_RECURSIVE_SOURCEPATH) \
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
          './'$(java_dst)'.tmp/x/'$(GATBPS_RECURSIVE_SOURCEPATH) \
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

.PHONY: ./$(java_dst)/recursive
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
  $(GATBPS_RECURSIVE_SOURCEPATH) \
;
	$(AM_V_at)$(JAVAC) \
  '-Xprefer:source' \
  '-classpath' \
  $(GATBPS_RECURSIVE_CLASSPATH) \
  '-d' \
  $(GATBPS_RECURSIVE_SOURCEPATH) \
  '-implicit:none' \
  '-sourcepath' \
  $(GATBPS_RECURSIVE_SOURCEPATH)$(CLASSPATH_SEPARATOR)$(srcdir)'/'$(GATBPS_RECURSIVE_SOURCEPATH) \
  $(GATBPS_RECURSIVE_JAVACFLAGS) \
  $(JAVACFLAGS) \
  $< \
;
	$(AM_V_at){ \
  ( \
    for if_not_blank in \
      $(JDEPS) \
      $${prevent_an_empty_word_list} \
    ; do \
      $(JDEPS) \
        '-filter:none' \
        '-package' \
        $(GATBPS_RECURSIVE_PACKAGE) \
        '-verbose:class' \
        './'$@ \
        >'./'$@'.d.tmp-jdeps' \
      || 'exit' "$${?}"; \
      $(AWK) \
        $(gatbps_jdeps_to_rules) \
        <'./'$@'.d.tmp-jdeps' \
        >'./'$@'.d.tmp' \
      || 'exit' "$${?}"; \
      'mv' \
        './'$@'.d.tmp' \
        './'$@'.d' \
      || 'exit' "$${?}"; \
      'break'; \
    done; \
    'exit' '0'; \
  :;); \
  exit_status="$${?}"; \
  'readonly' 'exit_status'; \
  'rm' \
    '-f' \
    './'$@'.d.tmp-jdeps' \
  ; \
  case "$${exit_status}" in \
    '0') \
    ;; \
    *) \
      'rm' \
        '-f' \
        './'$@'.d' \
        './'$@'.d.tmp' \
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
          >'uninstall-java-main.tmp' \
        || 'exit' "$${?}"; \
        x=$(srcdir); \
        x=` \
          $(SHELL) \
            '-' \
            "$${x}"'/build-aux/sh-form.sh' \
            '--stdin' \
            <'uninstall-java-main.tmp' \
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
