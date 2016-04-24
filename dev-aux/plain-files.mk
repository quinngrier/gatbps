all:

## begin_variables

GATBPS = gatbps

GATBPSFLAGS = -Idoc/texi

## end_variables

## begin_rules

.PHONY: all

COPYING: COPYING.bot
COPYING: COPYING.texi
COPYING: doc/texi/Copyright-Information.texi
	$(GATBPS) $(GATBPSFLAGS) COPYING

INSTALL: INSTALL.bot
INSTALL: INSTALL.texi
INSTALL: doc/texi/Building-and-Installation.texi
	$(GATBPS) $(GATBPSFLAGS) INSTALL

all: COPYING
all: INSTALL

## end_rules

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
