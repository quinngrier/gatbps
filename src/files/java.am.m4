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
	$(GATBPS_V_JAR)$(MKDIR_P) $(@D)
	$(AM_V_at)$(JAR) 'cf' $(java_dst) $(java_src)

.PHONY: clean-java
.PHONY: clean-java-all
.PHONY: install-java
.PHONY: install-java-all
.PHONY: install-java-more
.PHONY: java
.PHONY: uninstall-java
.PHONY: uninstall-java-all

.java.class:
	$(GATBPS_V_JAVAC)$(JAVAC) \
  '-classpath' './'$(java_sourcepath) \
  '-d' './'$(java_sourcepath) \
  '-sourcepath' './'$(java_sourcepath)':'$(srcdir)'/'$(java_sourcepath) \
  $(AM_JAVACFLAGS) \
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
install-java-all: install-java-more

java: $(java_dst)

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
