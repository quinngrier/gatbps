changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: docbook.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(docbook_dst): $(docbook_dep)
$(docbook_dst): $(docbook_src)
	$(AM_V_MAKEINFO)$(MKDIR_P) $(@D)
	$(AM_V_at){ :; \
  if test -f $(docbook_src); then \
    x=$(docbook_src); \
  else \
    x=$(srcdir)/$(docbook_src); \
  fi; \
  $(MAKEINFO) \
    --docbook \
    -o $(docbook_dst) \
    $(AM_MAKEINFOFLAGS) \
    $(MAKEINFOFLAGS) \
    $$x \
  ; \
  exit $$?; \
}

.PHONY: clean-docbook
.PHONY: clean-docbook-more
.PHONY: docbook
.PHONY: install-docbook
.PHONY: install-docbook-more
.PHONY: uninstall-docbook
.PHONY: uninstall-docbook-more

clean-docbook: clean-docbook-more
	-rm -f $(docbook_dst)

clean-local: clean-docbook

docbook: $(docbook_dst)

install-docbook: $(docbook_dst)
install-docbook: install-docbook-more
	@$(NORMAL_INSTALL)
	@-: #(
	@{ :; \
  case ''$(docbookdir) in \
    ?*) \
      echo " $(MKDIR_P) '$(DESTDIR)$(docbookdir)'"; \
      $(MKDIR_P) $(DESTDIR)$(docbookdir) || exit $$?; \
      if test -f $(docbook_dst); then \
        x=$(docbook_dst); \
      else \
        x=$(srcdir)/$(docbook_dst); \
      fi; \
      echo " $(INSTALL_DATA) $$x '$(DESTDIR)$(docbookdir)'"; \
      $(INSTALL_DATA) $$x $(DESTDIR)$(docbookdir) || exit $$?; \
    ;; \
  esac; \
  exit 0; \
}

uninstall-docbook: uninstall-docbook-more
	@$(NORMAL_UNINSTALL)
	@-: #(
	@{ :; \
  case ''$(docbookdir) in \
    ?*) \
      x=`expr X/$(docbook_dst) : 'X.*/\(.*\)'` || exit $$?; \
      echo " rm -f '$(DESTDIR)$(docbookdir)/$$x'"; \
      rm -f $(DESTDIR)$(docbookdir)/$$x; \
    ;; \
  esac; \
  exit 0; \
}

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
