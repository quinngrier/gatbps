all:

## begin_variables

GATBPS = gatbps

## end_variables

## begin_rules

.PHONY: all

.SUFFIXES:
.SUFFIXES: .texi

.texi:
	$(GATBPS) -I'doc/texi' -- $@

COPYING: COPYING.bot
COPYING: doc/texi/Copyright-Information.texi

INSTALL: INSTALL.bot
INSTALL: doc/texi/Building-and-Installation.texi

README: README.bot
README: doc/texi/Introduction.texi

all: COPYING
all: INSTALL
all: README

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
