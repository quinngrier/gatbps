changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/javadoc.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/contains_at_least_one_word.m4|%}){%||%}dnl
include({%|src/tools/contains_exactly_one_word.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: javadoc.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

$(javadoc_dst): $(javadoc_src)
$(javadoc_dst): $(javadoc_src_nodist)
	$(GATBPS_V_JAVADOC)':'
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadoc_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_at_least_one_word(
  {%|javadoc_src|%},
  {%|javadoc_src_nodist|%}){%||%}dnl
{%|
	$(AM_V_at)'rm' \
  '-f' \
  '-r' \
  './'$(javadoc_dst) \
;
	$(AM_V_at)$(MKDIR_P) \
  './'$(javadoc_dst) \
;
	$(AM_V_at){ \
  ( \
    x='x'; \
    for y in $(javadoc_JAVADOCFLAGS); do \
      $(SHELL) \
        '-' \
        $(srcdir)/build-aux/echo.sh -q \
        '--' \
        $(JAVADOC) \
        '-d' \
        $(javadoc_dst) \
        $(javadoc_JAVADOCFLAGS) \
        $(JAVADOCFLAGS) \
        1>'javadoc-main.tmp1' \
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
          $(JAVADOC) \
          '-d' \
          $(javadoc_dst) \
          $(GATBPS_JAVADOCFLAGS) \
          $(JAVADOCFLAGS) \
          1>'javadoc-main.tmp1' \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    $(SED) \
      '$$s/$$/ \\/' \
      0<'javadoc-main.tmp1' \
      1>'javadoc-main.tmp2' \
    || 'exit' "$${?}"; \
    for x in $(javadoc_src) $(javadoc_src_nodist); do \
      if 'test' '-f' "$${x}"; then \
        d='.'; \
      else \
        d=$(srcdir); \
      fi; \
      $(SHELL) \
        '-' \
        $(srcdir)/build-aux/echo.sh -q \
        '--' \
        "$${d}"'/'"$${x}" \
        1>'javadoc-main.tmp1' \
      || 'exit' "$${?}"; \
      $(SED) \
        '$$s/$$/ \\/' \
        0<'javadoc-main.tmp1' \
        1>>'javadoc-main.tmp2' \
      || 'exit' "$${?}"; \
    done; \
    'echo' \
      ';' \
      1>>'javadoc-main.tmp2' \
    || 'exit' "$${?}"; \
    $(SHELL) \
      '-' \
      'javadoc-main.tmp2' \
    || 'exit' "$${?}"; \
    'exit' '0'; \
  :;); \
  x="$${?}"; \
  'rm' \
    '-f' \
    'javadoc-main.tmp1' \
    'javadoc-main.tmp2' \
  ; \
  'exit' "$${x}"; \
:;}

.PHONY: clean-javadoc
.PHONY: clean-javadoc-main
.PHONY: install-javadoc
.PHONY: install-javadoc-main
.PHONY: javadoc
.PHONY: javadoc-main
.PHONY: uninstall-javadoc
.PHONY: uninstall-javadoc-main

clean-javadoc: clean-javadoc-main

clean-javadoc-main:
	-{ \
  case ''$(javadoc_dst) in \
    ?*) \
      'rm' \
        '-f' \
        '-r' \
        './'$(javadoc_dst) \
      ; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

clean-local: clean-javadoc

install-javadoc: install-javadoc-main

install-javadoc-main: javadoc-main
	@$(NORMAL_INSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadoc_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadocdir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(javadoc_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      d=$(DESTDIR)$(javadocdir); \
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
      if 'test' '-d' $(javadoc_dst); then \
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
      x="$${x}"'/'$(javadoc_dst); \
      if $(AM_V_P); then \
        ':'; \
      else \
        $(SHELL) \
          '-' \
          $(srcdir)/build-aux/echo.sh -q \
          '--' \
          'rm' \
          '-f' \
          '-r' \
          "$${x}" \
        ; \
      fi; \
      'rm' \
        '-f' \
        '-r' \
        "$${x}" \
      || 'exit' "$${?}"; \
      if $(AM_V_P); then \
        ':'; \
      else \
        $(SHELL) \
          '-' \
          $(srcdir)/build-aux/echo.sh -q \
          '--' \
          'cp' \
          '-R' \
          "$${x}" \
          "$${d}" \
        ; \
      fi; \
      'cp' \
        '-R' \
        "$${x}" \
        "$${d}" \
      || 'exit' "$${?}"; \
    ;; \
  esac; \
  'exit' '0'; \
:;}

javadoc: javadoc-main

javadoc-main: $(javadoc_dst)

uninstall-javadoc: uninstall-javadoc-main

uninstall-javadoc-main:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadoc_dst|%}){%||%}dnl
{%|
	$(AM_V_at)|%}contains_exactly_one_word(
  {%|javadocdir|%}){%||%}dnl
{%|
	$(AM_V_at){ \
  x='x'; \
  for y in $(javadoc_noinst); do \
    x=''; \
    'break'; \
  done; \
  case "$${x}" in \
    ?*) \
      ( \
        x=$(javadoc_dst); \
        x=$${x##*/}; \
        x=$(DESTDIR)$(javadocdir)'/'"$${x}"; \
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
            '-r' \
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
        'uninstall-javadoc-main.tmp' \
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
