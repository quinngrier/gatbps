changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/java.am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
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
;

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

## end_variables

## begin_rules

./$(java_dst): $(java_dep)
./$(java_dst): $(java_extra)
./$(java_dst): $(java_src)
	$(GATBPS_V_JAR){ \
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
          '-'*) \
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
    $(JAR) \
      'cf' \
      './'$(java_dst) \
      '-C' \
      './'$(java_dst)'.tmp/x/'$(GATBPS_SOURCEPATH) \
      '.' \
    || 'exit' "$${?}"; \
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

.PHONY: all-java
.PHONY: clean-java
.PHONY: install-all-java
.PHONY: install-java
.PHONY: java
.PHONY: uninstall-all-java
.PHONY: uninstall-java

.java.class:
	$(GATBPS_V_JAVAC)$(MKDIR_P) \
  $(GATBPS_SOURCEPATH) \
;
	$(AM_V_at)$(JAVAC) \
  '-Xprefer:source' \
  '-classpath' \
  $(GATBPS_CLASSPATH) \
  '-d' \
  $(GATBPS_SOURCEPATH) \
  '-implicit:none' \
  '-sourcepath' \
  $(GATBPS_SOURCEPATH)':'$(srcdir)'/'$(GATBPS_SOURCEPATH) \
  $(GATBPS_JAVACFLAGS) \
  $(JAVACFLAGS) \
  $< \
;

all-java: java

clean-java:
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

install-all-java: install-java

install-java: java
	@$(NORMAL_INSTALL)
	$(AM_V_at){ \
  case ''$(java_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(javadir) in \
        ?*) \
          d=$(DESTDIR)$(javadir); \
          case "$${d}" in \
            '-'*) \
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
              '-'*) \
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
    ;; \
  esac; \
  'exit' '0'; \
:;}

java:
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
      >'java.tmp' \
    || 'exit' "$${?}"; \
    classpath=`'cat' \
      'java.tmp' \
    ` || 'exit' "$${?}"; \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      $(java_JAVACFLAGS) \
      >'java.tmp' \
    || 'exit' "$${?}"; \
    javacflags=`'cat' \
      'java.tmp' \
    ` || 'exit' "$${?}"; \
    'sh' \
      '-' \
      $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      './'$(java_sourcepath) \
      >'java.tmp' \
    || 'exit' "$${?}"; \
    sourcepath=`'cat' \
      'java.tmp' \
    ` || 'exit' "$${?}"; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_CLASSPATH='"$${classpath}" \
      'GATBPS_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_SOURCEPATH='"$${sourcepath}" \
      './'$(java_dst) \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;); \
  x="$${?}"; \
  'rm' \
    '-f' \
    'java.tmp' \
  ; \
  'exit' "$${x}"; \
:;}

uninstall-all-java: uninstall-java

uninstall-java:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at){ \
  case ''$(java_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(javadir) in \
        ?*) \
          ( \
            'expr' \
              'X/'$(java_dst) \
              ':' \
              'X.*/\(.*\)' \
              >'uninstall-java.tmp' \
            || 'exit' "$${?}"; \
            x=$(srcdir); \
            x='x='`'sh' \
              '-' \
              "$${x}"'/build-aux/sh-form.sh' \
              '--stdin' \
              <'uninstall-java.tmp' \
            ` || 'exit' "$${?}"; \
            'eval' "$${x}"; \
            x=$(DESTDIR)$(javadir)'/'"$${x}"; \
            case "$${x}" in \
              '-'*) \
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
            'uninstall-java.tmp' \
          ; \
          'exit' "$${x}"; \
        ;; \
      esac; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
