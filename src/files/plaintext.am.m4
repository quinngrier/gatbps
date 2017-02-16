changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/plaintext.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: plaintext.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(plaintext_dst): $(plaintext_dep)
$(plaintext_dst): $(plaintext_src)
	$(AM_V_MAKEINFO)':'
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_src|%}){%||%}dnl
{%|
	$(MKDIR_P) \
  './'$(@D) \
;
	$(AM_V_at){ \
  if 'test' '-f' $(plaintext_src); then \
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
    '--plaintext' \
    '--output='$(plaintext_dst) \
    $(AM_MAKEINFOFLAGS) \
    $(plaintext_MAKEINFOFLAGS) \
    $(MAKEINFOFLAGS) \
    "$${d}"'/'$(plaintext_src) \
  || 'exit' "$${?}"; \
  'exit' '0'; \
:;}

.PHONY: clean-plaintext
.PHONY: clean-plaintext-main
.PHONY: install-plaintext
.PHONY: install-plaintext-main
.PHONY: plaintext
.PHONY: plaintext-main
.PHONY: uninstall-plaintext
.PHONY: uninstall-plaintext-main

clean-local: clean-plaintext

clean-plaintext: clean-plaintext-main

clean-plaintext-main:
	-{ \
  case ''$(plaintext_dst) in \
    ?*) \
      'rm' \
        '-f' \
        './'$(plaintext_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

install-plaintext: install-plaintext-main

install-plaintext-main: plaintext-main
	@$(NORMAL_INSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintextdir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(plaintext_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      d=$(DESTDIR)$(plaintextdir); \
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
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(MKDIR_P) \
          "$${d}" \
        ; \
      fi; \
      $(MKDIR_P) \
        "$${d}" \
      || 'exit' "$${?}"; \
      if 'test' '-f' $(plaintext_dst); then \
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
      x="$${x}"'/'$(plaintext_dst); \
      if $(AM_V_P); then \
        ':'; \
      else \
        $(SHELL) \
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
  'exit' '0'; \
:;}

plaintext: plaintext-main

plaintext-main: $(plaintext_dst)

uninstall-plaintext: uninstall-plaintext-main

uninstall-plaintext-main:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintext_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|plaintextdir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(plaintext_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      ( \
        'expr' \
          'X/'$(plaintext_dst) \
          ':' \
          'X.*/\(.*\)' \
          1>'uninstall-plaintext-main.tmp' \
        || 'exit' "$${?}"; \
        x=$(srcdir); \
        x=` \
          $(SHELL) \
            '-' \
            "$${x}"'/build-aux/sh-form.sh' \
            '--stdin' \
            0<'uninstall-plaintext-main.tmp' \
          ; \
        ` || 'exit' "$${?}"; \
        'eval' 'x='"$${x}"; \
        x=$(DESTDIR)$(plaintextdir)'/'"$${x}"; \
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
        'uninstall-plaintext-main.tmp' \
      ; \
      'exit' "$${x}"; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

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
