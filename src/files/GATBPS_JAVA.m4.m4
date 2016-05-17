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

$[](java_[]gatbps_x2[]_dst): $[](java_[]gatbps_x2[]_src)
$[](java_[]gatbps_x2[]_dst): $[](java_[]gatbps_x2[]_src_extra)
	$[](GATBPS_V_JAR)'\''rm'\'' '\''-f'\'' '\''-r'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp'\'' \
;
	$[](AM@&t@_V_at)$[](MKDIR_P) \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x'\'' \
;
	$[](AM@&t@_V_at){ '\'':'\''; \
  flags='\''cf'\''; \
  for x in \
    $[](java_[]gatbps_x2[]_src) \
    $[](java_[]gatbps_x2[]_src_extra) \
    $[](java_[]gatbps_x2[]_src_inner) \
  ; do \
    if '\''test'\'' '\''-f'\'' "$[]$[]{x}"; then \
      d='\''.'\''; \
    else \
      d=$[](srcdir); \
    fi; \
    $[](JAR) "$[]$[]{flags}" \
      '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x.jar'\'' \
      '\''-C'\'' \
      "$[]$[]{d}" \
      '\''./'\''"$[]$[]{x}" \
    || '\''exit'\'' "$[]$[]{?}"; \
    flags='\''uf'\''; \
  done; \
  '\''exit'\'' '\''0'\''; \
}
	$[](AM@&t@_V_at)'\''cd'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x'\'' \
  && $[](JAR) '\''xf'\'' '\''../x.jar'\'' \
;
	$[](AM@&t@_V_at)$[](JAR) '\''cf'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst) \
  '\''-C'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp/x/'\''$[](GATBPS_SOURCEPATH) \
  '\''.'\'' \
;
	$[](AM@&t@_V_at)-'\''rm'\'' '\''-f'\'' '\''-r'\'' \
  '\''./'\''$[](java_[]gatbps_x2[]_dst)'\''.tmp'\'' \
;

clean-java-gatbps_x1:
	-rm -f $(java_[]gatbps_x2[]_dst)
	-rm -f $(java_[]gatbps_x2[]_src)

clean-local: clean-java-gatbps_x1

install-all-java: install-java-gatbps_x1

install-java-gatbps_x1:
	$[](MAKE) \
  $[](AM_MAKEFLAGS) \
  GATBPS_SOURCEPATH=$[](java_[]gatbps_x2[]_sourcepath) \
  gatbps-install-java-gatbps_x1 \
;

gatbps-install-java-gatbps_x1: $[](java_[]gatbps_x2[]_dst)
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

uninstall-all-java: uninstall-java-gatbps_x1

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
