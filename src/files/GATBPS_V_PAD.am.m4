changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/GATBPS_V_PAD.am.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|##|%}, {%|##|%}){%|
##
## Special file: GATBPS_V_PAD.am
##
## For more information, see the GATBPS manual.
##

## begin_variables

GATBPS_V_PAD_LEFT = '  '

GATBPS_V_PAD_RIGHT_1 = ' '$(GATBPS_V_PAD_RIGHT_2)

GATBPS_V_PAD_RIGHT_10 = ' '$(GATBPS_V_PAD_RIGHT_11)

GATBPS_V_PAD_RIGHT_11 = ' '$(GATBPS_V_PAD_RIGHT_12)

GATBPS_V_PAD_RIGHT_12 = ' '$(GATBPS_V_PAD_RIGHT_13)

GATBPS_V_PAD_RIGHT_13 = ' '$(GATBPS_V_PAD_RIGHT_14)

GATBPS_V_PAD_RIGHT_14 = ' '$(GATBPS_V_PAD_RIGHT_15)

GATBPS_V_PAD_RIGHT_15 = ' '$(GATBPS_V_PAD_RIGHT_16)

GATBPS_V_PAD_RIGHT_16 =

GATBPS_V_PAD_RIGHT_2 = ' '$(GATBPS_V_PAD_RIGHT_3)

GATBPS_V_PAD_RIGHT_3 = ' '$(GATBPS_V_PAD_RIGHT_4)

GATBPS_V_PAD_RIGHT_4 = ' '$(GATBPS_V_PAD_RIGHT_5)

GATBPS_V_PAD_RIGHT_5 = ' '$(GATBPS_V_PAD_RIGHT_6)

GATBPS_V_PAD_RIGHT_6 = ' '$(GATBPS_V_PAD_RIGHT_7)

GATBPS_V_PAD_RIGHT_7 = ' '$(GATBPS_V_PAD_RIGHT_8)

GATBPS_V_PAD_RIGHT_8 =

GATBPS_V_PAD_RIGHT_9 = ' '$(GATBPS_V_PAD_RIGHT_10)

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
