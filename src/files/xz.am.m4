changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/xz.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: xz.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_UNXZ = $(GATBPS_V_UNXZ_@AM_V@)

GATBPS_V_UNXZ_ = $(GATBPS_V_UNXZ_@AM_DEFAULT_V@)

GATBPS_V_UNXZ_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'UNXZ'$(GATBPS_V_PAD_RIGHT_4) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_UNXZ_1 =

GATBPS_V_XZ = $(GATBPS_V_XZ_@AM_V@)

GATBPS_V_XZ_ = $(GATBPS_V_XZ_@AM_DEFAULT_V@)

GATBPS_V_XZ_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'XZ'$(GATBPS_V_PAD_RIGHT_2) \
  $@ \
  0</dev/null \
|| 'exit' "$${?}";

GATBPS_V_XZ_1 =

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
