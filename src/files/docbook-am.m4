changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/docbook-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: docbook.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(docbook_dst): $(docbook_dep)
$(docbook_dst): $(docbook_src)
	$(AM_V_MAKEINFO)':'
	$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(docbook_src); then \
    d='.'; \
  else \
    d=$(srcdir); \
    case "$${d}" in \
      '-'*) \
        d='./'"$${d}"; \
      ;; \
    esac; \
  fi; \
  $(MAKEINFO) \
    '--docbook' \
    '--output='$(docbook_dst) \
    $(AM_MAKEINFOFLAGS) \
    $(MAKEINFOFLAGS) \
    "$${d}"'/'$(docbook_src) \
  ; \
  'exit' "$${?}"; \
:;}

.PHONY: clean-docbook
.PHONY: docbook
.PHONY: install-docbook
.PHONY: install-docbook-more
.PHONY: uninstall-docbook
.PHONY: uninstall-docbook-more

clean-docbook:
	-{ \
  case ''$(docbook_dst) in \
    ?*) \
      'rm' '-f' './'$(docbook_dst); \
    ;; \
  esac; \
  'exit' '0'; \
:;}

clean-local: clean-docbook

docbook: $(docbook_dst)

install-docbook: docbook
	@$(NORMAL_INSTALL)
	$(AM_V_at){ \
  case ''$(docbook_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(docbookdir) in \
        ?*) \
          d=$(DESTDIR)$(docbookdir); \
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
          if 'test' '-f' $(docbook_dst); then \
            x='.'; \
          else \
            x=$(srcdir); \
            case "$${x}" in \
              '-'*) \
                x='./'"$${x}"; \
              ;; \
            esac; \
          fi; \
          x="$${x}"'/'$(docbook_dst); \
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

uninstall-docbook:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at){ \
  case ''$(docbook_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      case ''$(docbookdir) in \
        ?*) \
          ( \
            'expr' \
              'X/'$(docbook_dst) \
              ':' \
              'X.*/\(.*\)' \
              >'uninstall-docbook.tmp' \
            || 'exit' "$${?}"; \
            x=$(srcdir); \
            x='x='`'sh' \
              '-' \
              "$${x}"'/build-aux/sh-form.sh' \
              '--stdin' \
              <'uninstall-docbook.tmp' \
            ` || 'exit' "$${?}"; \
            'eval' "$${x}"; \
            x=$(DESTDIR)$(docbookdir)'/'"$${x}"; \
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
            'uninstall-docbook.tmp' \
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
