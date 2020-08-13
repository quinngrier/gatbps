changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: gatbps.am
##
## For more information, see the GATBPS manual.
##

#-----------------------------------------------------------------------
# GATBPS: Suffixes
#-----------------------------------------------------------------------

SUFFIXES += .1
SUFFIXES += .2
SUFFIXES += .3
SUFFIXES += .4
SUFFIXES += .5
SUFFIXES += .6
SUFFIXES += .7
SUFFIXES += .8
SUFFIXES += .9
SUFFIXES += .adoc

#-----------------------------------------------------------------------
# GATBPS: Silent rule helpers
#-----------------------------------------------------------------------

|%}

pushdef({%|pad|%}, {%|ifelse($1, 0, , {%|pad(eval($1 - 1)) |%})|%})
pushdef({%|GATBPS_V_|%}, {%|{%|
GATBPS_V_$1 = $(GATBPS_V_$1_@AM_V@)
GATBPS_V_$1_ = $(GATBPS_V_$1_@AM_DEFAULT_V@)
GATBPS_V_$1_0 = @printf '  %s|%}pad(eval((88888888 - ifelse($#, 1, {%|len({%|$1|%})|%}, {%|len({%|$2|%})|%})) % 8)){%| %s\n' |%}ifelse($#, 1, {%|{%|$1|%}|%}, {%|{%|$2|%}|%}){%| $(@) || :;
GATBPS_V_$1_1 =
|%}|%})

GATBPS_V_({%|ASCIIDOCTOR|%})
GATBPS_V_({%|GATBPS|%})

popdef({%|GATBPS_V_|%})
popdef({%|pad|%})

{%|

#-----------------------------------------------------------------------
# GATBPS: Building man pages from Asciidoctor files
#-----------------------------------------------------------------------

|%}

pushdef({%|x|%}, {%|{%|
$1$2:
	$(GATBPS_V_ASCIIDOCTOR)$(ASCIIDOCTOR) -b manpage -o $(@)$(TMPEXT).tmp $(<) && mv -f $(@)$(TMPEXT).tmp $(@)
|%}|%})

x({%|.adoc|%}, {%|.1|%})
x({%|.adoc|%}, {%|.2|%})
x({%|.adoc|%}, {%|.3|%})
x({%|.adoc|%}, {%|.4|%})
x({%|.adoc|%}, {%|.5|%})
x({%|.adoc|%}, {%|.6|%})
x({%|.adoc|%}, {%|.7|%})
x({%|.adoc|%}, {%|.8|%})
x({%|.adoc|%}, {%|.9|%})

popdef({%|x|%})

{%|

#-----------------------------------------------------------------------

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
