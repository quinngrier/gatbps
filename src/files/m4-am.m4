changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/m4-am|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: m4.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_M4 = $(GATBPS_V_M4_@AM_V@)

GATBPS_V_M4_ = $(GATBPS_V_M4_@AM_DEFAULT_V@)

GATBPS_V_M4_0 = @'sh' \
  '-' \
  $(srcdir)'/build-aux/echo.sh' \
  '--' \
  '  M4      ' \
  $@ \
;

GATBPS_V_M4_1 =

## end_variables

## begin_rules

.m4:
	$(GATBPS_V_M4)':'
	$(AM_V_at)$(M4) \
  $(AM_M4FLAGS) \
  $(M4FLAGS) \
  <$< \
  >$@ \
;
	$(AM_V_at)$(M4) \
  $(AM_M4FLAGS) \
  $(M4FLAGS) \
  '-D' \
  'make_rules' \
  <$< \
  >$@'.d' \
;

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
