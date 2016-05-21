changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_JAVA.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_JAVA], [{ ':'

m4_foreach_w(
  [gatbps_x1],
  [$1],
  [
  { ':'

    m4_pushdef(
      [gatbps_x2],
      m4_bpatsubst(gatbps_x1, [[^0-9A-Z_a-z]], [_]))

    GATBPS_JAVA_RULES='

'"$[]{GATBPS_JAVA_RULES}"'

./$[](java_[]gatbps_x2[]_dst): $[](java_[]gatbps_x2[]_extra)
./$[](java_[]gatbps_x2[]_dst): $[](java_[]gatbps_x2[]_src)
	$[](GATBPS_V_JAR)'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp'\'' \
;
	$[](AM@&t@_V_at)$[](MKDIR_P) \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x'\'' \
;
	@-'\'':'\'' #(
	$[](AM@&t@_V_at){ '\'':'\''; \
  f='\''cf'\''; \
  for x in \
    $[](java_[]gatbps_x2[]_extra) \
    $[](java_[]gatbps_x2[]_nested) \
    $[](java_[]gatbps_x2[]_src) \
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
      "$[]$[]{f}" \
      '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x.jar'\'' \
      '\''-C'\'' \
      "$[]$[]{d}" \
      '\''./'\''"$[]$[]{x}" \
    || '\''exit'\'' "$[]$[]{?}"; \
    f='\''uf'\''; \
  done; \
  '\''exit'\'' '\''0'\''; \
}
	$[](AM@&t@_V_at)'\''cd'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x'\'' \
  && $[](JAR) '\''xf'\'' '\''../x.jar'\'' \
;
	$[](AM@&t@_V_at)$[](JAR) \
  '\''cf'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst) \
  '\''-C'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x/'\''$[](GATBPS_SOURCEPATH) \
  '\''.'\'' \
;
	$[](AM@&t@_V_at)-'\''rm'\'' \
  '\''-f'\'' \
  '\''-r'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp'\'' \
;

.PHONY: clean-java-gatbps_x1
.PHONY: install-java-gatbps_x1
.PHONY: java-gatbps_x1
.PHONY: uninstall-java-gatbps_x1

clean-java-gatbps_x1:
	-rm -f $[](java_[]gatbps_x2[]_dst)
	-rm -f $[](java_[]gatbps_x2[]_src) $[](java_[]gatbps_x2[]_nested)

clean-local: clean-java-gatbps_x1

install-java: install-java-gatbps_x1

install-java-gatbps_x1: java-gatbps_x1
	@$[](NORMAL_INSTALL)
	@-'\'':'\'' #(
	@{ '\'':'\''; \
  case '\'''\''$[](javadir) in \
    ?*) \
      echo " $[](MKDIR_P) '\''$[](DESTDIR)$[](javadir)'\''"; \
      $[](MKDIR_P) $[](DESTDIR)$[](javadir) || exit $[]$[]?; \
      if test -f $[](java_[]gatbps_x2[]_dst); then \
        x=$[](java_[]gatbps_x2[]_dst); \
      else \
        x=$[](srcdir)/$[](java_[]gatbps_x2[]_dst); \
      fi; \
      echo " $[](INSTALL_DATA) $[]$[]x '\''$[](DESTDIR)$[](javadir)'\''"; \
      $[](INSTALL_DATA) $[]$[]x $[](DESTDIR)$[](javadir) || exit $[]$[]?; \
    ;; \
  esac; \
  exit 0; \
}

java: java-gatbps_x1

java-gatbps_x1:
	@-'\'':'\'' #((
	{ '\'':'\''; \
  x='\'''\''; \
  x="$[]$[]{x}"'\''./'\''; \
  x="$[]$[]{x}"$[](java_[]gatbps_x2[]_sourcepath); \
  x="$[]$[]{x}"'\'':'\''; \
  x="$[]$[]{x}"$[](srcdir)'\''/'\''$[](java_[]gatbps_x2[]_sourcepath); \
  case '\'''\''$[](CLASSPATH) in \
    ?*) \
      x="$[]$[]{x}"'\'':'\''$[](CLASSPATH); \
    ;; \
  esac; \
  case '\'''\''$[](java_[]gatbps_x2[]_CLASSPATH) in \
    ?*) \
      x="$[]$[]{x}"'\'':'\''$[](java_[]gatbps_x2[]_CLASSPATH); \
    ;; \
  esac; \
  $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
    '\''--'\'' \
    "$[]$[]{x}" \
    >'\''tmpfile'\'' \
  || '\''exit'\'' "$[]$[]{?}"; \
  classpath=`'\''cat'\'' '\''tmpfile'\''` \
  || '\''exit'\'' "$[]$[]{?}"; \
  $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
    '\''--'\'' \
    $[](java_[]gatbps_x2[]_JAVACFLAGS) \
    >'\''tmpfile'\'' \
  || '\''exit'\'' "$[]$[]{?}"; \
  javacflags=`'\''cat'\'' '\''tmpfile'\''` \
  || '\''exit'\'' "$[]$[]{?}"; \
  x='\'''\''; \
  x="$[]$[]{x}"'\''./'\''$[](java_[]gatbps_x2[]_sourcepath); \
  $[](srcdir)'\''/build-aux/sh-form.sh'\'' \
    '\''--'\'' \
    "$[]$[]{x}" \
    >'\''tmpfile'\'' \
  || '\''exit'\'' "$[]$[]{?}"; \
  sourcepath=`'\''cat'\'' '\''tmpfile'\''` \
  || '\''exit'\'' "$[]$[]{?}"; \
  $[](MAKE) \
    $[](AM_MAKEFLAGS) \
    '\''GATBPS_CLASSPATH='\''"$[]$[]{classpath}" \
    '\''GATBPS_JAVACFLAGS='\''"$[]$[]{javacflags}" \
    '\''GATBPS_SOURCEPATH='\''"$[]$[]{sourcepath}" \
    '\''./'\''$[](java_[]gatbps_x2[]_dst) \
  || '\''exit'\'' "$[]$[]{?}"; \
  '\''exit'\'' '\''0'\''; \
}

uninstall-java: uninstall-java-gatbps_x1

uninstall-java-gatbps_x1:
	@$[](NORMAL_UNINSTALL)
	@-'\'':'\'' #(
	@{ '\'':'\''; \
  case '\'''\''$[](javadir) in \
    ?*) \
      x=`expr X/$[](java_[]gatbps_x2[]_dst) : '\''X.*/\(.*\)'\''` || exit $[]$[]?; \
      echo " rm -f '\''$[](DESTDIR)$[](javadir)/$[]$[]x'\''"; \
      rm -f $[](DESTDIR)$[](javadir)/$[]$[]x; \
    ;; \
  esac; \
  exit 0; \
}

'

    m4_popdef([gatbps_x2])

  }])

AC_SUBST([GATBPS_JAVA_RULES])
AM_SUBST_NOTMAKE([GATBPS_JAVA_RULES])

}])dnl
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
