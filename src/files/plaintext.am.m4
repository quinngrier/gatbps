changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/rules_code.m4|%})dnl
rules_code({%|src/files/plaintext.am|%})dnl
rules_code({%|src/tools/rules_code|%})dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: plaintext.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(plaintext_dst): $(plaintext_dep)
$(plaintext_dst): $(plaintext_src)
	$(AM_V_MAKEINFO)$(MKDIR_P) './'$(@D)
	$(AM_V_at){ ':'; \
  if test -f $(plaintext_src); then \
    x=$(plaintext_src); \
  else \
    x=$(srcdir)/$(plaintext_src); \
  fi; \
  $(MAKEINFO) \
    --plaintext \
    -o $(plaintext_dst) \
    $(AM_MAKEINFOFLAGS) \
    $(MAKEINFOFLAGS) \
    $$x \
  ; \
  exit $$?; \
}

.PHONY: clean-plaintext
.PHONY: clean-plaintext-more
.PHONY: install-plaintext
.PHONY: install-plaintext-more
.PHONY: plaintext
.PHONY: uninstall-plaintext
.PHONY: uninstall-plaintext-more

clean-local: clean-plaintext

clean-plaintext: clean-plaintext-more
	-rm -f $(plaintext_dst)

install-plaintext: $(plaintext_dst)
install-plaintext: install-plaintext-more
	@$(NORMAL_INSTALL)
	@{ ':'; \
  case ''$(plaintextdir) in \
    ?*) \
      echo " $(MKDIR_P) '$(DESTDIR)$(plaintextdir)'"; \
      $(MKDIR_P) $(DESTDIR)$(plaintextdir) || exit $$?; \
      if test -f $(plaintext_dst); then \
        x=$(plaintext_dst); \
      else \
        x=$(srcdir)/$(plaintext_dst); \
      fi; \
      echo " $(INSTALL_DATA) $$x '$(DESTDIR)$(plaintextdir)'"; \
      $(INSTALL_DATA) $$x $(DESTDIR)$(plaintextdir) || exit $$?; \
    ;; \
  esac; \
  exit 0; \
}

plaintext: $(plaintext_dst)

uninstall-plaintext: uninstall-plaintext-more
	@$(NORMAL_UNINSTALL)
	@{ ':'; \
  case ''$(plaintextdir) in \
    ?*) \
      x=`expr X/$(plaintext_dst) : 'X.*/\(.*\)'` || exit $$?; \
      echo " rm -f '$(DESTDIR)$(plaintextdir)/$$x'"; \
      rm -f $(DESTDIR)$(plaintextdir)/$$x; \
    ;; \
  esac; \
  exit 0; \
}

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
