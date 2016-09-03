changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/git.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: git.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_GIT_CLONE = $(GATBPS_V_GIT_CLONE_@AM_V@)

GATBPS_V_GIT_CLONE_ = $(GATBPS_V_GIT_CLONE_@AM_DEFAULT_V@)

GATBPS_V_GIT_CLONE_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  CLONE   ' \
  $@ \
|| 'exit' '1';

GATBPS_V_GIT_CLONE_1 =

GATBPS_V_GIT_ARCHIVE = $(GATBPS_V_GIT_ARCHIVE_@AM_V@)

GATBPS_V_GIT_ARCHIVE_ = $(GATBPS_V_GIT_ARCHIVE_@AM_DEFAULT_V@)

GATBPS_V_GIT_ARCHIVE_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  ARCHIVE ' \
  $@ \
|| 'exit' '1';

GATBPS_V_GIT_ARCHIVE_1 =

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
