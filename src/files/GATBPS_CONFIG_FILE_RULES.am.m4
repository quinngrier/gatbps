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

@GATBPS_CONFIG_FILE_RULES@

##
## The GATBPS_CONFIG_FILE_RULES output variable adds prerequisites to
## the distclean-local target, but Automake cannot see this because it
## runs before output variable substitution. If the distclean-local
## target does not happen to appear elsewhere, then some versions of
## Automake will omit it as a prerequisite for the distclean target,
## incorrectly disconnecting the new prerequisites. The following line
## solves this problem, ensuring that Automake sees the distclean-local
## target but otherwise having no effect on the meaning of the makefile.
##

distclean-local:

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
