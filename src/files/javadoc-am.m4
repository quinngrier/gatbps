changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/javadoc-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: javadoc.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_JAVADOC = $(GATBPS_V_JAVADOC_@AM_V@)

GATBPS_V_JAVADOC_ = $(GATBPS_V_JAVADOC_@AM_DEFAULT_V@)

GATBPS_V_JAVADOC_0 = @'echo' '  JAVADOC' $@;

GATBPS_V_JAVADOC_1 =

## end_variables

## begin_rules

$(javadoc_dst): $(javadoc_src)
$(javadoc_dst): $(javadoc_src_nodist)
	$(GATBPS_V_JAVADOC)rm -f -r $(javadoc_dst)
	$(AM_V_at)$(MKDIR_P) $(javadoc_dst)
	$(AM_V_at){ ':'; \
  src=''; \
  for x in $(javadoc_src) $(javadoc_src_nodist); do \
    if 'test' '-f' "$${x}"; then \
      src="$${src} $${x}"; \
    else \
      src="$${src} $(srcdir)/$${x}"; \
    fi; \
  done; \
  $(JAVADOC) \
    '-d' \
    $(javadoc_dst) \
    $(javadoc_JAVADOCFLAGS) \
    $(JAVADOCFLAGS) \
    $${src} \
  ; \
}

.PHONY: clean-javadoc
.PHONY: clean-javadoc-more
.PHONY: install-javadoc
.PHONY: install-javadoc-more
.PHONY: javadoc
.PHONY: uninstall-javadoc
.PHONY: uninstall-javadoc-more

clean-javadoc: clean-javadoc-more
	-rm -f -r $(javadoc_dst)

clean-local: clean-javadoc

install-javadoc: $(javadoc_dst)
install-javadoc: install-javadoc-more
	@$(NORMAL_INSTALL)
	@{ ':'; \
  case ''$(javadocdir) in \
    ?*) \
      echo " $(MKDIR_P) '$(DESTDIR)$(javadocdir)'"; \
      $(MKDIR_P) $(DESTDIR)$(javadocdir) || exit $$?; \
      if test -d $(javadoc_dst); then \
        x=$(javadoc_dst); \
      else \
        x=$(srcdir)/$(javadoc_dst); \
      fi; \
      echo " cp -R $$x '$(DESTDIR)$(javadocdir)'"; \
      cp -R $$x $(DESTDIR)$(javadocdir) || exit $$?; \
    ;; \
  esac; \
  exit 0; \
}

javadoc: $(javadoc_dst)

uninstall-javadoc: uninstall-javadoc-more
	@$(NORMAL_UNINSTALL)
	@{ ':'; \
  case ''$(javadocdir) in \
    ?*) \
      x=`expr X/$(javadoc_dst) : 'X.*/\(.*\)'` || exit $$?; \
      echo " rm -f -r '$(DESTDIR)$(javadocdir)/$$x'"; \
      rm -f -r $(DESTDIR)$(javadocdir)/$$x; \
    ;; \
  esac; \
  exit 0; \
}

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
