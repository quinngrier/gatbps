all:

## begin_variables

GATBPS = 'gatbps'

GATBPSFLAGS =

## end_variables

## begin_rules

.PHONY: FORCE
.PHONY: all

.SUFFIXES:
.SUFFIXES: .texi

.texi:
	$(GATBPS) \
  '--append-path=doc/texi' \
  '--no-unicode' \
  '--plain' \
  $(GATBPSFLAGS) \
  '--' \
  $@ \
;

COPYING: FORCE

FORCE:

INSTALL: FORCE

NEWS: FORCE

README: FORCE

all: COPYING
all: FORCE
all: INSTALL
all: NEWS
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
