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

GATBPS_V_JAVADOC_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  JAVADOC ' \
  $@ \
;

GATBPS_V_JAVADOC_1 =

## end_variables

## begin_rules

$(javadoc_dst): $(javadoc_src)
$(javadoc_dst): $(javadoc_src_nodist)
	$(GATBPS_V_JAVADOC)':'
	$(AM_V_at){ \
  case ''$(javadoc_dst) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  for x in $(javadoc_src) $(javadoc_src_nodist); do \
    'exit' '0'; \
  done; \
  'exit' '1'; \
:;}
	'rm' \
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
      'sh' \
        '-' \
        $(srcdir)'/build-aux/sh-form.sh' \
        '--' \
        $(JAVADOC) \
        '-d' \
        $(javadoc_dst) \
        $(javadoc_JAVADOCFLAGS) \
        $(JAVADOCFLAGS) \
        >'javadoc-main.tmp1' \
      || 'exit' "$${?}"; \
      x=''; \
      'break'; \
    done; \
    case "$${x}" in \
      ?*) \
        'sh' \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
          '--' \
          $(JAVADOC) \
          '-d' \
          $(javadoc_dst) \
          $(AM_JAVADOCFLAGS) \
          $(JAVADOCFLAGS) \
          >'javadoc-main.tmp1' \
        || 'exit' "$${?}"; \
      ;; \
    esac; \
    $(SED) \
      '$$s/$$/ \\/' \
      <'javadoc-main.tmp1' \
      >'javadoc-main.tmp2' \
    || 'exit' "$${?}"; \
    for x in $(javadoc_src) $(javadoc_src_nodist); do \
      if 'test' '-f' "$${x}"; then \
        d='.'; \
      else \
        d=$(srcdir); \
      fi; \
      'sh' \
        '-' \
        $(srcdir)'/build-aux/sh-form.sh' \
        '--' \
        "$${d}"'/'"$${x}" \
        >'javadoc-main.tmp1' \
      || 'exit' "$${?}"; \
      $(SED) \
        '$$s/$$/ \\/' \
        <'javadoc-main.tmp1' \
        >>'javadoc-main.tmp2' \
      || 'exit' "$${?}"; \
    done; \
    'echo' \
      ';' \
      >>'javadoc-main.tmp2' \
    || 'exit' "$${?}"; \
    x=`'cat' \
      'javadoc-main.tmp2' \
    ` || 'exit' "$${?}"; \
    'eval' "$${x}"; \
    'exit' "$${?}"; \
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
.PHONY: install-javadoc-main
.PHONY: javadoc
.PHONY: uninstall-javadoc-main

clean-javadoc:
	-{ \
  case ''$(javadoc_dst) in \
    ?*) \
      'rm' '-f' '-r' './'$(javadoc_dst); \
    ;; \
  esac; \
  'exit' '0'; \
:;}

clean-local: clean-javadoc

install-javadoc-main: javadoc-main
	@$(NORMAL_INSTALL)
	$(AM_V_at){ \
  case ''$(javadoc_dst) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  case ''$(javadocdir) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  case ''$(javadoc_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      d=$(DESTDIR)$(javadocdir); \
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
      if 'test' '-d' $(javadoc_dst); then \
        x='.'; \
      else \
        x=$(srcdir); \
        case "$${x}" in \
          '-'*) \
            x='./'"$${x}"; \
          ;; \
        esac; \
      fi; \
      x="$${x}"'/'$(javadoc_dst); \
      if $(AM_V_P); then \
        ':'; \
      else \
        'sh' \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
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
        'sh' \
          '-' \
          $(srcdir)'/build-aux/sh-form.sh' \
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

javadoc: $(javadoc_dst)

uninstall-javadoc-main:
	@$(NORMAL_UNINSTALL)
	$(AM_V_at){ \
  case ''$(javadoc_dst) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  case ''$(javadocdir) in \
    ?*) \
      'exit' '0'; \
    ;; \
  esac; \
  'exit' '1'; \
:;}
	$(AM_V_at){ \
  case ''$(javadoc_noinst) in \
    ?*) \
      ':'; \
    ;; \
    *) \
      ( \
        'expr' \
          'X/'$(javadoc_dst) \
          ':' \
          'X.*/\(.*\)' \
          >'uninstall-javadoc-main.tmp' \
        || 'exit' "$${?}"; \
        x=$(srcdir); \
        x=`'sh' \
          '-' \
          "$${x}"'/build-aux/sh-form.sh' \
          '--stdin' \
          <'uninstall-javadoc-main.tmp' \
        ` || 'exit' "$${?}"; \
        'eval' 'x='"$${x}"; \
        x=$(DESTDIR)$(javadocdir)'/'"$${x}"; \
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
        '-r' \
        'uninstall-javadoc-main.tmp' \
      ; \
      'exit' "$${x}"; \
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
