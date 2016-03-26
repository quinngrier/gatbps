## begin_variables

AM_MAKEINFOFLAGS =
AM_MAKEINFOFLAGS += -I doc/texi -I $(srcdir)/doc/texi

AM_MAKEINFOHTMLFLAGS =
AM_MAKEINFOHTMLFLAGS += $(AM_MAKEINFOFLAGS)
AM_MAKEINFOHTMLFLAGS += --no-split

AM_TEXI2DVIFLAGS =
AM_TEXI2DVIFLAGS += -I doc/texi -I $(srcdir)/doc/texi

CLEANFILES =
CLEANFILES += doc/gatbps.txt
CLEANFILES += doc/gatbps.xml

DISTCLEANFILES =
DISTCLEANFILES += $(GATBPS_CONFIG_FILE_FILES)

EXTRA_DIST =
EXTRA_DIST += AUTHORS
EXTRA_DIST += CC0-1.0.txt
EXTRA_DIST += COPYING
EXTRA_DIST += ChangeLog
EXTRA_DIST += DATE
EXTRA_DIST += INSTALL
EXTRA_DIST += NEWS
EXTRA_DIST += README
EXTRA_DIST += VERSION
EXTRA_DIST += build-aux/DATE.sh
EXTRA_DIST += build-aux/VERSION.sh
EXTRA_DIST += build-aux/sh-form.sh

MOSTLYCLEANFILES =
MOSTLYCLEANFILES += bin/gatbps
MOSTLYCLEANFILES += doc/man/gatbps.1

TEXI2DVI = texi2dvi $(AM_TEXI2DVIFLAGS) $(TEXI2DVIFLAGS)

bin_SCRIPTS =
bin_SCRIPTS += bin/gatbps

doc_gatbps_TEXINFOS =
doc_gatbps_TEXINFOS += doc/texi/AWKDEFAULTTEXI.texi
doc_gatbps_TEXINFOS += doc/texi/Building-and-Installation.texi
doc_gatbps_TEXINFOS += doc/texi/CC0-1.0-appendix.texi
doc_gatbps_TEXINFOS += doc/texi/CC0-1.0-copying.texi
doc_gatbps_TEXINFOS += doc/texi/Copyright-Information.texi
doc_gatbps_TEXINFOS += doc/texi/DATE.texi
doc_gatbps_TEXINFOS += doc/texi/Introduction.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-awk-form-sh.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-gatbps.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-sh-form-sh.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-texi-form-sh.texi
doc_gatbps_TEXINFOS += doc/texi/Invoking-troff-form-sh.texi
doc_gatbps_TEXINFOS += doc/texi/Mathematical-Notation-in-Texinfo.texi
doc_gatbps_TEXINFOS += doc/texi/SEDDEFAULTTEXI.texi
doc_gatbps_TEXINFOS += doc/texi/Special-File-Reference.texi
doc_gatbps_TEXINFOS += doc/texi/TEXIANYDEFAULTTEXI.texi
doc_gatbps_TEXINFOS += doc/texi/VERSION.txi
doc_gatbps_TEXINFOS += doc/texi/bdots.texi
doc_gatbps_TEXINFOS += doc/texi/bothcontents.texi
doc_gatbps_TEXINFOS += doc/texi/dslash.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Asynchronous-Events.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Consequences-of-Errors.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Description.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Environment-Variables.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Exit-Status.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Input-Files.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Operands.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Options.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Output-Files.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Error.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Input.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Standard-Output.texi
doc_gatbps_TEXINFOS += doc/texi/gatbps-Synopsis.texi
doc_gatbps_TEXINFOS += doc/texi/gequ.texi
doc_gatbps_TEXINFOS += doc/texi/ipez.texi
doc_gatbps_TEXINFOS += doc/texi/lcei.texi
doc_gatbps_TEXINFOS += doc/texi/lequ.texi
doc_gatbps_TEXINFOS += doc/texi/lflo.texi
doc_gatbps_TEXINFOS += doc/texi/math.texi
doc_gatbps_TEXINFOS += doc/texi/mdot.texi
doc_gatbps_TEXINFOS += doc/texi/mdots.texi
doc_gatbps_TEXINFOS += doc/texi/msign.texi
doc_gatbps_TEXINFOS += doc/texi/nequ.texi
doc_gatbps_TEXINFOS += doc/texi/prm.texi
doc_gatbps_TEXINFOS += doc/texi/rarrow.texi
doc_gatbps_TEXINFOS += doc/texi/rcei.texi
doc_gatbps_TEXINFOS += doc/texi/rflo.texi
doc_gatbps_TEXINFOS += doc/texi/sbs.texi
doc_gatbps_TEXINFOS += doc/texi/sps.texi

docbookdir = $(docdir)

info_TEXINFOS =
info_TEXINFOS += doc/gatbps.texi

man_MANS =
man_MANS += doc/man/gatbps.1

plaintextdir = $(docdir)

## end_variables

## begin_rules

.PHONY: docbook
.PHONY: install-docbook
.PHONY: install-plaintext
.PHONY: plaintext
.PHONY: uninstall-docbook
.PHONY: uninstall-plaintext

bin/gatbps: doc/help/CC0-1.0-appendix.texi.hd.m4
bin/gatbps: doc/help/CC0-1.0-copying.texi.hd.m4
bin/gatbps: doc/help/CC0-1.0.txt.hd.m4
bin/gatbps: doc/man/gatbps.1.m4
bin/gatbps: src/files/CC0-1.0-appendix.texi.m4
bin/gatbps: src/files/CC0-1.0-copying.texi.m4
bin/gatbps: src/files/GATBPS_ARG_ENABLE_BOOL.m4.m4
bin/gatbps: src/files/GATBPS_ARG_WITH_BOOL.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_CFLAG.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_COMPILE.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_HEADER.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_LIB.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_LINK.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_RUN.m4.m4
bin/gatbps: src/files/GATBPS_CHECK_VARS.m4.m4
bin/gatbps: src/files/GATBPS_CONFIG_FILE.m4.m4
bin/gatbps: src/files/GATBPS_CONFIG_FILE_SUBST.m4.m4
bin/gatbps: src/files/Makefile.am.vim.m4
bin/gatbps: src/files/mtvskipbot.texi.m4
bin/gatbps: src/files/mtvskiptop.texi.m4
bin/gatbps: src/gatbps.m4
	$(M4) src/gatbps.m4 >bin/gatbps
	chmod +x bin/gatbps

doc/gatbps.txt: $(doc_gatbps_TEXINFOS)
doc/gatbps.txt: doc/gatbps.texi
	$(AM_V_MAKEINFO)$(MKDIR_P) doc
	$(AM_V_at){ :; \
  if test -f doc/gatbps.texi; then \
    x=doc/gatbps.texi; \
  else \
    x=$(srcdir)/doc/gatbps.texi; \
  fi; \
  $(MAKEINFO) \
    $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) \
    --plaintext -o doc/gatbps.txt $$x \
  ; \
  exit $$?; \
}

doc/gatbps.xml: $(doc_gatbps_TEXINFOS)
doc/gatbps.xml: doc/gatbps.texi
	$(AM_V_MAKEINFO)$(MKDIR_P) doc
	$(AM_V_at){ :; \
  if test -f doc/gatbps.texi; then \
    x=doc/gatbps.texi; \
  else \
    x=$(srcdir)/doc/gatbps.texi; \
  fi; \
  $(MAKEINFO) \
    $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) \
    --docbook -o doc/gatbps.xml $$x \
  ; \
  exit $$?; \
}

doc/man/gatbps.1: bin/gatbps
	$(MKDIR_P) doc/man
	bin/gatbps --man >doc/man/gatbps.1

docbook: doc/gatbps.xml

install-docbook: doc/gatbps.xml
	@$(NORMAL_INSTALL)
	@-: #(
	@{ :; \
  case ''$(docbookdir) in \
    ?*) \
      echo " $(MKDIR_P) '$(DESTDIR)$(docbookdir)'"; \
      $(MKDIR_P) $(DESTDIR)$(docbookdir) || exit $$?; \
      if test -f doc/gatbps.xml; then \
        x=doc/gatbps.xml; \
      else \
        x=$(srcdir)/doc/gatbps.xml; \
      fi; \
      echo " $(INSTALL_DATA) $$x '$(DESTDIR)$(docbookdir)'"; \
      $(INSTALL_DATA) $$x $(DESTDIR)$(docbookdir) || exit $$?; \
    ;; \
  esac; \
  exit 0; \
}

install-plaintext: doc/gatbps.txt
	@$(NORMAL_INSTALL)
	@-: #(
	@{ :; \
  case ''$(plaintextdir) in \
    ?*) \
      echo " $(MKDIR_P) '$(DESTDIR)$(plaintextdir)'"; \
      $(MKDIR_P) $(DESTDIR)$(plaintextdir) || exit $$?; \
      if test -f doc/gatbps.txt; then \
        x=doc/gatbps.txt; \
      else \
        x=$(srcdir)/doc/gatbps.txt; \
      fi; \
      echo " $(INSTALL_DATA) $$x '$(DESTDIR)$(plaintextdir)'"; \
      $(INSTALL_DATA) $$x $(DESTDIR)$(plaintextdir) || exit $$?; \
    ;; \
  esac; \
  exit 0; \
}

plaintext: doc/gatbps.txt

uninstall-docbook:
	@$(NORMAL_UNINSTALL)
	@-: #(
	@{ :; \
  case ''$(docbookdir) in \
    ?*) \
      echo " rm -f '$(DESTDIR)$(docbookdir)/gatbps.xml'"; \
      rm -f $(DESTDIR)$(docbookdir)/gatbps.xml; \
    ;; \
  esac; \
  exit 0; \
}

uninstall-plaintext:
	@$(NORMAL_UNINSTALL)
	@-: #(
	@{ :; \
  case ''$(plaintextdir) in \
    ?*) \
      echo " rm -f '$(DESTDIR)$(plaintextdir)/gatbps.txt'"; \
      rm -f $(DESTDIR)$(plaintextdir)/gatbps.txt; \
    ;; \
  esac; \
  exit 0; \
}

## end_rules

@GATBPS_CONFIG_FILE_RULES@

include $(srcdir)/build-aux/CC0-1.0-AM-COPYRIGHT.am

##
## The authors of this file have waived all copyright and
## related or neighboring rights to the extent permitted by
## law as described by the CC0 1.0 Universal Public Domain
## Dedication. You should have received a copy of the full
## dedication along with this file, typically as a file
## named <CC0-1.0.txt>. If not, it may be available at
## <https://creativecommons.org/publicdomain/zero/1.0/>.
##
