changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: plaintext.am
##
## For more information, see the GATBPS manual.
##

$(plaintext_dst): $(plaintext_dep)
$(plaintext_dst): $(plaintext_src)
	$(AM_V_MAKEINFO)$(MKDIR_P) $(@D)
	$(AM_V_at){ :; \
  if test -f $(plaintext_src); then \
    x=$(plaintext_src); \
  else \
    x=$(srcdir)/$(plaintext_src); \
  fi; \
  $(MAKEINFO) \
    $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) \
    --plaintext -o $(plaintext_dst) $$x \
  ; \
  exit $$?; \
}

.PHONY: install-plaintext
.PHONY: plaintext
.PHONY: plaintext-clean
.PHONY: uninstall-plaintext

clean-local: plaintext-clean

install-plaintext: $(plaintext_dst)
	@$(NORMAL_INSTALL)
	@-: #(
	@{ :; \
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

plaintext-clean:
	rm -f $(plaintext_dst)

uninstall-plaintext:
	@$(NORMAL_UNINSTALL)
	@-: #(
	@{ :; \
  case ''$(plaintextdir) in \
    ?*) \
      x=`expr X/$(plaintext_dst) : 'X.*/\(.*\)'` || exit $$?; \
      echo " rm -f '$(DESTDIR)$(plaintextdir)/$$x'"; \
      rm -f $(DESTDIR)$(plaintextdir)/$$x; \
    ;; \
  esac; \
  exit 0; \
}

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
