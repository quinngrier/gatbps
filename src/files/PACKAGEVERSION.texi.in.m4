changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/PACKAGEVERSION.texi.in.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}){%|
@c
@c Special file: PACKAGEVERSION.texi.in
@c
@c For more information, see the GATBPS manual.
@c
@end ifnotxml
@end ifxml
@set PACKAGEVERSION @PACKAGE_VERSION_TEXI@
@set PACKAGEVERSIONDOCKER @PACKAGE_VERSION_DOCKER_TEXI@
@set PACKAGEVERSIONGIT @PACKAGE_VERSION_GIT_TEXI@
@set PACKAGEVERSIONLIBTOOLA @PACKAGE_VERSION_LIBTOOL_A@
@set PACKAGEVERSIONLIBTOOLR @PACKAGE_VERSION_LIBTOOL_R@
@set PACKAGEVERSIONMAJOR @PACKAGE_VERSION_MAJOR@
@set PACKAGEVERSIONMINOR @PACKAGE_VERSION_MINOR@
@set PACKAGEVERSIONPATCH @PACKAGE_VERSION_PATCH@
@set PACKAGEVERSIONRPMR @PACKAGE_VERSION_RPM_R_TEXI@
@set PACKAGEVERSIONRPMV @PACKAGE_VERSION_RPM_V_TEXI@
@set PACKAGEVERSIONRPMVR @PACKAGE_VERSION_RPM_VR_TEXI@
|%}footer_comment({%|@ifxml
@ifnotxml
@c|%}, {%|@c|%}, {%|@c
@end ifnotxml
@end ifxml|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
