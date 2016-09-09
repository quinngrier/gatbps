changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/tar.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: tar.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_TAR = $(GATBPS_V_TAR_@AM_V@)

GATBPS_V_TAR_ = $(GATBPS_V_TAR_@AM_DEFAULT_V@)

GATBPS_V_TAR_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'TAR'$(GATBPS_V_PAD_RIGHT_3) \
  $@ \
|| 'exit' '1';

GATBPS_V_TAR_1 =

GATBPS_V_UNTAR = $(GATBPS_V_UNTAR_@AM_V@)

GATBPS_V_UNTAR_ = $(GATBPS_V_UNTAR_@AM_DEFAULT_V@)

GATBPS_V_UNTAR_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'UNTAR'$(GATBPS_V_PAD_RIGHT_5) \
  $@ \
|| 'exit' '1';

GATBPS_V_UNTAR_1 =

## end_variables

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
