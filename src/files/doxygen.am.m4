changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: doxygen.am
##
## For more information, see the GATBPS manual.
##

## begin_rules

.PHONY: clean-main-doxygen
.PHONY: doxygen
.PHONY: main-doxygen

clean-main-doxygen:
	-{ \
  case ''$(doxygen_dst) in \
    ?*) \
      'rm' '-f' '-r' './'$(doxygen_dst); \
    ;; \
  esac; \
:;}

doxygen: main-doxygen

main-doxygen: $(doxygen_dst)

## end_rules

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