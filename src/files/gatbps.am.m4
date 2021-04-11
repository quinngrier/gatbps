changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%||%}dnl
changequote({%|[|%}, {%|]|%})[
##
## Special file: gatbps.am
##
## For more information, see the GATBPS manual.
##

]dnl--------------------------------------------------------------------

define([gatbps_squish], [patsubst(patsubst(patsubst([[[[$1]]]], [[
	 ]+], [ ]), [^\(..\) ], [\1]), [ \(.\)$], [\1])])

[

##----------------------------------------------------------------------
## Force targets
##----------------------------------------------------------------------

.PHONY: FORCE
FORCE:

##---------------------------------------------------------------------
## Suffix rule suffixes
##----------------------------------------------------------------------

SUFFIXES += .1
SUFFIXES += .2
SUFFIXES += .3
SUFFIXES += .4
SUFFIXES += .5
SUFFIXES += .6
SUFFIXES += .7
SUFFIXES += .8
SUFFIXES += .9
SUFFIXES += .adoc
SUFFIXES += .class
SUFFIXES += .java
SUFFIXES += .m4
SUFFIXES += .m4out

##----------------------------------------------------------------------
## Temporary files
##----------------------------------------------------------------------

TSUF = $(TMPEXT).tmp

##----------------------------------------------------------------------
## Local target activation
##----------------------------------------------------------------------
##
## The @FOO@ substitutions in this file sometimes add prerequisites to
## Automake's *-local targets, but Automake cannot see them because it
## runs before substitution is performed. If these targets are not used
## elsewhere in this file or by the user, then Automake may incorrectly
## assume that they're not being used at all. Listing them here without
## prerequisites is enough to ensure that Automake does the right thing.
##

all-local:
check-local:
clean-local:
distclean-local:
dvi-local:
html-local:
info-local:
install-data-local:
install-dvi-local:
install-exec-local:
install-html-local:
install-info-local:
install-pdf-local:
install-ps-local:
installcheck-local:
installdirs-local:
maintainer-clean-local:
mostlyclean-local:
pdf-local:
ps-local:
uninstall-local:

##----------------------------------------------------------------------
## Recipe tracing
##----------------------------------------------------------------------

GATBPS_RECIPE_MARKER_TOP = : recipe starting: $@
GATBPS_RECIPE_MARKER_BOT = : recipe finished: $@

##----------------------------------------------------------------------
## Silent rule helpers
##----------------------------------------------------------------------

GATBPS_V_NOP = $(GATBPS_V_NOP_@AM_V@)
GATBPS_V_NOP_ = $(GATBPS_V_NOP_@AM_DEFAULT_V@)
GATBPS_V_NOP_0 =
GATBPS_V_NOP_1 = @-:

]

pushdef([pad], [ifelse($1, 0, , [pad(eval($1 - 1)) ])])
pushdef([GATBPS_V_], [[
GATBPS_V_$1 = $(GATBPS_V_$1_@AM_V@)
GATBPS_V_$1_ = $(GATBPS_V_$1_@AM_DEFAULT_V@)
GATBPS_V_$1_0 = @printf '  %s]pad(eval((88888888 - ifelse($#, 1, [len([$1])], [len([$2])])) % 8))[ %s\n' ]ifelse($#, 1, [[$1]], [[$2]])[ $][@ || :;
GATBPS_V_$1_1 =
]])

GATBPS_V_([ASCIIDOCTOR])
GATBPS_V_([ASCIIDOCTOR_PDF], [ASCIIDOCTOR-PDF])
GATBPS_V_([GATBPS])
GATBPS_V_([GUNZIP])
GATBPS_V_([GZIP])
GATBPS_V_([JAR])
GATBPS_V_([JAVAC])
GATBPS_V_([JAVADOC])
GATBPS_V_([JAVA_], [JAVA])
GATBPS_V_([JDEPS])
GATBPS_V_([M4])
GATBPS_V_([MAKE])
GATBPS_V_([TAR])
GATBPS_V_([UNTAR])
GATBPS_V_([UNXZ])
GATBPS_V_([XZ])

popdef([GATBPS_V_])
popdef([pad])

[

##----------------------------------------------------------------------
## Distribution archive rules
##----------------------------------------------------------------------

]

pushdef([x], [[

$(distdir)$1: $(DISTFILES)
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(GATBPS_V_MAKE)$(MAKE) $(AM_MAKEFLAGS) $2
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

]])

x([.shar.gz], [dist-shar])
x([.tar.Z], [dist-tarZ])
x([.tar.bz2], [dist-bzip2])
x([.tar.gz], [dist-gzip])
x([.tar.lz], [dist-lzip])
x([.tar.xz], [dist-xz])
x([.zip], [dist-zip])

popdef([x])

[

##----------------------------------------------------------------------
## Asciidoctor rules
##----------------------------------------------------------------------

]

GATBPS_COMMON_ASCIIDOCTOR_FLAGS = \
  --failure-level=WARN \
  -a attribute-missing=warn \
$(prevent_an_empty_line)

## html

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR)$(ASCIIDOCTOR) ]gatbps_squish([
	  -b html
	  -o $][@$(TSUF)
	  -r asciidoctor-diagram
	  $(GATBPS_COMMON_ASCIIDOCTOR_FLAGS)
	  $(AM_ASCIIDOCTOR_FLAGS)
	  $(ASCIIDOCTOR_FLAGS)
	  $<
	])[
	$(AM_V_at)mv -f $][@$(TSUF) $][@
]])

x([.adoc], [.html])

popdef([x])

## manpage

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR)$(ASCIIDOCTOR) ]gatbps_squish([
	  -b manpage
	  -o $][@$(TSUF)
	  $(GATBPS_COMMON_ASCIIDOCTOR_FLAGS)
	  $(AM_ASCIIDOCTOR_FLAGS)
	  $(ASCIIDOCTOR_FLAGS)
	  $<
	])[
	$(AM_V_at)mv -f $][@$(TSUF) $][@
]])

x([.adoc], [.1])
x([.adoc], [.2])
x([.adoc], [.3])
x([.adoc], [.4])
x([.adoc], [.5])
x([.adoc], [.6])
x([.adoc], [.7])
x([.adoc], [.8])
x([.adoc], [.9])

popdef([x])

## pdf

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR_PDF)$(ASCIIDOCTOR_PDF) ]gatbps_squish([
	  -o $][@$(TSUF)
	  $(GATBPS_COMMON_ASCIIDOCTOR_FLAGS)
	  $(AM_ASCIIDOCTOR_PDF_FLAGS)
	  $(ASCIIDOCTOR_PDF_FLAGS)
	  $<
	])[
	$(AM_V_at)mv -f $][@$(TSUF) $][@
]])

x([.adoc], [.pdf])

popdef([x])

[

##----------------------------------------------------------------------
## Version cache files
##----------------------------------------------------------------------

]

pushdef([x], [[

$1:
	$(AM_V_GEN)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at)rm -f -r ./$][@ ./$][@$(TSUF)*]dnl
ifelse(index([$1], [/]), [-1], [], [[
	$(AM_V_at)$(MKDIR_P) $(@D)]])[
	$(AM_V_at)sh $(srcdir)/build-aux/]dnl
patsubst([[$1]], [\(.\).*/], [\1])[.sh >$][@$(TSUF)
	$(AM_V_at)mv -f $][@$(TSUF) $][@
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

$1/clean: FORCE
	-rm -f -r ./$(@D) ./$(@D)$(TSUF)*

maintainer-clean-local: $1/clean

]])

x([DATE])
x([LTCURRENT])
x([VERSION])
x([build-aux/DATE])
x([build-aux/LTCURRENT])
x([build-aux/VERSION])

popdef([x])

[

##----------------------------------------------------------------------
## Java rules
##----------------------------------------------------------------------

GATBPS_INNER_JAR_SUFFIX = /inner
GATBPS_OUTER_JAR_SUFFIX =

## begin_rules

$(java_dst)$(GATBPS_OUTER_JAR_SUFFIX) java.dummy_1.main: java.FORCE
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(AM_V_at){ \
  ( \
    x=$(java_sourcepath); \
    x=$${x}$(CLASSPATH_SEPARATOR); \
    x=$${x}$(srcdir)/$(java_sourcepath); \
    case ""$(CLASSPATH) in \
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
      $(srcdir)/build-aux/echo.sh -q \
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
        $(srcdir)/build-aux/echo.sh -q \
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
          $(srcdir)/build-aux/echo.sh -q \
          '--' \
          $(GATBPS_JAVACFLAGS) \
          1>'java-main.tmp' \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    javacflags=` \
      'cat' 'java-main.tmp' \
    ` || 'exit' "$${?}"; \
    $(MAKE) \
      $(AM_MAKEFLAGS) \
      'GATBPS_INNER_CLASSPATH='"$${classpath}" \
      'GATBPS_INNER_JAR_SUFFIX=' \
      'GATBPS_INNER_JAVACFLAGS='"$${javacflags}" \
      'GATBPS_INNER_PACKAGE=$(java_package)' \
      GATBPS_INNER_SOURCEPATH=$(java_sourcepath) \
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
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(GATBPS_V_JAVAC)$(GATBPS_V_NOP)
	@{ \
	  case '$(GATBPS_INNER_CLASSPATH)' in \
	    '') \
	      printf '%s\n' ']gatbps_squish([
	        error: the .java.class rule cannot be used directly
	      ])[' >&2; \
	      exit 1; \
	    ;; \
	  esac; \
	}
	@rm -f -r $@ $@$(TSUF)*
	@$(MKDIR_P) $(@D)
	$(AM_V_at)$(JAVAC) ]gatbps_squish([
	  -Xprefer:source
	  -cp $(GATBPS_INNER_CLASSPATH)
	  -d $(GATBPS_INNER_SOURCEPATH)
	  -implicit:none
	  -sourcepath $(GATBPS_INNER_SOURCEPATH)$(CLASSPATH_SEPARATOR)$(srcdir)/$(GATBPS_INNER_SOURCEPATH)
	  $(GATBPS_INNER_JAVACFLAGS)
	  $(JAVACFLAGS)
	  $<
	])[
	@{ \
	  case '$(HAVE_JDEPS)' in \
	    1) \
	      ]ifelse(,,,[
	        We purposely give jdeps an incorrect -cp parameter so it
	        doesn't try to read other .class files, which would be a
	        race condition under make -j. All we want is the list of
	        prerequisite classes for this .class file, which jdeps
	        seems to output just fine without being able to read
	        other .class files.
	      ])[ \
	      $(JDEPS) ]gatbps_squish([
	        -cp .
	        -v
	        $@
	        >$@$(TSUF)1
	      ])[ || exit $$?; \
	      $(AWK) ]gatbps_squish([
	        '
	          BEGIN {
	            r = "$(GATBPS_INNER_PACKAGE)";
	            gsub(/\./, "\\.", r);
	            r = r "\\..*";
	          }
	          {
	            if ($$1 ~ r && $$3 ~ r) {
	              x = $$3;
	              gsub(/\./, "/", x);
	              x = "$(GATBPS_INNER_SOURCEPATH)/" x ".java";
	              print "$@: " x;
	              print x ":";
	            }
	          }
	        '
	        <$@$(TSUF)1
	        >$@$(TSUF)2
	      ])[ || exit $$?; \
	      mv -f $@$(TSUF)2 $@.d || exit $$?; \
	    ;; \
	    *) \
	      >$@.d || exit $$?; \
	    ;; \
	  esac; \
	  touch $@ || exit $$?; \
	}
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

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
          $(srcdir)/build-aux/echo.sh -q \
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
          $(srcdir)/build-aux/echo.sh -q \
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
	$(AM_V_at){ \
  x='x'; \
  for y in $(java_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      ( \
        x=$(java_dst); \
        x=$${x##*/}; \
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
            $(srcdir)/build-aux/echo.sh -q \
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

##----------------------------------------------------------------------
## M4 rules
##----------------------------------------------------------------------

.m4.m4out:
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_TOP)
	$(GATBPS_V_M4)$(GATBPS_V_NOP)
	$(AM_V_at)rm -f -r $@ $@$(TSUF)*
	$(AM_V_at)rm -f -r $@.d
	$(AM_V_at)$(MKDIR_P) $(@D)
	$(AM_V_at)printf '%s: %s\n' $@ $< >$@$(TSUF)1
	$(AM_V_at)$(M4) ]gatbps_squish([
	  $(GATBPS_M4FLAGS)
	  $(M4FLAGS)
	  -D make_rules
	  $<
	  >>$@$(TSUF)1
	])[
	$(AM_V_at)$(M4) ]gatbps_squish([
	  $(GATBPS_M4FLAGS)
	  $(M4FLAGS)
	  $<
	  >$@$(TSUF)2
	])[
	$(AM_V_at)mv -f $@$(TSUF)1 $@.d
	$(AM_V_at)mv -f $@$(TSUF)2 $@
	$(AM_V_at)$(GATBPS_RECIPE_MARKER_BOT)

##----------------------------------------------------------------------

@GATBPS_JAVA_CLASS_RULES@
@GATBPS_M4_RULES@
@GATBPS_TAR_RULES@
@GATBPS_XZ_RULES@

##----------------------------------------------------------------------

]changequote([{%|], [|%}]){%||%}dnl
footer_comment({%|##|%}, {%|##|%}, {%|##|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
