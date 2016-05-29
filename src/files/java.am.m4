changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: java.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_JAR = $(GATBPS_V_JAR_@AM_V@)

GATBPS_V_JAR_ = $(GATBPS_V_JAR_@AM_DEFAULT_V@)

GATBPS_V_JAR_0 = @'echo' '  JAR' $@;

GATBPS_V_JAR_1 =

GATBPS_V_JAVAC = $(GATBPS_V_JAVAC_@AM_V@)

GATBPS_V_JAVAC_ = $(GATBPS_V_JAVAC_@AM_DEFAULT_V@)

GATBPS_V_JAVAC_0 = @'echo' '  JAVAC' $@;

GATBPS_V_JAVAC_1 =

## end_variables

## begin_rules

./$(java_dst): $(java_dep)
./$(java_dst): $(java_extra)
./$(java_dst): $(java_src)
	@-':' #(
	$(AM_V_at){ \
  'rm' \
    '-f' \
    '-r' \
    './'$(java_dst)'.tmp' \
  || 'exit' "$${?}"; \
  ( \
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
    'cd' \
      './'$(java_dst)'.tmp/x' \
    || 'exit' "$${?}"; \
    $(JAR) \
      'xf' \
      '../x.jar' \
    ; \
    'exit' "$${?}"; \
  :;) || { \
    x="$${?}"; \
    'rm' \
      '-f' \
      '-r' \
      './'$(java_dst)'.tmp' \
    ; \
    'exit' "$${x}"; \
  :;}; \
  $(JAR) \
    'cf' \
    './'$(java_dst) \
    '-C' \
    './'$(java_dst)'.tmp/x/'$(GATBPS_SOURCEPATH) \
    '.' \
  ; \
  x="$${?}"; \
  'rm' \
    '-f' \
    '-r' \
    './'$(java_dst)'.tmp' \
  ; \
  'exit' "$${x}"; \
:;}

.PHONY: clean-first-java
.PHONY: first-java
.PHONY: install-first-java
.PHONY: install-java
.PHONY: java
.PHONY: uninstall-first-java
.PHONY: uninstall-java

.java.class:
	$(GATBPS_V_JAVAC)$(MKDIR_P) $(GATBPS_SOURCEPATH)
	$(AM_V_at)$(JAVAC) \
  '-classpath' \
  $(GATBPS_CLASSPATH) \
  '-d' \
  $(GATBPS_SOURCEPATH) \
  '-sourcepath' \
  $(GATBPS_SOURCEPATH)':'$(srcdir)'/'$(GATBPS_SOURCEPATH) \
  $(GATBPS_JAVACFLAGS) \
  $(JAVACFLAGS) \
  $< \
;

clean-first-java:
	-rm -f $(java_dst)
	-rm -f $(java_src) $(java_nested)

clean-local: clean-first-java

first-java:
	@-':' #((
	$(GATBPS_V_JAR){ \
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
  ( \
    'sh' $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      "$${x}" \
      >'first-java.tmp' \
    || 'exit' "$${?}"; \
    classpath=` \
      'cat' 'first-java.tmp' \
    ` || 'exit' "$${?}"; \
    'sh' $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      $(java_JAVACFLAGS) \
      >'first-java.tmp' \
    || 'exit' "$${?}"; \
    javacflags=` \
      'cat' 'first-java.tmp' \
    ` || 'exit' "$${?}"; \
    'sh' $(srcdir)'/build-aux/sh-form.sh' \
      '--' \
      './'$(java_sourcepath) \
      >'first-java.tmp' \
    || 'exit' "$${?}"; \
    sourcepath=` \
      'cat' 'first-java.tmp' \
    ` || 'exit' "$${?}"; \
    'rm' '-f' 'first-java.tmp'; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_CLASSPATH='"$${classpath}" \
      'GATBPS_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_SOURCEPATH='"$${sourcepath}" \
      './'$(java_dst) \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;) || { \
    x="$${?}"; \
    'rm' '-f' 'first-java.tmp'; \
    'exit' "$${x}"; \
  :;}; \
  'exit' '0'; \
:;}

install-first-java: first-java
	@$(NORMAL_INSTALL)
	@-':' #(((
	@{ \
  case ''$(java_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(javadir) in \
        ?*) \
          echo " $(MKDIR_P) '$(DESTDIR)$(javadir)'"; \
          $(MKDIR_P) $(DESTDIR)$(javadir) || exit $$?; \
          if test -f $(java_dst); then \
            x=$(java_dst); \
          else \
            x=$(srcdir)/$(java_dst); \
          fi; \
          echo " $(INSTALL_DATA) $$x '$(DESTDIR)$(javadir)'"; \
          $(INSTALL_DATA) $$x $(DESTDIR)$(javadir) || exit $$?; \
        ;; \
      esac; \
    ;; \
  esac; \
  exit 0; \
:;}

install-java: install-first-java

java: first-java

uninstall-first-java:
	@$(NORMAL_UNINSTALL)
	@-':' #(((
	@{ \
  case ''$(java_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(javadir) in \
        ?*) \
          x=`expr X/$(java_dst) : 'X.*/\(.*\)'` || exit $$?; \
          echo " rm -f '$(DESTDIR)$(javadir)/$$x'"; \
          rm -f $(DESTDIR)$(javadir)/$$x; \
        ;; \
      esac; \
    ;; \
  esac; \
  exit 0; \
:;}

uninstall-java: uninstall-first-java

## end_rules

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
