changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/xml.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: xml.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(xml_dst): $(xml_dep)
$(xml_dst): $(xml_src)
	$(AM_V_MAKEINFO)':'
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xml_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xml_src|%}){%||%}dnl
{%|
	$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(xml_src); then \
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
  $(MAKEINFO) \
    '--xml' \
    '--output='$(xml_dst) \
    $(AM_MAKEINFOFLAGS) \
    $(xml_MAKEINFOFLAGS) \
    $(MAKEINFOFLAGS) \
    "$${d}"'/'$(xml_src) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}

.PHONY: clean-xml
.PHONY: clean-xml-main
.PHONY: install-xml
.PHONY: install-xml-main
.PHONY: uninstall-xml
.PHONY: uninstall-xml-main
.PHONY: xml
.PHONY: xml-main

clean-local: clean-xml

clean-xml: clean-xml-main

clean-xml-main:
	-{ \
  case ''$(xml_dst) in \
    ?*) \
      'rm' \
        '-f' \
        './'$(xml_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

install-xml: install-xml-main

install-xml-main: xml-main
	@$(NORMAL_INSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xml_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xmldir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(xml_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      d=$(DESTDIR)$(xmldir); \
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
      if 'test' '-f' $(xml_dst); then \
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
      x="$${x}"'/'$(xml_dst); \
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

uninstall-xml: uninstall-xml-main

uninstall-xml-main:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xml_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|xmldir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(xml_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      ( \
        x=$(xml_dst); \
        x=$${x##*/}; \
        x=$(DESTDIR)$(xmldir)'/'"$${x}"; \
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
        'uninstall-xml-main.tmp' \
      ; \
      'exit' "$${x}"; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

xml: xml-main

xml-main: $(xml_dst)

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
