changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/gatbps.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%||%}dnl
changequote({%|[|%}, {%|]|%})[
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

GATBPS_V_NOP = $(GATBPS_V_NOP_@AM_V@)
GATBPS_V_NOP_ = $(GATBPS_V_NOP_@AM_DEFAULT_V@)
GATBPS_V_NOP_0 =
GATBPS_V_NOP_1 = @-:

]

pushdef([pad], [ifelse($1, 0, , [pad(eval($1 - 1)) ])])
pushdef([GATBPS_V_], [[
GATBPS_V_$1 = $(GATBPS_V_$1_@AM_V@)
GATBPS_V_$1_ = $(GATBPS_V_$1_@AM_DEFAULT_V@)
GATBPS_V_$1_0 = @printf '  %s]pad(eval((88888888 - ifelse($#, 1, [len([$1])], [len([$2])])) % 8))[ %s\n' ]ifelse($#, 1, [[$1]], [[$2]])[ $][@ || :;
GATBPS_V_$1_1 =
]])

GATBPS_V_([ASCIIDOCTOR])
GATBPS_V_([ASCIIDOCTOR_PDF])
GATBPS_V_([GATBPS])

popdef([GATBPS_V_])
popdef([pad])

[

#-----------------------------------------------------------------------
# GATBPS: Asciidoctor rules
#-----------------------------------------------------------------------

]

GATBPS_COMMON_ASCIIDOCTOR_FLAGS = \
  --failure-level=WARN \
  -a attribute-missing=warn \
$(prevent_an_empty_line)

# html

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR)$(ASCIIDOCTOR) ]dnl
[-b html ]dnl
[-o $][@$(TMPEXT).tmp ]dnl
[$(GATBPS_COMMON_ASCIIDOCTOR_FLAGS) ]dnl
[$(AM_ASCIIDOCTOR_FLAGS) ]dnl
[$(ASCIIDOCTOR_FLAGS) ]dnl
[$<
	$(AM_V_at)mv -f $][@$(TMPEXT).tmp $][@
]])

x([.adoc], [.html])

popdef([x])

# manpage

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR)$(ASCIIDOCTOR) ]dnl
[-b manpage ]dnl
[-o $][@$(TMPEXT).tmp ]dnl
[$(GATBPS_COMMON_ASCIIDOCTOR_FLAGS) ]dnl
[$(AM_ASCIIDOCTOR_FLAGS) ]dnl
[$(ASCIIDOCTOR_FLAGS) ]dnl
[$<
	$(AM_V_at)mv -f $][@$(TMPEXT).tmp $][@
]])

x([.adoc], [.1])
x([.adoc], [.2])
x([.adoc], [.3])
x([.adoc], [.4])
x([.adoc], [.5])
x([.adoc], [.6])
x([.adoc], [.7])
x([.adoc], [.8])
x([.adoc], [.9])

popdef([x])

# pdf

pushdef([x], [[
$1$2:
	$(GATBPS_V_ASCIIDOCTOR_PDF)$(ASCIIDOCTOR_PDF) ]dnl
[-o $][@$(TMPEXT).tmp ]dnl
[$(GATBPS_COMMON_ASCIIDOCTOR_FLAGS) ]dnl
[$(AM_ASCIIDOCTOR_PDF_FLAGS) ]dnl
[$(ASCIIDOCTOR_PDF_FLAGS) ]dnl
[$<
	$(AM_V_at)mv -f $][@$(TMPEXT).tmp $][@
]])

x([.adoc], [.pdf])

popdef([x])

[

#-----------------------------------------------------------------------
# GATBPS: Version cache files
#-----------------------------------------------------------------------

]

pushdef([x], [[

$1:
	$(AM_V_GEN)]ifelse(index([$1], /), -1, , [[$(MKDIR_P) $(@D)
	$(AM_V_at)]])[sh $(srcdir)/build-aux/]patsubst([[$1]], [\(.\).*/], [\1])[.sh >$][@$(TMPEXT).tmp
	$(AM_V_at)mv -f $][@$(TMPEXT).tmp $][@

MAINTAINERCLEANFILES += $1

]])

#
# Uncluttered locations.
#

x([build-aux/DATE])
x([build-aux/LTCURRENT])
x([build-aux/VERSION])

#
# Traditional locations.
#

x([DATE])
x([LTCURRENT])
x([VERSION])

popdef([x])

[

#-----------------------------------------------------------------------

]changequote([{%|], [|%}]){%||%}dnl
footer_comment({%|##|%}, {%|##|%}, {%|##|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
