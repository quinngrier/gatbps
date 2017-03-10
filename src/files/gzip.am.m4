changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gzip.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: gzip.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_GUNZIP = $(GATBPS_V_GUNZIP_@AM_V@)

GATBPS_V_GUNZIP_ = $(GATBPS_V_GUNZIP_@AM_DEFAULT_V@)

GATBPS_V_GUNZIP_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'GUNZIP'$(GATBPS_V_PAD_RIGHT_6) \
  $@ \
  0<'/dev/null' \
|| 'exit' "$${?}";

GATBPS_V_GUNZIP_1 =

GATBPS_V_GZIP = $(GATBPS_V_GZIP_@AM_V@)

GATBPS_V_GZIP_ = $(GATBPS_V_GZIP_@AM_DEFAULT_V@)

GATBPS_V_GZIP_0 = @$(SHELL) \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  $(GATBPS_V_PAD_LEFT)'GZIP'$(GATBPS_V_PAD_RIGHT_4) \
  $@ \
  0<'/dev/null' \
|| 'exit' "$${?}";

GATBPS_V_GZIP_1 =

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
