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

$(java_dst): $(java_src)
$(java_dst): $(java_src_extra)
	$(GATBPS_V_JAR)'rm' '-f' '-r' \
  './'$(java_dst)'.tmp' \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(java_dst)'.tmp/x' \
;
	$(AM_V_at){ ':'; \
  flags='cf'; \
  for x in \
    $(java_src) \
    $(java_src_extra) \
    $(java_src_inner) \
  ; do \
    if 'test' '-f' "$${x}"; then \
      d='.'; \
    else \
      d=$(srcdir); \
    fi; \
    $(JAR) "$${flags}" \
      './'$(java_dst)'.tmp/x.jar' \
      '-C' \
      "$${d}" \
      './'"$${x}" \
    || 'exit' "$${?}"; \
    flags='uf'; \
  done; \
  'exit' '0'; \
}
	$(AM_V_at)'cd' \
  './'$(java_dst)'.tmp/x' \
  && $(JAR) 'xf' '../x.jar' \
;
	$(AM_V_at)$(JAR) 'cf' \
  './'$(java_dst) \
  '-C' \
  './'$(java_dst)'.tmp/x/'$(java_sourcepath) \
  '.' \
;
	$(AM_V_at)-'rm' '-f' '-r' \
  './'$(java_dst)'.tmp' \
;

.PHONY: clean-java
.PHONY: clean-java-all
.PHONY: install-java
.PHONY: install-java-all
.PHONY: java
.PHONY: java-all
.PHONY: uninstall-java
.PHONY: uninstall-java-all

.java.class:
	$(GATBPS_V_JAVAC)$(JAVAC) \
  '-classpath' './'$(java_sourcepath) \
  '-d' './'$(java_sourcepath) \
  '-sourcepath' './'$(java_sourcepath)':'$(srcdir)'/'$(java_sourcepath) \
  $(GATBPS_JAVACFLAGS) \
  $(JAVACFLAGS) \
  $< \
;

clean-java:
	-rm -f $(java_dst)
	-rm -f $(java_src)

clean-java-all: clean-java

clean-local: clean-java-all

install-java: $(java_dst)
	@$(NORMAL_INSTALL)
	@-':' #(
	@{ ':'; \
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
  exit 0; \
}

install-java-all: install-java

java: $(java_dst)

java-all: java

uninstall-java:
	@$(NORMAL_UNINSTALL)
	@-':' #(
	@{ ':'; \
  case ''$(javadir) in \
    ?*) \
      x=`expr X/$(java_dst) : 'X.*/\(.*\)'` || exit $$?; \
      echo " rm -f '$(DESTDIR)$(javadir)/$$x'"; \
      rm -f $(DESTDIR)$(javadir)/$$x; \
    ;; \
  esac; \
  exit 0; \
}

uninstall-java-all: uninstall-java

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
