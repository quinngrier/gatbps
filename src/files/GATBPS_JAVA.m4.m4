changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/rules_code.m4|%})dnl
rules_code({%|src/files/GATBPS_JAVA.m4.m4|%})dnl
rules_code({%|src/tools/rules_code.m4|%})dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_JAVA.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_JAVA], [{

#
# The block that contains this comment is the expansion of the
# GATBPS_JAVA macro.
#
m4_foreach_w(
  [gatbps_x],
  [$1],
  [
  {
    m4_pushdef(
      [gatbps_y],
      m4_bpatsubst(gatbps_x, [[^0-9A-Z_a-z]], [_]))dnl

    gatbps_new_rules='./$[](java_[]gatbps_y[]_dst): $[](java_[]gatbps_y[]_dep)
./$[](java_[]gatbps_y[]_dst): $[](java_[]gatbps_y[]_extra)
./$[](java_[]gatbps_y[]_dst): $[](java_[]gatbps_y[]_src)
	$[](GATBPS_V_JAR){ \
  ( \
    '\''rm'\'' \
      '\''-f'\'' \
      '\''-r'\'' \
      '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    $[](MKDIR_P) \
      '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp/x'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    c='\''cf'\''; \
    for x in \
      $[](java_[]gatbps_y[]_extra) \
      $[](java_[]gatbps_y[]_nested) \
      $[](java_[]gatbps_y[]_src) \
    ; do \
      if '\''test'\'' '\''-f'\'' "$[]$[]{x}"; then \
        d='\''.'\''; \
      else \
        d=$[](srcdir); \
        case "$[]$[]{d}" in \
          '\''-'\''*) \
            d='\''./'\''"$[]$[]{d}"; \
          ;; \
        esac; \
      fi; \
      $[](JAR) \
        "$[]$[]{c}" \
        '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp/x.jar'\'' \
        '\''-C'\'' \
        "$[]$[]{d}" \
        '\''./'\''"$[]$[]{x}" \
      || '\''exit'\'' "$[]$[]{?}"; \
      c='\''uf'\''; \
    done; \
    ( \
      '\''cd'\'' \
        '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp/x'\'' \
      || '\''exit'\'' "$[]$[]{?}"; \
      $[](JAR) \
        '\''xf'\'' \
        '\''../x.jar'\'' \
      || '\''exit'\'' "$[]$[]{?}"; \
      '\''exit'\'' '\''0'\''; \
    :;) || '\''exit'\'' "$[]$[]{?}"; \
    $[](JAR) \
      '\''cf'\'' \
      '\''./'\''$[](java_[]gatbps_y[]_dst) \
      '\''-C'\'' \
      '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp/x/'\''$[](GATBPS_SOURCEPATH) \
      '\''.'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$[]$[]{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''-r'\'' \
    '\''./'\''$[](java_[]gatbps_y[]_dst)'\''.tmp'\'' \
  ; \
  '\''exit'\'' "$[]$[]{x}"; \
:;}

.PHONY: clean-java-gatbps_x
.PHONY: install-java-gatbps_x
.PHONY: java-gatbps_x
.PHONY: uninstall-java-gatbps_x

all-java: java-gatbps_x

clean-java-gatbps_x:
	-{ \
  for x in \
    $[](java_[]gatbps_y[]_dst) \
    $[](java_[]gatbps_y[]_nested) \
    $[](java_[]gatbps_y[]_src) \
  ; do \
    '\''rm'\'' \
      '\''-f'\'' \
      '\''./'\''"$[]$[]{x}" \
    ; \
  done; \
  '\''exit'\'' '\''0'\''; \
:;}

clean-local: clean-java-gatbps_x

install-all-java: install-java-gatbps_x

install-java-gatbps_x: java-gatbps_x
	@$[](NORMAL_INSTALL)
	$[](AM@&t@_V_at){ \
  case '\'''\''$[](java_[]gatbps_y[]_noinst) in \
    ?*) \
      '\'':'\''; \
    ;; \
    *) \
      case '\'''\''$[](javadir) in \
        ?*) \
          d=$[](DESTDIR)$[](javadir); \
          case "$[]$[]{d}" in \
            '\''-'\''*) \
              d='\''./'\''"$[]$[]{d}"; \
            ;; \
          esac; \
          if $[](AM@&t@_V_P); then \
            '\'':'\''; \
          else \
            '\''sh'\'' \
              '\''-'\'' \
              $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
              '\''--'\'' \
              $[](MKDIR_P) \
              "$[]$[]{d}" \
            ; \
          fi; \
          $[](MKDIR_P) \
            "$[]$[]{d}" \
          || '\''exit'\'' "$[]$[]{?}"; \
          if '\''test'\'' '\''-f'\'' $[](java_[]gatbps_y[]_dst); then \
            x='\''.'\''; \
          else \
            x=$[](srcdir); \
            case "$[]$[]{x}" in \
              '\''-'\''*) \
                x='\''./'\''"$[]$[]{x}"; \
              ;; \
            esac; \
          fi; \
          x="$[]$[]{x}"'\''/'\''$[](java_[]gatbps_y[]_dst); \
          if $[](AM@&t@_V_P); then \
            '\'':'\''; \
          else \
            '\''sh'\'' \
              '\''-'\'' \
              $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
              '\''--'\'' \
              $[](INSTALL_DATA) \
              "$[]$[]{x}" \
              "$[]$[]{d}" \
            ; \
          fi; \
          $[](INSTALL_DATA) \
            "$[]$[]{x}" \
            "$[]$[]{d}" \
          || '\''exit'\'' "$[]$[]{?}"; \
        ;; \
      esac; \
    ;; \
  esac; \
  '\''exit'\'' '\''0'\''; \
:;}

java-gatbps_x:
	$[](AM@&t@_V_at){ \
  ( \
    x='\'''\''; \
    x="$[]$[]{x}"'\''./'\''; \
    x="$[]$[]{x}"$[](java_[]gatbps_y[]_sourcepath); \
    x="$[]$[]{x}"'\'':'\''; \
    x="$[]$[]{x}"$[](srcdir)'\''/'\''$[](java_[]gatbps_y[]_sourcepath); \
    case '\'''\''$[](CLASSPATH) in \
      ?*) \
        x="$[]$[]{x}"'\'':'\''$[](CLASSPATH); \
      ;; \
    esac; \
    case '\'''\''$[](java_[]gatbps_y[]_CLASSPATH) in \
      ?*) \
        x="$[]$[]{x}"'\'':'\''$[](java_[]gatbps_y[]_CLASSPATH); \
      ;; \
    esac; \
    '\''sh'\'' \
      '\''-'\'' \
      $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
      '\''--'\'' \
      "$[]$[]{x}" \
      >'\''java-gatbps_x.tmp'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    classpath=`'\''cat'\'' \
      '\''java-gatbps_x.tmp'\'' \
    ` || '\''exit'\'' "$[]$[]{?}"; \
    '\''sh'\'' \
      '\''-'\'' \
      $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
      '\''--'\'' \
      $[](java_[]gatbps_y[]_JAVACFLAGS) \
      >'\''java-gatbps_x.tmp'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    javacflags=`'\''cat'\'' \
      '\''java-gatbps_x.tmp'\'' \
    ` || '\''exit'\'' "$[]$[]{?}"; \
    '\''sh'\'' \
      '\''-'\'' \
      $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
      '\''--'\'' \
      '\''./'\''$[](java_[]gatbps_y[]_sourcepath) \
      >'\''java-gatbps_x.tmp'\'' \
    || '\''exit'\'' "$[]$[]{?}"; \
    sourcepath=`'\''cat'\'' \
      '\''java-gatbps_x.tmp'\'' \
    ` || '\''exit'\'' "$[]$[]{?}"; \
    $[](MAKE) \
      $[](AM@&t@_MAKEFLAGS) \
      '\''GATBPS_CLASSPATH='\''"$[]$[]{classpath}" \
      '\''GATBPS_JAVACFLAGS='\''"$[]$[]{javacflags}" \
      '\''GATBPS_SOURCEPATH='\''"$[]$[]{sourcepath}" \
      '\''./'\''$[](java_[]gatbps_y[]_dst) \
    || '\''exit'\'' "$[]$[]{?}"; \
    '\''exit'\'' '\''0'\''; \
  :;); \
  x="$[]$[]{?}"; \
  '\''rm'\'' \
    '\''-f'\'' \
    '\''java-gatbps_x.tmp'\'' \
  ; \
  '\''exit'\'' "$[]$[]{x}"; \
:;}

uninstall-all-java: uninstall-java-gatbps_x

uninstall-java-gatbps_x:
	@$[](NORMAL_UNINSTALL)
	$[](AM@&t@_V_at){ \
  case '\'''\''$[](java_[]gatbps_y[]_noinst) in \
    ?*) \
      '\'':'\''; \
    ;; \
    *) \
      case '\'''\''$[](javadir) in \
        ?*) \
          ( \
            '\''expr'\'' \
              '\''X/'\''$[](java_[]gatbps_y[]_dst) \
              '\'':'\'' \
              '\''X.*/\(.*\)'\'' \
              >'\''uninstall-java-gatbps_x.tmp'\'' \
            || '\''exit'\'' "$[]$[]{?}"; \
            x=$[](srcdir); \
            x='\''x='\''`'\''sh'\'' \
              '\''-'\'' \
              "$[]$[]{x}"'\''/build-aux/sh-form.sh'\'' \
              '\''--stdin'\'' \
              <'\''uninstall-java-gatbps_x.tmp'\'' \
            ` || '\''exit'\'' "$[]$[]{?}"; \
            '\''eval'\'' "$[]$[]{x}"; \
            x=$[](DESTDIR)$[](javadir)'\''/'\''"$[]$[]{x}"; \
            case "$[]$[]{x}" in \
              '\''-'\''*) \
                x='\''./'\''"$[]$[]{x}"; \
              ;; \
            esac; \
            if $[](AM@&t@_V_P); then \
              '\'':'\''; \
            else \
              '\''sh'\'' \
                '\''-'\'' \
                $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
                '\''--'\'' \
                '\''rm'\'' \
                '\''-f'\'' \
                "$[]$[]{x}" \
              ; \
            fi; \
            '\''rm'\'' \
              '\''-f'\'' \
              "$[]$[]{x}" \
            ; \
            '\''exit'\'' '\''0'\''; \
          :;); \
          x="$[]$[]{?}"; \
          '\''rm'\'' \
            '\''-f'\'' \
            '\''uninstall-java-gatbps_x.tmp'\'' \
          ; \
          '\''exit'\'' "$[]$[]{x}"; \
        ;; \
      esac; \
    ;; \
  esac; \
  '\''exit'\'' '\''0'\''; \
:;}'

    case "$[]{GATBPS_JAVA_RULES}" in
      ?*)
        GATBPS_JAVA_RULES="$[]{GATBPS_JAVA_RULES}"'

'"$[]{gatbps_new_rules}"
      ;;
      *)
        GATBPS_JAVA_RULES="$[]{gatbps_new_rules}"
      ;;
    esac

    m4_popdef([gatbps_y])dnl
  :;}])

AC_SUBST([GATBPS_JAVA_RULES])
AM_SUBST_NOTMAKE([GATBPS_JAVA_RULES])

:;}])dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
