changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: GATBPS_CONFIG_FILE_RULES.am
##
## For more information, see the GATBPS manual.
##

##
## The GATBPS_CONFIG_FILE_RULES output variable has phony targets that
## are added as prerequisites for distclean-local, but some versions of
## Automake only add distclean-local as a prerequisite for distclean if
## they find distclean-local in Makefile.am. This is the purpose of the
## following line, which otherwise has no effect. Note that Automake is
## always run before the output variable is substituted, so it does not
## see inside the output variable.
##

distclean-local:

@GATBPS_CONFIG_FILE_RULES@

|%}footer_comment({%|##|%}, {%|##|%}, {%|##|%})dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
