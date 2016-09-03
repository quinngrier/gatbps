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

GATBPS_V_JAR_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  JAR     ' \
  $@ \
|| 'exit' '1';

GATBPS_V_JAR_1 =

GATBPS_V_JAVAC = $(GATBPS_V_JAVAC_@AM_V@)

GATBPS_V_JAVAC_ = $(GATBPS_V_JAVAC_@AM_DEFAULT_V@)

GATBPS_V_JAVAC_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  JAVAC   ' \
  $@ \
;

GATBPS_V_JAVAC_1 =

SUFFIXES += .class
SUFFIXES += .java

## end_variables

## begin_rules

./$(java_dst): $(java_dep)
./$(java_dst): $(java_extra)
./$(java_dst): $(java_src)
	$(GATBPS_V_JAR)':'
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
    for y in $(java_JARFLAGS); do \
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

.PHONY: clean-java
.PHONY: clean-java-main
.PHONY: install-java
.PHONY: install-java-main
.PHONY: java
.PHONY: java-main
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
  $(GATBPS_RECURSIVE_SOURCEPATH)':'$(srcdir)'/'$(GATBPS_RECURSIVE_SOURCEPATH) \
  $(GATBPS_RECURSIVE_JAVACFLAGS) \
  $(JAVACFLAGS) \
  $< \
;

clean-java: clean-java-main

clean-java-main:
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

install-java-main: java-main
	@$(NORMAL_INSTALL)
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|java_dst|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|javadir|%}){%|
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
        'sh' \
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
        'sh' \
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

java-main:
	$(AM_V_at){ \
  ( \
    x=''; \
    x="$${x}"'./'; \
    x="$${x}"$(java_sourcepath); \
    x="$${x}"':'; \
    x="$${x}"$(srcdir)'/'$(java_sourcepath); \
    case ''$(CLASSPATH) in \
      ?*) \
        x="$${x}"':'$(CLASSPATH); \
      ;; \
    esac; \
    case ''$(java_CLASSPATH) in \
      ?*) \
        x="$${x}"':'$(java_CLASSPATH); \
      ;; \
    esac; \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      "$${x}" \
      >'java-main.tmp' \
    || 'exit' "$${?}"; \
    classpath=`'cat' \
      'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    x='x'; \
    for y in $(java_JAVACFLAGS); do \
      'sh' \
        '-' \
        $(srcdir)'/build-aux/sh-form.sh' \
        '--' \
        $(java_JAVACFLAGS) \
        >'java-main.tmp' \
      || 'exit' "$${?}"; \
      javacflags=`'cat' \
        'java-main.tmp' \
      ` || 'exit' "$${?}"; \
      x=''; \
      'break'; \
    done; \
    case "$${x}" in \
      ?*) \
        'sh' \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(GATBPS_JAVACFLAGS) \
          >'java-main.tmp' \
        || 'exit' "$${?}"; \
        javacflags=`'cat' \
          'java-main.tmp' \
        ` || 'exit' "$${?}"; \
      ;; \
    esac; \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      './'$(java_sourcepath) \
      >'java-main.tmp' \
    || 'exit' "$${?}"; \
    sourcepath=`'cat' \
      'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_RECURSIVE_CLASSPATH='"$${classpath}" \
      'GATBPS_RECURSIVE_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_RECURSIVE_SOURCEPATH='"$${sourcepath}" \
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

uninstall-java: uninstall-java-main

uninstall-java-main:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|java_dst|%}){%|
	$(AM_V_at)|%}dnl
contains_exactly_one_word(
  {%|javadir|%}){%|
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
        x=`'sh' \
          '-' \
          "$${x}"'/build-aux/sh-form.sh' \
          '--stdin' \
          <'uninstall-java-main.tmp' \
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
          'sh' \
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
